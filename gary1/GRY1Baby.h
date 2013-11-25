//
//  GRY1BabyState.h
//  gary1
//
//  Created by 薛洪 on 13-11-25.
//  Copyright (c) 2013年 薛洪. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, GRY1BabyStateEnum) {
    GRY1BabyStateEnum_IDLE=0,
    GRY1BabyStateEnum_IN_BREED,
    GRY1BabyStateEnum_IN_SLEEP,
    GRY1BabyStateEnum_IN_PLAY
};

@interface GRY1Baby : NSObject
{
}
@property GRY1BabyStateEnum state;
@end
