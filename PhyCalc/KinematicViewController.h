//
//  KinematicViewController.h
//  PhyCalc
//
//  Created by Cole Johnson on 4/14/15.
//  Copyright (c) 2015 Cole Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface KinematicViewController : UIViewController
//IB outlets for the text fields (I connected them by doing the split interface and control-dragging the textfield to the place in the code)
@property (strong, nonatomic) IBOutlet UITextField *initialVelocityTextField;
@property (strong, nonatomic) IBOutlet UITextField *finalVelocityTextField;
@property (strong, nonatomic) IBOutlet UITextField *accelerationTextField;
@property (strong, nonatomic) IBOutlet UITextField *displacementTextField;
@property (strong, nonatomic) IBOutlet UITextField *timeTextField;


//IB Action for calculate button. Same thing with connecting the TextFields. Switch from 'outlet' to 'action'
- (IBAction)kinematicCalculateButtonPress:(id)sender;


//Declaring methods. Without parameters: "-(return type)methodName;" With parameters: "-(return type)methodName:(param type)param1Name param2Name:(param type)param2Name"
- (float)displacementInitialVelocityTimeAcceleration:(float)d iV:(float)iV t:(float)t a:(float)a;

- (float)finalVelocityInitialVelocityAccelerationDisplacement:(float)fV iV:(float)iV a:(float)a d:(float)d;

- (float)finalVelocityInitialVelocityAccelerationTime:(float)fV iV:(float)iV a:(float)a t:(float)t;

- (float)displacementInitialVelocityFinalVelocityTime:(float)d iV:(float)iV fV:(float)fV t:(float)t;

@end
