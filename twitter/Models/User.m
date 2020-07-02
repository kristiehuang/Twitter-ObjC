//
//  User.m
//  twitter
//
//  Created by Kristie Huang on 6/29/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        self.profilePicUrl = [NSURL URLWithString: dictionary[@"profile_image_url_https"]];
    }
    return self;
}

- (instancetype)initFullWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        
        self.profilePicUrl = [NSURL URLWithString: [dictionary[@"profile_image_url_https"] stringByReplacingOccurrencesOfString:@"_normal" withString:@""]];
        self.headerPicUrl = [NSURL URLWithString:dictionary[@"profile_banner_url"]];
        self.location = dictionary[@"location"];
        self.bio = dictionary[@"description"];
        self.profileUrl = dictionary[@"url"];
        NSLog(@"%@", [dictionary[@"followers_count"] class]);
        self.followerCount = dictionary[@"followers_count"];
        self.followingCount = dictionary[@"friends_count"];
        self.tweetCount = dictionary[@"statuses_count"];

    }
    return self;
}

@end
