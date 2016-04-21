//
//  NSIndexPath+JCDatePicker.m
//  JCCustomDatePicker
//
//  Created by Jam on 16/4/21.
//  Copyright © 2016年 Jam. All rights reserved.
//

#import "NSIndexPath+JCDatePicker.h"

@implementation NSIndexPath (JCDatePicker)

+ (instancetype)indexPathForRow:(NSInteger)row inSegment:(NSInteger)segment {
    NSUInteger indexArr[] = {segment, row};
    NSIndexPath *indexPath = [NSIndexPath indexPathWithIndexes:indexArr length:2];
    return indexPath;
}

- (NSInteger)segment {
    return [self indexAtPosition:0];
}

- (NSInteger)row {
    return [self indexAtPosition:1];
}

@end
