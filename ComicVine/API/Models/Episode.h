//
//  Episode.h
//  ComicVine
//
//  Created by Gabriel Morales on 2/1/16.
//  Copyright © 2016 Phunware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Episode : NSObject

@property (nonatomic, copy) NSString *airDate;
@property (nonatomic, copy) NSString *aliases;
@property (nonatomic, copy) NSString *apiDetailURL;
@property (nonatomic, copy) NSString *dateAdded;
@property (nonatomic, copy) NSString *dateLastUpdated;
@property (nonatomic, copy) NSString *deck;
@property (nonatomic, copy) NSString *epiDescription;
@property (nonatomic, copy) NSString *epiNumber;
@property (nonatomic, copy) NSString *epiName;
@property (nonatomic, copy) NSString *siteDetailURL;
@property (nonatomic, copy) NSString *imageThumb;
@property (nonatomic, copy) NSString *imageMed;
@property (nonatomic, copy) NSString *imageLarge;
@property (nonatomic, copy) NSString *seriesDetailURL;
@property (nonatomic, copy) NSString *seriesName;
@property (nonatomic, copy) NSString *seriesSiteURL;
//@property (nonatomic) long int epiID;
//@property (nonatomic) long int siteID;


+ (instancetype)episodeWithDictionary:(NSDictionary *)dict;

@end
