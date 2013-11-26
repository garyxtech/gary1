//
//  GRY1Action.m
//  gary1
//
//  Created by 薛洪 on 13-11-25.
//  Copyright (c) 2013年 薛洪. All rights reserved.
//

#import "GRY1Action.h"

@implementation GRY1Action

-(id) init: (GRY1ActionEnum) type from: (NSDate*) from to:(NSDate*) to {
    self = [super init];
    if(self){
        NSLog(@"Initing new action...");
        _actionType = type;
        _from = from;
        _to = from;
    }
    return self;
}

-(NSDate*) getFromTime{
    return _from;
}

-(NSDate*) getEndTime{
    return _to;
}

-(void) start:(NSDate *)from{
    NSLog(@"Start action from: %@", from);
    _from = from;
}

-(void) finish:(NSDate *)to{
    NSLog(@"End action to: %@", to);
    _to = to;
}

-(BOOL) isOfType:(GRY1ActionEnum)type{
    return _actionType == type;
}

-(BOOL) isInProgress{
    return _from != nil && _to == nil;
}

@end
