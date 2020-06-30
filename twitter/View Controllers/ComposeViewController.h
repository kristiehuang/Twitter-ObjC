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

@interface ComposeViewController : UIViewController
@property (nonatomic, weak) id<ComposeViewControllerDelegate> delegate;

@end

@protocol ComposeViewControllerDelegate <NSObject>
- (void)didTweet:(Tweet *)tweet;
@end


NS_ASSUME_NONNULL_END
