//
//  User.h
//  twitter
//
//  Created by Kristie Huang on 6/29/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

// MARK: Properties
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *screenName;
@property (nonatomic, strong) NSURL *profilePicUrl;
@property (nonatomic, strong) NSURL *headerPicUrl;

@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *bio;
@property (nonatomic, strong) NSString *profileUrl;
@property (nonatomic) NSNumber *followerCount;
@property (nonatomic) NSNumber *followingCount;
@property (nonatomic) NSNumber *tweetCount;



- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (instancetype)initFullWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
