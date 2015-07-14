//
//  KinematicNoTimeViewController.m
//  PhyCalc
//
//  Created by Cole Johnson on 4/15/15.
//  Copyright (c) 2015 Cole Johnson. All rights reserved.
//

#import "KinematicNoTimeViewController.h"

@interface KinematicNoTimeViewController ()

@end

@implementation KinematicNoTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];// Do any additional setup after loading the view.
    
    [self.initialVelocityTextField setDelegate:self];
    [self.finalVelocityTextField setDelegate:self];
    [self.accelerationTextField setDelegate:self];
    [self.displacementTextField setDelegate:self];
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

//Hide Keyboard Method
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)kinematicNoTimeButtonPress:(id)sender {
    //Strings for checking if empty
    NSString *initialVelocityString = [self.initialVelocityTextField text];
    NSString *finalVelocityString = [self.finalVelocityTextField text];
    NSString *accelerationString = [self.accelerationTextField text];
    NSString *displacementString = [self.displacementTextField text];
    
    
    NSScanner *iScanner = [NSScanner scannerWithString:initialVelocityString];
    BOOL iVIsNumeric = [iScanner scanDouble:NULL] && [iScanner isAtEnd];
    
    NSScanner *fScanner = [NSScanner scannerWithString:finalVelocityString];
    BOOL fVIsNumeric = [fScanner scanDouble:NULL] && [fScanner isAtEnd];
    
    NSScanner *aScanner = [NSScanner scannerWithString:accelerationString];
    BOOL accelerationIsNumeric = [aScanner scanDouble:NULL] && [aScanner isAtEnd];
    
    NSScanner *dScanner = [NSScanner scannerWithString:displacementString];
    BOOL displacementIsNumeric = [dScanner scanDouble:NULL] && [dScanner isAtEnd];
    
    
    
    int emptyCount = [self howManyEmpty];
    
    if (emptyCount == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"You must leave the variable blank that you want to solve for."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        //[alert release];
    } else if (emptyCount > 1) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"You can only leave one field blank."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    }else {
    
        //Floats for calculation
        float initialVelocity = [[self.initialVelocityTextField text] floatValue];
        float finalVelocity = [[self.finalVelocityTextField text]floatValue];
        float acceleration = [[self.accelerationTextField text] floatValue];
        float displacement = [[self.displacementTextField text] floatValue];
        
        if([initialVelocityString isEqualToString:@""]) {
            
            
            float initialVelocityResult = [self findInitialVelocity:finalVelocity a:acceleration d:displacement];
            NSString *initialVelocityAsString = [NSString stringWithFormat:@"%f", initialVelocityResult];
            self.initialVelocityTextField.text = initialVelocityAsString;
            
            
        } else if ([finalVelocityString isEqualToString:@""]) {
            
            
            float finalVelocityResult = [self findFinalVelocity:initialVelocity a:acceleration d:displacement];
            NSString *finalVelocityAsString = [NSString stringWithFormat:@"%f", finalVelocityResult];
            self.finalVelocityTextField.text = finalVelocityAsString;
            
            
        }else if ([accelerationString isEqualToString:@""]) {
            
            
            float accelerationResult = [self findAcceleration:initialVelocity fV:finalVelocity d:displacement];
            NSString *accelerationAsString = [NSString stringWithFormat:@"%f", accelerationResult];
            self.accelerationTextField.text = accelerationAsString;
            
            
        } else if ([displacementString isEqualToString:@""]) {
            
            
            float displacementResult = [self findDisplacement:initialVelocity fV:finalVelocity a:acceleration];
            NSString *displacementAsString = [NSString stringWithFormat:@"%f", displacementResult];
            self.displacementTextField.text = displacementAsString;
            
            
        }
    }
}

- (IBAction)kinematicNoTimeClearButtonPress:(id)sender {
    [self clear];
}
-(void)clear {
    self.initialVelocityTextField.text = [NSString stringWithFormat:@""];
    self.finalVelocityTextField.text = [NSString stringWithFormat:@""];
    self.accelerationTextField.text = [NSString stringWithFormat:@""];
    self.displacementTextField.text = [NSString stringWithFormat:@""];
}

//Calculation methods
-(float)findInitialVelocity:(float)fV a:(float)a d:(float)d {
    float initialVelocity;
    float finalVelocity = fV;
    float acceleration = a;
    float displacement = d;
    
    //Equation:
    //Vi = sqrt((fv^2)-(2ad))
    initialVelocity = sqrtf((finalVelocity * finalVelocity) - (2 * acceleration * displacement));
    
    return initialVelocity;
}

-(float)findFinalVelocity:(float)iV a:(float)a d:(float)d {
    float finalVelocity;
    float initialVelocity = iV;
    float acceleration = a;
    float displacement = d;
    
    //Equation:
    //vf = sqrt(vi^2 + 2ad)
    finalVelocity = sqrtf((initialVelocity * initialVelocity) + (2 * acceleration * displacement));
    
    return finalVelocity;
}

-(float)findAcceleration:(float)iV fV:(float)fV d:(float)d {
    float acceleration;
    float initialVelocity = iV;
    float finalVelocity = fV;
    float displacment = d;
    
    //Equation:
    //(vf^2 - vi^2)/2d = a
    
    acceleration = ((finalVelocity*finalVelocity) - (initialVelocity * initialVelocity))/(2 * displacment);
    
    return acceleration;
}

-(float)findDisplacement:(float)iV fV:(float)fV a:(float)a {
    float displacement;
    float initialVelocity = iV;
    float finalVelocity = fV;
    float acceleration = a;
    
    //Equation:
    //(vf^2 - vi^2)/2a = d
    displacement = ((finalVelocity*finalVelocity) - (initialVelocity * initialVelocity))/(2 * acceleration);
    
    return displacement;
}

-(int)howManyEmpty {
    NSString *initialVelocityString = [self.initialVelocityTextField text];
    NSString *finalVelocityString = [self.finalVelocityTextField text];
    NSString *accelerationString = [self.accelerationTextField text];
    NSString *displacementString = [self.displacementTextField text];
    
    int count = 0;
    if([initialVelocityString isEqualToString:@""]) {
        count += 1;
    }
    if([finalVelocityString isEqualToString:@""]) {
        count += 1;
    }
    if([accelerationString isEqualToString:@""]) {
        count += 1;
    }
    if([displacementString isEqualToString:@""]) {
        count += 1;
    }
    
    return count;
}

@end
