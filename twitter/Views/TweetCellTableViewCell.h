//
//  TweetCellTableViewCell.h
//  twitter
//
//  Created by Kristie Huang on 6/29/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <STTweetLabel.h>

NS_ASSUME_NONNULL_BEGIN

@interface TweetCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
//@property (weak, nonatomic) IBOutlet STTweetLabel *tweetTextLabel;

//@property (weak, nonatomic) IBOutlet UIButton *retweetButton;
@property (weak, nonatomic) IBOutlet UILabel *retweetCountLabel;
//@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UILabel *likeCountLabel;

@property (nonatomic, strong) NSDictionary *tweet;

@end

NS_ASSUME_NONNULL_END
