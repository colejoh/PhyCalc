//
//  KinematicNoFVViewController.h
//  PhyCalc
//
//  Created by Cole Johnson on 4/15/15.
//  Copyright (c) 2015 Cole Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KinematicNoFVViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *initialVelocityTextField;
@property (strong, nonatomic) IBOutlet UITextField *accelerationTextField;
@property (strong, nonatomic) IBOutlet UITextField *displacementTextField;
@property (strong, nonatomic) IBOutlet UITextField *timeTextField;

- (IBAction)kinematicNoFVButtonPress:(id)sender;
- (IBAction)kinematicNoFVClearButtonPress:(id)sender;



//Declaring methods. Without parameters: "-(return type)methodName;" With parameters: "-(return type)methodName:(param type)param1Name param2Name:(param type)param2Name"
-(float)findInitialVelocity:(float)a d:(float)d t:(float)t;

-(float)findAcceleration:(float)iV d:(float)d t:(float)t;

-(float)findDisplacement:(float)iV a:(float)a t:(float)t;

-(float)findTime:(float)iV a:(float)a d:(float)d;

-(int)howManyEmpty;

-(void)clear;

@end
