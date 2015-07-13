//
//  KinematicNoDisplacementViewController.m
//  PhyCalc
//
//  Created by Cole Johnson on 4/15/15.
//  Copyright (c) 2015 Cole Johnson. All rights reserved.
//

#import "KinematicNoDisplacementViewController.h"

@interface KinematicNoDisplacementViewController ()

@end

@implementation KinematicNoDisplacementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.initialVelocityTextField setDelegate:self];
    [self.finalVelocityTextField setDelegate:self];
    [self.accelerationTextField setDelegate:self];
    [self.timeTextField setDelegate:self];
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

- (IBAction)kinematicNoDisplacementButtonPress:(id)sender {
    NSString *initialVelocityAsString = [self.initialVelocityTextField text];
    NSString *finalVelocityAsString = [self.finalVelocityTextField text];
    NSString *accelerationAsString = [self.accelerationTextField text];
    NSString *timeAsString = [self.timeTextField text];
    
    
    
    NSScanner *iScanner = [NSScanner scannerWithString:initialVelocityAsString];
    BOOL iVIsNumeric = [iScanner scanDouble:NULL] && [iScanner isAtEnd];
    
    NSScanner *fScanner = [NSScanner scannerWithString:finalVelocityAsString];
    BOOL fVIsNumeric = [fScanner scanDouble:NULL] && [fScanner isAtEnd];
    
    NSScanner *aScanner = [NSScanner scannerWithString:accelerationAsString];
    BOOL accelerationIsNumeric = [aScanner scanDouble:NULL] && [aScanner isAtEnd];
    
    NSScanner *tScanner = [NSScanner scannerWithString:timeAsString];
    BOOL timeIsNumeric = [tScanner scanDouble:NULL] && [tScanner isAtEnd];
    
    
    
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
    } else if (!iVIsNumeric || !fVIsNumeric || !accelerationIsNumeric || !timeIsNumeric) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Variables can only be numbers."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    }else {
    
        float initialVelocity = [[self.initialVelocityTextField text] floatValue];
        float finalVelocity = [[self.finalVelocityTextField text]floatValue];
        float acceleration = [[self.accelerationTextField text] floatValue];
        float time = [[self.timeTextField text] floatValue];
        
        if([initialVelocityAsString isEqualToString:@""]) {
            
            
            float initialVelocityResult = [self findInitialVelocity:finalVelocity a:acceleration t:time];
            NSString *initialVelocityString = [NSString stringWithFormat:@"%f", initialVelocityResult];
            self.initialVelocityTextField.text = initialVelocityString;
            
            
        } else if([finalVelocityAsString isEqualToString:@""]) {
            
            
            float finalVelocityResult = [self findFinalVelocity:initialVelocity a:acceleration t:time];
            NSString *finalVelocityString = [NSString stringWithFormat:@"%f", finalVelocityResult];
            self.finalVelocityTextField.text = finalVelocityString;
            
            
        } else if([accelerationAsString isEqualToString:@""]) {
            
            
            float accelerationResult = [self findAcceleration:initialVelocity fV:finalVelocity t:time];
            NSString *accelerationAsString = [NSString stringWithFormat:@"%f", accelerationResult];
            self.accelerationTextField.text = accelerationAsString;
            
            
        } else if([timeAsString isEqualToString:@""]) {
            
            
            float timeResult = [self findTime:initialVelocity fV:finalVelocity a:acceleration];
            NSString *timeAsString = [NSString stringWithFormat:@"%f", timeResult];
            self.timeTextField.text = timeAsString;
            
            
        }
        
    }
}

- (IBAction)kinematicNoDisplacementClearButtonPress:(id)sender {
    [self clear];
}

-(void)clear {
    self.initialVelocityTextField.text = [NSString stringWithFormat:@""];
    self.finalVelocityTextField.text = [NSString stringWithFormat:@""];
    self.accelerationTextField.text = [NSString stringWithFormat:@""];
    self.timeTextField.text = [NSString stringWithFormat:@""];
}

-(float)findInitialVelocity:(float)fV a:(float)a t:(float)t {
    float initialVelocity;
    float finalVelocity = fV;
    float acceleration = a;
    float time = t;
    
    //Equation:
    //vi = vf - at
    initialVelocity = (finalVelocity) - (acceleration * time);
    
    return initialVelocity;
}

-(float)findFinalVelocity:(float)iV a:(float)a t:(float)t {
    float finalVelocity;
    float initialVelocity = iV;
    float acceleration = a;
    float time = t;
    
    //Equation:
    //Vf = Vi + at
    finalVelocity = (initialVelocity) + (acceleration * time);
    
    return finalVelocity;
}

-(float)findAcceleration:(float)iV fV:(float)fV t:(float)t {
    float acceleration;
    float initialVelocity = iV;
    float finalVelocity = fV;
    float time = t;
    
    //Equation:
    //(vf-vi)/t = a
    acceleration = (finalVelocity - initialVelocity) / time;
    
    return acceleration;
}

-(float)findTime:(float)iV fV:(float)fV a:(float)a {
    float time;
    float initialVelocity = iV;
    float finalVelocity = fV;
    float acceleration = a;
    
    //Equations:
    //(vf-vi)/a = t
    time = (finalVelocity - initialVelocity) / acceleration;
    
    return time;
}

-(int)howManyEmpty {
    NSString *initialVelocityAsString = [self.initialVelocityTextField text];
    NSString *finalVelocityAsString = [self.finalVelocityTextField text];
    NSString *accelerationAsString = [self.accelerationTextField text];
    NSString *timeAsString = [self.timeTextField text];
    
    int count = 0;
    if([initialVelocityAsString isEqualToString:@""]) {
        count += 1;
    }
    if([finalVelocityAsString isEqualToString:@""]) {
        count += 1;
    }
    if([accelerationAsString isEqualToString:@""]) {
        count += 1;
    }
    if([timeAsString isEqualToString:@""]) {
        count += 1;
    }
    return count;
}

//Hide Keyboard method
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
@end
