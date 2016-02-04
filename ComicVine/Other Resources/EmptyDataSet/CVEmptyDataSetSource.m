//
//  CVEmptyDataSetSource.m
//  ComicVine
//
//  Created by Gabriel Morales on 2/1/16.
//  Copyright © 2016 Phunware. All rights reserved.
//

#import "CVEmptyDataSetSource.h"

@interface CVEmptyDataSetSource()
@property (nonatomic, strong) NSString *emptyTitle;
@property (nonatomic, strong) NSString *emptyDescription;
@end

@implementation CVEmptyDataSetSource

+ (instancetype)emptyDataSetSourceWithTitle:(NSString *)title description:(NSString *)description {
    CVEmptyDataSetSource *source = [[self alloc] init];
    source.emptyTitle = title;
    source.emptyDescription = description;
    return source;
}

#pragma mark - DZNEmptyDataSetSource
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    UIFont *font = [UIFont fontWithName:@"Avenir-Black" size:22.0];
    NSDictionary *attributeDict = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    return [[NSAttributedString alloc] initWithString:_emptyTitle attributes:attributeDict];
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    UIFont *font = [UIFont fontWithName:@"Avenir-Book" size:16.0];
    NSDictionary *attributeDict = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    return [[NSAttributedString alloc] initWithString:_emptyDescription attributes:attributeDict];
}

@end
