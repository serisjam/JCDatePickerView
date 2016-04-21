//
//  JCDayModel.h
//  JCCustomDatePicker
//
//  Created by Jam on 16/4/21.
//  Copyright © 2016年 Jam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCDayModel : NSObject

@property (nonatomic, assign) NSUInteger day;
@property (nonatomic, assign) NSUInteger month;
@property (nonatomic, assign) NSUInteger year;

@property (nonatomic, readonly, assign) NSTimeInterval timeInterval;

+ (JCDayModel *)dayModelWith:(NSTimeInterval)timeInterval;

@end
