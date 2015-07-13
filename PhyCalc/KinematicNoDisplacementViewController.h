//
//  KinematicNoDisplacementViewController.h
//  PhyCalc
//
//  Created by Cole Johnson on 4/15/15.
//  Copyright (c) 2015 Cole Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KinematicNoDisplacementViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *initialVelocityTextField;
@property (strong, nonatomic) IBOutlet UITextField *finalVelocityTextField;
@property (strong, nonatomic) IBOutlet UITextField *accelerationTextField;
@property (strong, nonatomic) IBOutlet UITextField *timeTextField;

- (IBAction)kinematicNoDisplacementButtonPress:(id)sender;
- (IBAction)kinematicNoDisplacementClearButtonPress:(id)sender;

//Declaring methods. Without parameters: "-(return type)methodName;" With parameters: "-(return type)methodName:(param type)param1Name param2Name:(param type)param2Name"
-(float)findInitialVelocity:(float)fV a:(float)a t:(float)t;

-(float)findFinalVelocity:(float)iV a:(float)a t:(float)t;

-(float)findAcceleration:(float)iV fV:(float)fV t:(float)t;

-(float)findTime:(float)iV fV:(float)fV a:(float)a;

-(int)howManyEmpty;

-(void)clear;

@end
