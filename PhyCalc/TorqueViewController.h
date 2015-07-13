//
//  TorqueViewController.h
//  PhyCalc
//
//  Created by Cole Johnson on 4/17/15.
//  Copyright (c) 2015 Cole Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TorqueViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *torqueTextField;
@property (strong, nonatomic) IBOutlet UITextField *radiusVectorTextField;
@property (strong, nonatomic) IBOutlet UITextField *linearForceTextField;

- (IBAction)torqueCalculateButtonPress:(id)sender;
- (IBAction)torqueClearButtonPress:(id)sender;

- (float)findTorqe:(float)radiusVector andLinear:(float)linearForce;
- (float)findRadiusVector:(float)torque andLinear:(float)linearForce;
- (float)findLinearForce:(float)torque andRadius:(float)radiusVector;
- (int)howManyEmpty;
- (void)clear;

@end
