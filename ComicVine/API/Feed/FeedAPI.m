//
//  FeedAPI.m
//  ComicVine
//
//  Created by Gabriel Morales on 2/1/16.
//  Copyright © 2016 Phunware. All rights reserved.
//

#import "FeedAPI.h"
#import "Episode.h"
#import "Character.h"
#import <AFNetworking/AFNetworking.h>

#define APPKEY "c3b1cc6b966139e26dad094415ab84d7abfb3fb8"

@implementation FeedAPI {
    AFHTTPRequestOperationManager *_operationManager;
}

+ (instancetype)api {
    return [[self alloc] init];
}

+ (FeedAPI *)sharedInstance {
    static dispatch_once_t once;
    static FeedAPI *instance;
    dispatch_once(&once, ^{
        if (!instance) {
            instance = [[FeedAPI alloc] init];
        }
    });
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        static NSString *const baseURL = @"https://www.comicvine.com/api/";
        _operationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:baseURL]];
        _operationManager.requestSerializer = [AFJSONRequestSerializer serializer];
        
        AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializer];
        responseSerializer.removesKeysWithNullValues = YES;
        _operationManager.responseSerializer = responseSerializer;
    }
    return self;
}

- (dispatch_queue_t)sharedParserQueue
{
    static dispatch_queue_t sharedQueue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedQueue = dispatch_queue_create("ComicVine-parser", NULL);
    });
    return sharedQueue;
}

- (void)runBlockInParserQueue:(void (^)())block
{
    dispatch_async([self sharedParserQueue], ^{
        if (block != nil) {
            block();
        }
    });
}

- (NSString *)encodedURLStringWithString:(NSString *)urlString
{
    return [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

//http://www.comicvine.com/api/episodes/?api_key=c3b1cc6b966139e26dad094415ab84d7abfb3fb8&format=json&limit=20&sort=air_date:desc
- (void)getEpidodesWithCompletion:(void (^)(NSArray<Episode *>*feed, NSError *error))block {
    NSDictionary *parameters = @{@"api_key" : @APPKEY,
                                 @"format" : @"json",
                                 @"limit" : @20,
                                 @"sort" : @"air_date:desc"};
    [_operationManager GET:[self encodedURLStringWithString:@"episodes"] parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        [self runBlockInParserQueue:^{
            NSDictionary *response = (NSDictionary *)responseObject[@"results"];
            NSMutableArray *parsedFeed = [NSMutableArray array];
            for (NSDictionary *dict in response) {
                [parsedFeed addObject:[Episode episodeWithDictionary:dict]];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                block([parsedFeed copy], nil);
            });
        }];
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        block(nil, error);
    }];
}

//http://www.comicvine.com/api/search/?api_key=c3b1cc6b966139e26dad094415ab84d7abfb3fb8&query=superman&limit=50&format=json
- (void)searchWithName:(NSString *)name withCompletion:(void (^)(NSArray<Character *> *, NSError *))block {
    NSDictionary *params = @{@"api_key" : @APPKEY,
                             @"format" : @"json"};
    [_operationManager GET:[self encodedURLStringWithString:[NSString stringWithFormat:@"search/&query=%@",name]] parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        [self runBlockInParserQueue:^{
            NSDictionary *response = (NSDictionary *)responseObject[@"results"];
            NSMutableArray *parsedResponse = [NSMutableArray array];
            for (NSDictionary *dict in response) {
                [parsedResponse addObject:[Character characterWithDictionary:dict]];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                block([parsedResponse copy], nil);
            });
        }];
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        block(nil, error);
    }];
}

//http://www.comicvine.com/api/character/4005-62027/?api_key=c3b1cc6b966139e26dad094415ab84d7abfb3fb8&format=json



@end
