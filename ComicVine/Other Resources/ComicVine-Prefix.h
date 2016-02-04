//
//  ComicVine-Prefix.h
//  ComicVine
//
//  Created by Gabriel Morales on 2/1/16.
//  Copyright © 2016 Phunware. All rights reserved.
//

#import <Availability.h>

#ifdef __OBJC__
#import "AFNetworking.h"
#import "Reachability.h"

#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IS_OS_LESS_THAN_8   ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0)

#endif