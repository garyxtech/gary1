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
        _groupForDay = [[NSMutableArray alloc] init];
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
    
    [self _updateDayGroup];
    
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
    
    [self _updateDayGroup];
    
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
    
    [self _updateDayGroup];
    
}

-(void) _updateDayGroup{
    [_groupForDay removeAllObjects];
    for(GRY1Action *currAction in _recentActions){
        NSDate *dateDay = [GRY1Util stripTime:currAction.getCompareTime];
        if([_groupForDay containsObject:dateDay]){
            ;
        }else{
            if(dateDay){
                [_groupForDay addObject:dateDay];
            }
        }
    }
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

-(NSDate *)getLastBreedStartTime{
    GRY1Action *lastBreed = [self _getLastActionByType:GRY1ActionEnum_BREED];
    if(lastBreed){
        if(lastBreed.getEndTime!=nil){
            return nil;
        }else{
            return lastBreed.getFromTime;
        }
    }else{
        return nil;
    }
}

-(NSArray *)getRecentActions{
    return _recentActions;
}

-(NSInteger)getRecentActionGroupCount{
    return [_groupForDay count];
}

-(NSString *)getGroupTitleForIdx:(NSInteger)groupIdx{
    if(groupIdx >= [_groupForDay count]){
        return @"[未知]";
    }else{
        NSDate *compareTime = [_groupForDay objectAtIndex:groupIdx];
        return [GRY1Util dateToStr:compareTime];
    }
}

-(NSInteger) getActionCountForGroupIdx: (NSInteger) groupIdx{
    return [[_recentActions filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        GRY1Action *action = (GRY1Action*) evaluatedObject;
        NSDate *compareTime = [action getCompareTime];
        compareTime = [GRY1Util stripTime:compareTime];
        NSUInteger idx = [_groupForDay indexOfObject:compareTime];
        if(idx==groupIdx){
            return true;
        }else{
            return false;
        }
    }]] count];
}

-(GRY1Action *) getActionForIdx: (NSInteger) actionIdx forGroupIdx:(NSInteger) groupIdx{
    NSArray *filterActions = [_recentActions filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        GRY1Action *action = (GRY1Action*) evaluatedObject;
        NSDate *compareTime = [action getCompareTime];
        compareTime = [GRY1Util stripTime:compareTime];        
        NSUInteger idx = [_groupForDay indexOfObject:compareTime];
        if(idx==groupIdx){
            return true;
        }else{
            return false;
        }
    }]];
    if(actionIdx >= [filterActions count]){
        return nil;
    }else{
        return [filterActions objectAtIndex:actionIdx];
    }
}

@end
