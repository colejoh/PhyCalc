//
//  CentripetalForceViewController.h
//  PhyCalc
//
//  Created by Cole Johnson on 4/17/15.
//  Copyright (c) 2015 Cole Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CentripetalForceViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *forceTextField;
@property (strong, nonatomic) IBOutlet UITextField *massTextField;
@property (strong, nonatomic) IBOutlet UITextField *velocityTextField;
@property (strong, nonatomic) IBOutlet UITextField *radiusTextField;

- (IBAction)centripetalForceCalculateButtonPress:(id)sender;
- (IBAction)centripetalForceClearButtonPress:(id)sender;

- (float)findForce:(float)mass v:(float)v r:(float)r;
- (float)findMass:(float)force v:(float)v r:(float)r;
- (float)findVelocity:(float)force m:(float)m r:(float)r;
- (float)findRadius:(float)force m:(float)m v:(float)v;

- (int)howManyEmpty;
- (void)clear;
@end
