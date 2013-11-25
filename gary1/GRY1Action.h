//
//  GRY1Action.h
//  gary1
//
//  Created by 薛洪 on 13-11-25.
//  Copyright (c) 2013年 薛洪. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, GRY1ActionEnum) {
    GRY1ActionEnum_EMPTY=0,
    GRY1ActionEnum_BREED,
    GRY1ActionEnum_SLEEP,
    GRY1ActionEnum_PLAY,
    GRY1ActionEnum_DISPOSE
};

@interface GRY1Action : NSObject
@property GRY1ActionEnum actionType;
@property NSDate *from;
@property NSDate *to;
@end
