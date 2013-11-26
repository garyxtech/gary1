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
        NSLog(@"Custom init for gry1 main controller");
        NSLog(@"Creating my baby");
        _myBaby = [[GRY1Baby alloc] init];
        NSLog(@"Baby created");
        NSLog(@"Creating breed controller");
        breedController = [[GRY1BreedViewController alloc] init];
        breedController.delegate = self;
        NSLog(@"Breed controller created");
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
    NSLog(@"Breed button clicked");
    [self presentViewController:breedController animated:true completion:nil];
    NSLog(@"Breed controller presented, loading state...");
    [breedController loadStateForLastBreedTime: [_myBaby getState] withLastBreedTime:nil];
    NSLog(@"State loaded as %d and start time is %@", [_myBaby getState], nil);
}

-(void) didConfirmStartBreed:(GRY1BreedViewController *)controller{
    NSLog(@"Confirm of start breed now");
    [_myBaby startBreed:[NSDate date]];
}

-(void) didConfirmLastBreedDuration:(GRY1BreedViewController *)controller lastBreedDuration:(NSTimeInterval) duration{
    NSLog(@"confirm of end breed by duration: %f", duration);
    [_myBaby endBreedByDuraiton:duration];
}

-(void) didCancelBreedLog:(GRY1BreedViewController *)controller{
    
}

@end
