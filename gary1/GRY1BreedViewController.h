//
//  GRY1BreedViewController.h
//  gary1
//
//  Created by 薛洪 on 13-11-25.
//  Copyright (c) 2013年 薛洪. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GRY1BreedViewController;

@protocol GRY1BreedViewControllerDelegate <NSObject>

-(void) didConfirmStartBreed: (GRY1BreedViewController*) controller;
-(void) didConfirmLastBreedDuration: (GRY1BreedViewController*) controller lastBreedDuration:(NSTimeInterval) duration;
-(void) didCancelBreedLog: (GRY1BreedViewController*) controller;

@end

@interface GRY1BreedViewController : UIViewController
{
    GRY1BabyStateEnum state;
    
    IBOutlet UILabel *lblCurrentTimePrompt;
    IBOutlet UILabel *lblCurrentTime;
    
    IBOutlet UIButton *btnStartBreed;
    IBOutlet UIButton *btnEndBreed;
    
    IBOutlet UIView *vwStopBreed;
    IBOutlet UIButton *btnSetLastBreedEndTime;
    IBOutlet UIButton *btnSetLastBreedDuration;
    
    IBOutlet UIButton *btnCancel;
    
    IBOutlet UIView *vwDatePick;
    IBOutlet UIDatePicker *pckDate;
    IBOutlet UIButton *btnDatePick;
}

@property (nonatomic, weak) id <GRY1BreedViewControllerDelegate> delegate;

-(IBAction)btnStartBreedClick:(id)sender;
-(IBAction)btnCancelClick:(id)sender;
-(IBAction)btnEndBreedClick:(id)sender;

-(IBAction)btnSetLastBreedTimeClick:(id)sender;
-(IBAction)btnSetLastBreedDurationClick:(id)sender;

-(void) loadStateForLastBreedTime:(GRY1BabyStateEnum) newState withLastBreedTime: (NSDate*) from;

-(IBAction)btnDatePickClick:(id)sender;

@end
