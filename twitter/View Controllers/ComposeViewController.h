//
//  ComposeViewController.h
//  twitter
//
//  Created by Kristie Huang on 6/30/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ComposeViewControllerDelegate <NSObject>
- (void)didTweet:(Tweet *)tweet;
@end

@interface ComposeViewController : UIViewController
@property (nonatomic, weak) id<ComposeViewControllerDelegate> delegate;
@property (nonatomic) BOOL isReply;
@property (nonatomic, strong) Tweet *replyTweet;
@end




NS_ASSUME_NONNULL_END
