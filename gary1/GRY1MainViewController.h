//
//  GRY1MainViewController.h
//  gary1
//
//  Created by 薛洪 on 13-11-25.
//  Copyright (c) 2013年 薛洪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GRY1BreedViewController.h"
#import "GRY1HistoryViewController.h"

@interface GRY1MainViewController : UIViewController<GRY1BreedViewControllerDelegate, GRY1HistoryViewControllerDelegate>
{
    
    IBOutlet UIButton *btnBreed;
    IBOutlet UIButton *btnHistory;
 
    GRY1BreedViewController *breedController;
    GRY1HistoryViewController *historyController;
    
    GRY1Baby * _myBaby;
}
-(IBAction) onBtnBreedClick:(id)sender;
-(IBAction) onBtnHistoryClick:(id)sender;

@end
