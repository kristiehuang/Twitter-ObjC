//
//  ComposeViewController.m
//  twitter
//
//  Created by Kristie Huang on 6/30/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "TimelineViewController.h"
#import "APIManager.h"

@interface ComposeViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *composeTweetTextView;
@property (weak, nonatomic) IBOutlet UILabel *charsRemainingLabel;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.composeTweetTextView.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)textViewDidChange:(UITextView *)textView {
    NSInteger currentChars = 280 - textView.text.length;
    if (currentChars <= 50) {
        self.charsRemainingLabel.textColor = [UIColor redColor];
    }
    if (currentChars <= 0) {
        [textView endEditing:YES];
        [textView setEditable:NO];

    }
    self.charsRemainingLabel.text = [NSString stringWithFormat:@"%ld / 280 chars", (long)currentChars];
}

- (IBAction)cancelButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)tweetButtonTapped:(id)sender {
    if (!self.isReply) {
        [[APIManager shared] postStatusWithText:self.composeTweetTextView.text completion:^(Tweet * twt, NSError * err) {
            if (twt) {
                
            } else {
                NSLog(@"Error posting tweet. %@", err.localizedDescription);
                //bring up error dialogue box
            }
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }];
    } else {
        //apimanager shared
        [[APIManager shared] replyToTweet:self.replyTweet withText:self.composeTweetTextView.text completion:^(Tweet * twt, NSError * err) {
            if (twt) {
                
            } else {
                NSLog(@"Error posting tweet. %@", err.localizedDescription);
                //bring up error dialogue box
            }
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
    }

}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
