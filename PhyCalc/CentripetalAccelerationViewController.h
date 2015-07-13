//
//  CentripetalAccelerationViewController.h
//  PhyCalc
//
//  Created by Cole Johnson on 4/17/15.
//  Copyright (c) 2015 Cole Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CentripetalAccelerationViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *accelerationTextField;
@property (strong, nonatomic) IBOutlet UITextField *velocityTextField;
@property (strong, nonatomic) IBOutlet UITextField *radiusTextField;

- (IBAction)centripetalAccelerationCalculateButtonPress:(id)sender;
- (IBAction)centripetalAccelerationClearButtonPress:(id)sender;

- (float)findAcceleration:(float)v r:(float)radius;
- (float)findVelocity:(float)a r:(float)radius;
- (float)findRadius:(float)a v:(float)velocity;

- (int)howManyEmpty;

- (void)clear;

@end
