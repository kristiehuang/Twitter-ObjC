//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "TweetCellTableViewCell.h"
#import "Tweet.h"
#import "UIImageView+AFNetworking.h"

@interface TimelineViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self getTimeline];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(getTimeline) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
}

- (void)getTimeline {
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            self.tweets = [NSMutableArray arrayWithArray:tweets];
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            for (Tweet *twt in tweets) {
                NSString *text = twt.text;
            }
            [self.tableView reloadData];
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
        [self.refreshControl endRefreshing];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    TweetCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell"];
    
    Tweet *tweet = self.tweets[indexPath.row];
    
    NSLog(@"%@", tweet.text);
    
    [cell.profilePic setImageWithURL:tweet.user.profilePicUrl];
    cell.nameLabel.text = tweet.user.name;
    cell.usernameLabel.text = [NSString stringWithFormat:@"@%@", tweet.user.screenName];
    cell.timeLabel.text = tweet.createdAtString;
    cell.tweetTextLabel.text = tweet.text;
    cell.likeCountLabel.text = [NSString stringWithFormat:@"%d", tweet.favoriteCount];
    cell.retweetCountLabel.text = [NSString stringWithFormat:@"%d", tweet.retweetCount];

    if (tweet.favorited) {
        [cell.likeButton.imageView setImage:[UIImage imageNamed:@"favor-icon-red"]];
    }
    
    if (tweet.retweeted) {
        [cell.retweetButton.imageView setImage:[UIImage imageNamed:@"retweet-icon-green"]];
    }

    
    return cell;
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweets.count;
}

@end
