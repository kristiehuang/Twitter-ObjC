//
//  TweetCellTableViewCell.m
//  twitter
//
//  Created by Kristie Huang on 6/29/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "TweetCellTableViewCell.h"
#import "APIManager.h"
#import "UIImageView+AFNetworking.h"
#import "DateTools.h"
#import "NSDate+DateTools.h"

@implementation TweetCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setUpView:(Tweet *)tweet {
    self.tweet = tweet;
    [self.profilePic setImageWithURL:tweet.user.profilePicUrl];
    self.profilePic.layer.cornerRadius = self.profilePic.frame.size.width / 2;

    self.nameLabel.text = tweet.user.name;
    self.usernameLabel.text = [NSString stringWithFormat:@"@%@", tweet.user.screenName];

    //    self.timeLabel.text = tweet.createdAtString;
    self.timeLabel.text = tweet.timeAgo;

    
    self.tweetTextLabel.text = tweet.text;
    self.likeCountLabel.text = [NSString stringWithFormat:@"%d", tweet.favoriteCount];
    self.retweetCountLabel.text = [NSString stringWithFormat:@"%d", tweet.retweetCount];

    if (tweet.favorited) {
        [self.likeButton setSelected:YES];
    } else {
        [self.likeButton setSelected:NO];
    }
    
    if (tweet.retweeted) {
        [self.retweetButton setSelected:YES];
    } else {
        [self.retweetButton setSelected:NO];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)retweetButtonTapped:(id)sender {

    if (self.tweet.retweeted) {
        self.tweet.retweetCount -= 1;
        [self.retweetButton setSelected:NO];

        [[APIManager shared] unRetweetTweet:self.tweet completion:^(Tweet * twt, NSError * err) {
            if (err) {
                NSLog(@"%@", err.localizedDescription);
            } else {
                NSLog(@"booyah");
            }
        }];
    } else {
        self.tweet.retweetCount += 1;
        [self.retweetButton setSelected:YES];

        [[APIManager shared] retweetTweet:self.tweet completion:^(Tweet * twt, NSError * err) {
            if (err) {
                NSLog(@"%@", err.localizedDescription);
            } else {
                NSLog(@"booyah");
            }
        }];
    }
    

    
    self.tweet.retweeted = !self.tweet.retweeted;
    [self setUpView:self.tweet];

    
}
- (IBAction)likeButtonTapped:(id)sender {

    if (self.tweet.favorited) {
        self.tweet.favoriteCount -= 1;
        [self.likeButton setSelected:NO];

        [[APIManager shared] unlikeTweet:self.tweet completion:^(Tweet * twt, NSError * err) {
            if (err) {
                NSLog(@"%@", err.localizedDescription);
            } else {
                NSLog(@"booyah");
            }
        }];
    } else {
        self.tweet.favoriteCount += 1;
        [self.likeButton setSelected:YES];

        [[APIManager shared] likeTweet:self.tweet completion:^(Tweet * twt, NSError * err) {
            if (err) {
                NSLog(@"%@", err.localizedDescription);
            } else {
                NSLog(@"booyah");
            }
        }];
    }
    self.tweet.favorited = !self.tweet.favorited;
    [self setUpView:self.tweet];


}
- (IBAction)replyButtonTapped:(id)sender {

}


@end
