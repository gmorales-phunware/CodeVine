//
//  FeedAPI.h
//  ComicVine
//
//  Created by Gabriel Morales on 2/1/16.
//  Copyright © 2016 Phunware. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Episode;
@class Character;

@interface FeedAPI : NSObject

//http://www.comicvine.com/api/episodes/?api_key=c3b1cc6b966139e26dad094415ab84d7abfb3fb8&format=json&limit=20&sort=air_date:desc

+ (FeedAPI *)sharedInstance;
+ (instancetype)api;

- (void)getEpidodesWithCompletion:(void (^)(NSArray<Episode *>*feed, NSError *error))block;
- (void)getCharacterWithCompletion:(void (^)(NSArray<Character *>*character, NSError *error))block;
- (void)searchWithName:(NSString *)name withCompletion:(void (^)(NSArray<Character *>*character, NSError *error))block;

@end
