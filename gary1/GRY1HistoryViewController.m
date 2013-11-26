//
//  GRY1HistoryViewController.m
//  gary1
//
//  Created by 薛洪 on 13-11-26.
//  Copyright (c) 2013年 薛洪. All rights reserved.
//

#import "GRY1HistoryViewController.h"

@interface GRY1HistoryViewController ()

@end

@implementation GRY1HistoryViewController

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

-(void)btnBackClick:(id)sender{
    [delegate didGoBack:self];
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
