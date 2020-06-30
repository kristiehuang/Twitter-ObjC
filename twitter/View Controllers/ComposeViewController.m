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

@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UITextView *composeTweetTextView;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)cancelButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)tweetButtonTapped:(id)sender {
    [[APIManager shared] postStatusWithText:self.composeTweetTextView.text completion:^(Tweet * twt, NSError * err) {
        if (twt) {
            
        } else {
            NSLog(@"Error posting tweet. %@", err.localizedDescription);
            //bring up error dialogue box
        }
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }];
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
