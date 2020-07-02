//
//  APIManager.h
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "BDBOAuth1SessionManager.h"
#import "BDBOAuth1SessionManager+SFAuthenticationSession.h"
#import "Tweet.h"

@interface APIManager : BDBOAuth1SessionManager

+ (instancetype)shared;

- (void)getHomeTimelineWithCompletion:(void(^)(NSArray *tweets, NSError *error))completion;

- (void)postStatusWithText:(NSString *)text completion:(void (^)(Tweet *, NSError *))completion;

- (void)getCurrentUser:(void(^)(User *, NSError *))completion;

- (void)likeTweet:(Tweet *)tweet completion:(void (^)(Tweet *, NSError *))completion;

- (void)unlikeTweet:(Tweet *)tweet completion:(void (^)(Tweet *, NSError *))completion;


- (void)retweetTweet:(Tweet *)tweet completion:(void (^)(Tweet *, NSError *))completion;
- (void)unRetweetTweet:(Tweet *)tweet completion:(void (^)(Tweet *, NSError *))completion;

- (void)replyToTweet:(Tweet *)tweet withText:(NSString *)text completion:(void (^)(Tweet *, NSError *))completion;
@end
