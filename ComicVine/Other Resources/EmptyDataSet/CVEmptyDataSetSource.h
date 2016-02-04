//
//  CVEmptyDataSetSource.h
//  ComicVine
//
//  Created by Gabriel Morales on 2/1/16.
//  Copyright © 2016 Phunware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIScrollView+EmptyDataSet.h"

@interface CVEmptyDataSetSource : NSObject <DZNEmptyDataSetSource>

+ (instancetype)emptyDataSetSourceWithTitle:(NSString *)title
                                description:(NSString *)description;

@end
