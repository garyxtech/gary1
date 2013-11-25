//
//  GRY1MainViewController.m
//  gary1
//
//  Created by 薛洪 on 13-11-25.
//  Copyright (c) 2013年 薛洪. All rights reserved.
//

#import "GRY1MainViewController.h"

@interface GRY1MainViewController ()

@end

@implementation GRY1MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        myBaby = [[GRY1Baby alloc] init];
        breedController = [[GRY1BreedViewController alloc] init];
        breedController.delegate = self;
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

-(IBAction) onBtnBreedClick:(id)sender{
    [self presentViewController:breedController animated:true completion:nil];
    [breedController loadStateForLastBreedTime:myBaby.state withLastBreedTime:nil];
}

-(void) didConfirmStartBreed:(GRY1BreedViewController *)controller{
    myBaby.state = GRY1BabyStateEnum_IN_BREED;
}

-(void) didConfirmLastBreedDuration:(GRY1BreedViewController *)controller lastBreedDuration:(NSDate *)duration{
    myBaby.state = GRY1BabyStateEnum_IDLE;
}

-(void) didCancelBreedLog:(GRY1BreedViewController *)controller{
    
}

@end
