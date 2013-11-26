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

-(void)loadRecentActions:(NSArray *)actions{
    _recentActions = actions;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_recentActions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CELL_ID = @"HISTORY_TABLE_CELL_ID";
    UITableViewCell *cell = [tblActionLog dequeueReusableCellWithIdentifier:CELL_ID];
    if(cell==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_ID];
    }
    GRY1Action *action = [_recentActions firstObject];
    if(action){
        [cell.textLabel setText:[action getDipslay]];
    }else{
        [cell.textLabel setText: @"未知"];
    }
    
    return cell;
}




@end
