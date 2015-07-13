//
//  KinematicNoAccelerationViewController.h
//  PhyCalc
//
//  Created by Cole Johnson on 4/15/15.
//  Copyright (c) 2015 Cole Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KinematicNoAccelerationViewController : UIViewController <UITextFieldDelegate>



@property (strong, nonatomic) IBOutlet UITextField *initialVelocityTextField;
@property (strong, nonatomic) IBOutlet UITextField *finalVelocityTextField;
@property (strong, nonatomic) IBOutlet UITextField *displacementTextField;
@property (strong, nonatomic) IBOutlet UITextField *timeTextField;


- (IBAction)kinematicNoAccelerationButtonPress:(id)sender;
- (IBAction)kinematicNoAccelerationClearButtonPress:(id)sender;




//Declaring methods. Without parameters: "-(return type)methodName;" With parameters: "-(return type)methodName:(param type)param1Name param2Name:(param type)param2Name"
-(float)findInitialVelocity:(float)fV d:(float)d t:(float)t;

-(float)findFinalVelocity:(float)iV d:(float)d t:(float)t;

-(float)findDisplacement:(float)iV fV:(float)fV t:(float)t;

-(float)findTime:(float)iV fV:(float)fV d:(float)d;

-(int)howManyEmpty;

-(void)clear;

@end
