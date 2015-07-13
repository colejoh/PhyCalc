//
//  KinematicViewController.m
//  PhyCalc
//
//  Created by Cole Johnson on 4/14/15.
//  Copyright (c) 2015 Cole Johnson. All rights reserved.
//

#import "KinematicViewController.h"

@interface KinematicViewController ()
@end

@implementation KinematicViewController


- (IBAction)kinematicCalculateButtonPress:(id)sender {
    //Setting variables to the contents of text fields when 'calculate' is pressed
    float initialVelocity = [[self.initialVelocityTextField text] floatValue];
    float finalVelocity = [[self.finalVelocityTextField text] floatValue];
    float acceleration = [[self.accelerationTextField text] floatValue];
    float displacement = [[self.displacementTextField text] floatValue];
    float time = [[self.timeTextField text] floatValue];
    float result;
    
    //Procedure for setting the value of a variable to a text field or label
    //converting the float value to a string (has to be a string to be returned)
    
    NSString *result1 = [NSString stringWithFormat:@"%f", time];
    
    //setting the variable with the place it needs to be set
    self.displacementTextField.text = result1;
    
    //if(missing finalVelocity) {
    //  result = [displacementInitialVelocityTimeAcceleration:(float)d iV:(float)iV t:(float)t a:(float)a];
    //else if(missing time) {
    //  result = [finalVelocityInitialVelocityAccelerationDisplacement:(float)fV iV:(float)iV a:(float)a d:(float)d];
    //else if(missing displacement) {
    //  result = [finalVelocityInitialVelocityAccelerationTime:(float)fV iV:(float)iV a:(float)a t:(float)t];
    //else if(missing acceleration) {
    //  result = [displacementInitialVelocityFinalVelocityTime:(float)d iV:(float)iV fV:(float)fV t:(float)t];
}

- (float)displacementInitialVelocityTimeAcceleration:(float)d iV:(float)iV t:(float)t a:(float)a {
    float displacement = d;
    float initialVelocity = iV;
    float time = t;
    float acceleration = a;
    float dHolder;
    
    //Equation:
    //displacement = initialVelocity*time + (.5)acceleration * (time^2)
    
    dHolder = (initialVelocity*time) + ((.5 * acceleration)*(time*time));
    
    
    
    return displacement;
}

- (float)finalVelocityInitialVelocityAccelerationDisplacement:(float)fV iV:(float)iV a:(float)a d:(float)d {
    float time;
    return time;
}

- (float)finalVelocityInitialVelocityAccelerationTime:(float)fV iV:(float)iV a:(float)a t:(float)t {
    float displacement;
    return displacement;
}

- (float)displacementInitialVelocityFinalVelocityTime:(float)d iV:(float)iV fV:(float)fV t:(float)t {
    float acceleration;
    return acceleration;
}







//Given stuff with the file
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
