//
//  TweetDetailViewController.m
//  twitter
//
//  Created by Kristie Huang on 7/2/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "TweetDetailViewController.h"
#import "STTweetLabel.h"
#import "TweetCellTableViewCell.h"
#import "ComposeViewController.h"

@interface TweetDetailViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *detailTableView;

@end

@implementation TweetDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailTableView.delegate = self;
    self.detailTableView.dataSource = self;
    // Do any additional setup after loading the view.
}
- (IBAction)retweetButtonTapped:(id)sender {
}
- (IBAction)likeButtonTapped:(id)sender {
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual: @"replyTweetSegue"]) {
        UINavigationController *navVC = [segue destinationViewController];
        ComposeViewController *composeVC = [[navVC viewControllers] firstObject];        
        composeVC.replyTweet = self.tweet;
        composeVC.isReply = YES;
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


//TODO: WHEN YOU EXIT OUT AFTER LIKING/RETWEET
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    TweetCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetDetailCell"];
    [cell setUpView:self.tweet];
    cell.timeLabel; //reformat
    cell.retweetCountLabel; //reformat
    cell.likeCountLabel; //reformat;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

@end
