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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    [self.delegate didConfirmLastBreedDuration:self lastBreedDuration:0];
    [self dismissViewControllerAnimated:true completion:nil];
}

-(void) loadStateForLastBreedTime:(GRY1BabyStateEnum)newState withLastBreedTime:(NSDate *)from{
    state = newState;
    if(state == GRY1BabyStateEnum_IN_BREED){
        btnStartBreed.hidden = true;
        vwStopBreed.hidden = false;
    }else{
        btnStartBreed.hidden=false;
        vwStopBreed.hidden=true;
    }
    [lblCurrentTime setText:[GRY1Util dateToStr:[NSDate date]]];
}

@end
