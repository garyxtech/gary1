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

@end
