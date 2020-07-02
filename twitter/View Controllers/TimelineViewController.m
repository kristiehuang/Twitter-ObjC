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
#import "ComposeViewController.h"
#import "TweetDetailViewController.h"

@interface TimelineViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (weak, nonatomic) IBOutlet UIButton *tweetButton;

@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tweetButton.layer.cornerRadius = self.tweetButton.frame.size.width / 2;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;

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



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {


    if ([segue.identifier isEqual: @"replyTweetSegue"]) {
        UINavigationController *navVC = [segue destinationViewController];
        ComposeViewController *composeVC = [[navVC viewControllers] firstObject];
        NSInteger indexNum = [sender tag];
        Tweet *thisTwt = self.tweets[indexNum];
        composeVC.replyTweet = thisTwt;
        composeVC.isReply = YES;
    } else if ([segue.identifier isEqualToString:@"tweetDetailSegue"]) {
        TweetDetailViewController *detailVC = [segue destinationViewController];
        Tweet *thisTwt = [sender tweet];

        detailVC.tweet = thisTwt;
    }
}



- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    TweetCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell"];
    
    Tweet *tweet = self.tweets[indexPath.row];
    cell.replyButton.tag = indexPath.row;
    cell.isDetail = NO;
    [cell setUpView:tweet];

    
    return cell;
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweets.count;
}


@end
