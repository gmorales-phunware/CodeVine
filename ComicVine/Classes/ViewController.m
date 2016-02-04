//
//  ViewController.m
//  ComicVine
//
//  Created by Gabriel Morales on 2/1/16.
//  Copyright © 2016 Phunware. All rights reserved.
//

#import "ViewController.h"
#import "FeedAPI.h"
#import "CVEmptyDataSetSource.h"
#import "CVLoadingErrorEmptyDataSetSource.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, DZNEmptyDataSetDelegate> {
    FeedAPI *_feedAPI;
    NSArray *_episodeItems;
}

@end

@implementation ViewController

- (instancetype)init {
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    _feedAPI = [FeedAPI api];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[FeedAPI api] getEpidodesWithCompletion:^(NSArray<Episode *> *feed, NSError *error) {
        if (feed) {
            _episodeItems = feed;
        } else {
            NSLog(@"Error: %@", error);
        }
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
