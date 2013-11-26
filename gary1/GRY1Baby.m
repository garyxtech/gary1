//
//  GRY1BabyState.m
//  gary1
//
//  Created by 薛洪 on 13-11-25.
//  Copyright (c) 2013年 薛洪. All rights reserved.
//

#import "GRY1Baby.h"

@implementation GRY1Baby

-(id) init{
    self = [super init];
    if(self){
        NSLog(@"Initing new baby");
        _recentActions = [[NSMutableArray alloc] init];
    }
    return self;
}

-(GRY1BabyStateEnum) getState{
    return _state;
}

-(void) startBreed:(NSDate *)startTime{
    
    NSLog(@"Baby start breeding...");
    assert(_state!= GRY1BabyStateEnum_IN_BREED);
    
    NSLog(@"Create new breed action");
    GRY1Action *breedAction = [[GRY1Action alloc] init:GRY1ActionEnum_BREED from:nil to:nil];
    
    NSLog(@"Start breed");
    [breedAction start:[NSDate date]];
    
    [_recentActions addObject:breedAction];
    
    _state = GRY1BabyStateEnum_IN_BREED;
    
}

-(void) endBreedByEndTime:(NSDate *)endTime{
    
    NSLog(@"Baby end breed by time");
    GRY1Action *lastBreed = [self _getLastActionByType:GRY1ActionEnum_BREED];
    NSLog(@"Found last breed action is %@", lastBreed);
    assert(lastBreed);
    assert([lastBreed isInProgress]);
    
    NSLog(@"Finish last breed at %@", endTime);
    [lastBreed finish:endTime];
    
    _state = GRY1BabyStateEnum_IDLE;
    
}

-(void) endBreedByDuraiton:(NSTimeInterval) duration{

    NSLog(@"Baby end breed by duration");
    GRY1Action *lastBreed = [self _getLastActionByType:GRY1ActionEnum_BREED];
    NSLog(@"Found last breed action is %@", lastBreed);
    assert(lastBreed);
    assert([lastBreed isInProgress]);

    NSDate* from = [lastBreed getFromTime];
    NSLog(@"Last from is %@", from);
    NSDate* to = [from dateByAddingTimeInterval:duration];
    NSLog(@"New end time for last from is %@", to);
    NSLog(@"Finish last breed at %@", to);
    [lastBreed finish:to];
    
    _state = GRY1BabyStateEnum_IDLE;
}

-(GRY1Action *) _getLastActionByType: (GRY1ActionEnum) type{
    NSLog(@"Getting last action by type %d", type);
    for(GRY1Action *curr in [_recentActions reverseObjectEnumerator]){
        if([curr isOfType:type]){
            NSLog(@"Found one, return");
            return curr;
        }
    }
    return nil;
}

@end
