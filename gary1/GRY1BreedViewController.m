//
//  GRY1BreedViewController.m
//  gary1
//
//  Created by 薛洪 on 13-11-25.
//  Copyright (c) 2013年 薛洪. All rights reserved.
//

#import "GRY1BreedViewController.h"

@interface GRY1BreedViewController ()

@end

@implementation GRY1BreedViewController

@synthesize delegate;

NSDate *_lastPickDate = nil;
NSTimeInterval _lastPickDuration = -1;
bool _isLastPickForDate = nil;
NSDate *_breedTimeFrom = nil;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btnStartBreedClick:(id)sender{
    [self.delegate didConfirmStartBreed:self];
    [self dismissViewControllerAnimated:true completion:nil];
}

-(IBAction)btnCancelClick:(id)sender{
    [self dismissViewControllerAnimated:true completion:nil];
}

-(IBAction)btnEndBreedClick:(id)sender{
    NSTimeInterval currentDuration = [self _getCurrentDuration];
    [self.delegate didConfirmLastBreedDuration:self lastBreedDuration:currentDuration];
    [self dismissViewControllerAnimated:true completion:nil];
}

-(void) loadStateForLastBreedTime:(GRY1BabyStateEnum)newState withLastBreedTime:(NSDate *)from{
    state = newState;
    _breedTimeFrom = from;
    if(state == GRY1BabyStateEnum_IN_BREED){
        btnStartBreed.hidden = true;
        vwStopBreed.hidden = false;
        [lblCurrentTimePrompt setText:[NSString stringWithFormat:@"上次开始喂奶时间是:"]];
        [lblCurrentTime setText:[GRY1Util dateToStr:_breedTimeFrom]];
    }else{
        btnStartBreed.hidden=false;
        vwStopBreed.hidden=true;
        [lblCurrentTimePrompt setText:[NSString stringWithFormat:@"现在时间是:"]];        
        [lblCurrentTime setText:[GRY1Util dateToStr:[NSDate date]]];
    }
}

-(IBAction) btnSetLastBreedTimeClick:(id)sender{
    [self _showTimePickForDate:true];
}

-(IBAction) btnSetLastBreedDurationClick:(id)sender{
    [self _showTimePickForDate:false];
}

-(IBAction)btnDatePickClick:(id)sender{
    [self _closeAndUpdateDatePick];
}

-(void) _showTimePickForDate:(bool) isForDate{
    _isLastPickForDate = isForDate;
    if(isForDate){
        [pckDate setDatePickerMode:UIDatePickerModeDateAndTime];
    }else{
        [pckDate setDatePickerMode:UIDatePickerModeCountDownTimer];
    }
    vwDatePick.hidden = false;
}

-(void) _closeAndUpdateDatePick{
    
    _lastPickDate = nil;
    _lastPickDuration = -1;
    [btnSetLastBreedEndTime setTitle:@"设定" forState:UIControlStateNormal];
    [btnSetLastBreedDuration setTitle:@"设定" forState:UIControlStateNormal];
    
    if(_isLastPickForDate){
        _lastPickDate = [pckDate date];
        [btnSetLastBreedEndTime setTitle:[GRY1Util dateToStr:_lastPickDate] forState:UIControlStateNormal];
    }else{
        NSDate *time = [pckDate date];
        NSTimeInterval duration = [GRY1Util getSeconds:time];
        int minute = (int) (duration/60);
        _lastPickDuration = duration;
        [btnSetLastBreedDuration setTitle:[NSString stringWithFormat:@"%d minute(s)", minute] forState:UIControlStateNormal];
    }
    
    vwDatePick.hidden = true;
}

-(NSTimeInterval) _getCurrentDuration{
    assert(_breedTimeFrom);
    if(_isLastPickForDate){
        return [_lastPickDate timeIntervalSinceDate:_breedTimeFrom];
    }else{
        return _lastPickDuration;
    }
}

@end
