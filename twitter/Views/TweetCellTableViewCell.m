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

@implementation TweetCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setUpView:(Tweet *)tweet {
    self.tweet = tweet;
    [self.profilePic setImageWithURL:tweet.user.profilePicUrl];
    self.nameLabel.text = tweet.user.name;
    self.usernameLabel.text = [NSString stringWithFormat:@"@%@", tweet.user.screenName];
    self.timeLabel.text = tweet.createdAtString;
    self.tweetTextLabel.text = tweet.text;
    self.likeCountLabel.text = [NSString stringWithFormat:@"%d", tweet.favoriteCount];
    self.retweetCountLabel.text = [NSString stringWithFormat:@"%d", tweet.retweetCount];

    if (tweet.favorited) {
        [self.likeButton.imageView setImage:[UIImage imageNamed:@"favor-icon-red"]];
    }
    
    if (tweet.retweeted) {
        [self.retweetButton.imageView setImage:[UIImage imageNamed:@"retweet-icon-green"]];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)retweetButtonTapped:(id)sender {
    if (self.tweet.retweeted) {
        self.tweet.retweetCount -= 1;
    } else {
        self.tweet.retweetCount += 1;
    }
    self.tweet.retweeted = !self.tweet.retweeted;
    [self.retweetButton setSelected:!self.retweetButton.isSelected];
    [self setUpView:self.tweet];
    
    [[APIManager shared] retweetTweet:self.tweet completion:^(Tweet * twt, NSError * err) {
        if (err) {
            NSLog(@"%@", err.localizedDescription);
        } else {
            NSLog(@"booyah");
        }
    }];
    
}
- (IBAction)likeButtonTapped:(id)sender {
    if (self.tweet.favorited) {
        self.tweet.favoriteCount -= 1;
    } else {
        self.tweet.favoriteCount += 1;
    }
    self.tweet.favorited = !self.tweet.favorited;
    [self.likeButton setSelected:!self.likeButton.isSelected];
    [self setUpView:self.tweet];
    
    [[APIManager shared] likeTweet:self.tweet completion:^(Tweet * twt, NSError * err) {
        if (err) {
            NSLog(@"%@", err.localizedDescription);
        } else {
            NSLog(@"booyah");
        }
    }];
}


@end
