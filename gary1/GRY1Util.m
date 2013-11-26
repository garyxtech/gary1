//
//  GRY1Util.m
//  gary1
//
//  Created by 薛洪 on 13-11-26.
//  Copyright (c) 2013年 薛洪. All rights reserved.
//

#import "GRY1Util.h"

@implementation GRY1Util

static const NSDateFormatter* DATEFORMATTER;

+(void) initialize{
    DATEFORMATTER = [[NSDateFormatter alloc] init];
    [DATEFORMATTER setTimeZone:[NSTimeZone localTimeZone]];
    [DATEFORMATTER setDateFormat:@"yyyy/MM/dd hh:mm"];
}

+(NSString *)dateToStr:(NSDate *)date{
    return [DATEFORMATTER stringFromDate:date];
}

+(NSTimeInterval)getSeconds:(NSDate *)date{
    unsigned unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *comp = [cal components:unitFlags fromDate:date];
    return comp.hour * 60 * 60 + comp.minute * 60 + comp.second;
}

+(NSDate *)stripTime:(NSDate *)date{
    if(date==nil) {
        return nil;
    }
    unsigned int flags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:flags fromDate:date];
    NSDate* dateOnly = [calendar dateFromComponents:components];
    return dateOnly;
}

@end
