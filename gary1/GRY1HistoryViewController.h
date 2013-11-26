//
//  GRY1HistoryViewController.h
//  gary1
//
//  Created by 薛洪 on 13-11-26.
//  Copyright (c) 2013年 薛洪. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GRY1HistoryViewController;

@protocol GRY1HistoryViewControllerDelegate <NSObject>

-(void) didGoBack: (GRY1HistoryViewController*) controller;

@end

@interface GRY1HistoryViewController : UIViewController
{
    IBOutlet UITableView *tblActionLog;
    IBOutlet UIButton *btnBack;
}

@property (nonatomic, weak) id <GRY1HistoryViewControllerDelegate> delegate;

-(IBAction)btnBackClick:(id)sender;

@end
