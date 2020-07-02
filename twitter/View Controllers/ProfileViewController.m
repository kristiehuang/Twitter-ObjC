//
//  ProfileViewController.m
//  twitter
//
//  Created by Kristie Huang on 7/2/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "ProfileViewController.h"
#import "APIManager.h"
#import "UIImageView+AFNetworking.h"
#import "User.h"


@interface ProfileViewController ()
@property (nonatomic, strong) User * user;
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UIImageView *profilePicImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bioLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *followerCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *followingCountLabel;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIStackView *stackView;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[APIManager shared] getCurrentUser:^(User * user, NSError * err) {
        if (err == nil) {
            self.user = user;
            [self setUpProfileView:user];
        } else {
            NSLog(@"Oops, error getting user.");
        }
    }];
    
}
     
- (void)setUpProfileView:(User *)user {
    [self.headerImage setImageWithURL:user.headerPicUrl];
    [self.profilePicImage setImageWithURL:user.profilePicUrl];
    self.profilePicImage.layer.cornerRadius = self.profilePicImage.frame.size.width / 2;
    self.nameLabel.text = user.name;
    self.usernameLabel.text = [NSString stringWithFormat:@"@%@", user.screenName];
    self.bioLabel.text = user.bio;
    self.tweetCountLabel.text = [NSString stringWithFormat:@"%@ Tweets", user.tweetCount];
    self.followerCountLabel.text = [NSString stringWithFormat:@"%@ Followers", user.followerCount];
    self.followingCountLabel.text = [NSString stringWithFormat:@"%@ Following", user.followingCount];


}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
