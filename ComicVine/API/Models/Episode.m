//
//  Episode.m
//  ComicVine
//
//  Created by Gabriel Morales on 2/1/16.
//  Copyright © 2016 Phunware. All rights reserved.
//

#import "Episode.h"

@implementation Episode

//@property (nonatomic, copy) NSString *imageThumb;
//@property (nonatomic, copy) NSString *imageMed;
//@property (nonatomic, copy) NSString *imageLarge;


+ (instancetype)episodeWithDictionary:(NSDictionary *)dict {
    Episode *model = [[self alloc] init];
    model.epiName = dict[@"name"];
    model.aliases = dict[@"aliases"];
    model.epiDescription = dict[@"description"];
    model.airDate = dict[@"air_date"];
    model.apiDetailURL = dict[@"api_detail_url"];
    model.dateAdded = dict[@"date_added"];
    model.dateLastUpdated = dict[@"date_last_updated"];
    model.epiNumber = dict[@"episode_number"];
//    model.epiID = [dict[@"id"] integerValue];
    model.seriesName = dict[@"series"][@"name"];
    model.seriesDetailURL = dict[@"series"][@"api_detail_url"];
    model.seriesSiteURL = dict[@"series"][@"site_detail_url"];
//    model.siteID = [dict[@"series"][@"id"] integerValue];
    model.deck = dict[@"deck"];
    model.siteDetailURL = dict[@"site_detail_url"];
    model.imageThumb = dict[@"image"][@"thumb_url"];
    model.imageMed = dict[@"image"][@"medium_url"];
    model.imageLarge = dict[@"image"][@"super_url"];
    
    return model;
}

@end
