//
//  JCDayModel.m
//  JCCustomDatePicker
//
//  Created by Jam on 16/4/21.
//  Copyright © 2016年 Jam. All rights reserved.
//

#import "JCDayModel.h"

@implementation JCDayModel

+ (JCDayModel *)dayModelWith:(NSTimeInterval)timeInterval {
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit fromDate:date];
    
    JCDayModel *dayModel = [[JCDayModel alloc] initWithTimeInterval:timeInterval];
    dayModel.year = components.year;
    dayModel.month = components.month;
    dayModel.day = components.day;

    return dayModel;
}


- (id)initWithTimeInterval:(NSTimeInterval)timeInterval {
    self = [super init];
    
    if (self) {
        _timeInterval = timeInterval;
    }
    
    return self;
}

@end
