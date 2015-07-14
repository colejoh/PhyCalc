//
//  KinematicNoFVViewController.m
//  PhyCalc
//
//  Created by Cole Johnson on 4/15/15.
//  Copyright (c) 2015 Cole Johnson. All rights reserved.
//

#import "KinematicNoFVViewController.h"

@interface KinematicNoFVViewController ()

@end

@implementation KinematicNoFVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.initialVelocityTextField setDelegate:self];
    [self.accelerationTextField setDelegate:self];
    [self.displacementTextField setDelegate:self];
    [self.timeTextField setDelegate:self];
    
    
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

- (IBAction)kinematicNoFVButtonPress:(id)sender {
    //Setting variables to the contents of text fields when 'calculate' is pressed
    //String (to check if it is empty)(probably a better way to do this, but whatever)
    NSString *initialVelocityAsString = [self.initialVelocityTextField text];
    NSString *accelerationAsString = [self.accelerationTextField text];
    NSString *displacementAsString = [self.displacementTextField text];
    NSString *timeAsString = [self.timeTextField text];
    
    
    
    NSScanner *iScanner = [NSScanner scannerWithString:initialVelocityAsString];
    BOOL iVIsNumeric = [iScanner scanDouble:NULL] && [iScanner isAtEnd];
    
    NSScanner *aScanner = [NSScanner scannerWithString:accelerationAsString];
    BOOL accelerationIsNumeric = [aScanner scanDouble:NULL] && [aScanner isAtEnd];
    
    NSScanner *dScanner = [NSScanner scannerWithString:displacementAsString];
    BOOL displacementIsNumeric = [dScanner scanDouble:NULL] && [dScanner isAtEnd];
    
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
    } else if (emptyCount > 1) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"You can only leave one field blank."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
        
    }else {
    
        //float (to do calculations with)
        float initialVelocity = [[self.initialVelocityTextField text] floatValue];
        float acceleration = [[self.accelerationTextField text] floatValue];
        float displacement = [[self.displacementTextField text] floatValue];
        float time = [[self.timeTextField text] floatValue];
        
        if([initialVelocityAsString isEqualToString:@""]) {
            
            
            float iVResult = [self findInitialVelocity:acceleration d:displacement t:time];
            NSString *initialVelocityString = [NSString stringWithFormat:@"%f", iVResult];
            self.initialVelocityTextField.text = initialVelocityString;
            
            
        } else if([accelerationAsString isEqualToString:@""]) {
            
            
            float aResult = [self findAcceleration:initialVelocity d:displacement t:time];
            NSString *accelerationString = [NSString stringWithFormat:@"%f", aResult];
            self.accelerationTextField.text = accelerationString;
            
            
        } else if([displacementAsString isEqualToString:@""]) {
            
            
            float dResult = [self findDisplacement:initialVelocity a:acceleration t:time];
            NSString *displacementString = [NSString stringWithFormat:@"%f", dResult];
            self.displacementTextField.text = displacementString;
            
            
        } else if([timeAsString isEqualToString:@""]) {
            
            
            //float tResult = [self findInitialVelocity:acceleration d:displacement t:time];
            //NSString *initialVelocityString = [NSString stringWithFormat:@"%f", tResult];
            self.timeTextField.text = [NSString stringWithFormat:@"Not Supported"];
            
            
        }
    }//close if
}//close button method

- (IBAction)kinematicNoFVClearButtonPress:(id)sender {
    [self clear];
}

-(void)clear {
    self.initialVelocityTextField.text = [NSString stringWithFormat:@""];
    self.accelerationTextField.text = [NSString stringWithFormat:@""];
    self.displacementTextField.text = [NSString stringWithFormat:@""];
    self.timeTextField.text = [NSString stringWithFormat:@""];
}

-(float)findInitialVelocity:(float)a d:(float)d t:(float)t {
    float initialVelocity;
    float acceleration = a;
    float displacement = d;
    float time = t;
    
    //Equation:
    //displacement = iV*t + .5a(t*t)
    
    initialVelocity = (displacement - ((acceleration*(time*time))/2))/(time);
    
    return initialVelocity;
}

-(float)findAcceleration:(float)iV d:(float)d t:(float)t {
    float acceleration;
    float initialVelocity = iV;
    float displacement = d;
    float time = t;
    
    acceleration = (2*(displacement - (initialVelocity*time)))/(time*time);
    
    return acceleration;
}

-(float)findDisplacement:(float)iV a:(float)a t:(float)t {
    float displacement;
    float acceleration = a;
    float initialVelocity = iV;
    float time = t;
    
    //calculations
    displacement = (initialVelocity * time) + ((acceleration * (time*time))/2);
    
    return displacement;
}

-(float)findTime:(float)iV a:(float)a d:(float)d {
    float time;
    return time;
}

-(int)howManyEmpty {
    NSString *initialVelocityAsString = [self.initialVelocityTextField text];
    NSString *accelerationAsString = [self.accelerationTextField text];
    NSString *displacementAsString = [self.displacementTextField text];
    NSString *timeAsString = [self.timeTextField text];
    
    int count = 0;
    if([initialVelocityAsString isEqualToString:@""]) {
        count += 1;
    }
    if ([accelerationAsString isEqualToString:@""]) {
        count += 1;
    }
    if ([displacementAsString isEqualToString:@""]) {
        count += 1;
    }
    if([timeAsString isEqualToString:@""]) {
        count += 1;
    }
    
    return count;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}


@end