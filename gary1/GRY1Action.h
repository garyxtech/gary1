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

@interface GRY1Action : NSObject{
    GRY1ActionEnum _actionType;
    NSDate *_from;
    NSDate *_to;
}

-(NSDate *) getFromTime;

-(NSDate *) getEndTime;

-(id) init: (GRY1ActionEnum) type from: (NSDate*) from to:(NSDate*) to;

-(void) start:(NSDate*) from;

-(void) finish:(NSDate*) to;

-(BOOL) isOfType: (GRY1ActionEnum) type;

-(BOOL) isInProgress;

-(NSString *) getDipslay;

@end
