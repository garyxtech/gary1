//
//  GRY1MainViewController.h
//  gary1
//
//  Created by 薛洪 on 13-11-25.
//  Copyright (c) 2013年 薛洪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GRY1BreedViewController.h"

@interface GRY1MainViewController : UIViewController<GRY1BreedViewControllerDelegate>
{
    GRY1BreedViewController *breedController;
    IBOutlet UIButton *btnBreed;
    
    GRY1Baby *myBaby;
}
-(IBAction) onBtnBreedClick:(id)sender;
@end
