//
//  NSIndexPath+JCDatePicker.h
//  JCCustomDatePicker
//
//  Created by Jam on 16/4/21.
//  Copyright © 2016年 Jam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSIndexPath (JCDatePicker)

+ (instancetype)indexPathForRow:(NSInteger)row inSegment:(NSInteger)segment;

@property (nonatomic, readonly) NSInteger segment;
@property (nonatomic, readonly) NSInteger row;

@end
