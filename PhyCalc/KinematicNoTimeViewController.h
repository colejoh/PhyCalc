//
//  KinematicNoTimeViewController.h
//  PhyCalc
//
//  Created by Cole Johnson on 4/15/15.
//  Copyright (c) 2015 Cole Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KinematicNoTimeViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *initialVelocityTextField;
@property (strong, nonatomic) IBOutlet UITextField *finalVelocityTextField;
@property (strong, nonatomic) IBOutlet UITextField *accelerationTextField;
@property (strong, nonatomic) IBOutlet UITextField *displacementTextField;

- (IBAction)kinematicNoTimeButtonPress:(id)sender;
- (IBAction)kinematicNoTimeClearButtonPress:(id)sender;


//Declaring methods. Without parameters: "-(return type)methodName;" With parameters: "-(return type)methodName:(param type)param1Name param2Name:(param type)param2Name"
-(float)findInitialVelocity:(float)fV a:(float)a d:(float)d;

-(float)findFinalVelocity:(float)iV a:(float)a d:(float)d;

-(float)findAcceleration:(float)iV fV:(float)fV d:(float)d;

-(float)findDisplacement:(float)iV fV:(float)fV d:(float)d;

-(int)howManyEmpty;

-(void)clear;

@end
