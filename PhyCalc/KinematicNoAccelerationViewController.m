//
//  KinematicNoAccelerationViewController.m
//  PhyCalc
//
//  Created by Cole Johnson on 4/15/15.
//  Copyright (c) 2015 Cole Johnson. All rights reserved.
//

#import "KinematicNoAccelerationViewController.h"

@interface KinematicNoAccelerationViewController ()

@end

@implementation KinematicNoAccelerationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.initialVelocityTextField setDelegate:self];
    [self.finalVelocityTextField setDelegate:self];
    [self.displacementTextField setDelegate:self];
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

- (IBAction)kinematicNoAccelerationButtonPress:(id)sender {
    //Setting variables to the contents of text fields when 'calculate' is pressed
    //String (to check if it is empty)(probably a better way to do this, but whatever)
    NSString *initialVelocityAsString = [self.initialVelocityTextField text];
    NSString *finalVelocityAsString = [self.finalVelocityTextField text];
    NSString *displacementAsString = [self.displacementTextField text];
    NSString *timeAsString = [self.timeTextField text];
    
    
    NSScanner *iScanner = [NSScanner scannerWithString:initialVelocityAsString];
    BOOL iVIsNumeric = [iScanner scanDouble:NULL] && [iScanner isAtEnd];
    
    NSScanner *fScanner = [NSScanner scannerWithString:finalVelocityAsString];
    BOOL fVIsNumeric = [fScanner scanDouble:NULL] && [fScanner isAtEnd];
    
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
        //[alert release];
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
        float finalVelocity = [[self.finalVelocityTextField text] floatValue];
        float displacement = [[self.displacementTextField text] floatValue];
        float time = [[self.timeTextField text] floatValue];
        
        if([initialVelocityAsString isEqualToString:@""]) {
            
            
            float iVResult = [self findInitialVelocity:finalVelocity d:displacement t:time];
            NSString *initialVelocityString = [NSString stringWithFormat:@"%f", iVResult];
            self.initialVelocityTextField.text = initialVelocityString;
            
            
            
        } else if([finalVelocityAsString isEqualToString:@""]) {
            
            
            float fVResult = [self findFinalVelocity:initialVelocity d:displacement t:time];
            NSString *finalVelocityString = [NSString stringWithFormat:@"%f", fVResult];
            self.finalVelocityTextField.text = finalVelocityString;
            
            
        } else if([displacementAsString isEqualToString:@""]) {
            
            
            float dResult = [self findDisplacement:initialVelocity fV:finalVelocity t:time];
            NSString *displacementString = [NSString stringWithFormat:@"%f", dResult];
            self.displacementTextField.text = displacementString;
            
            
        } else if([timeAsString isEqualToString:@""]) {
            
            
            float tResult = [self findTime:initialVelocity fV:finalVelocity d:displacement];
            NSString *timeString = [NSString stringWithFormat:@"%f", tResult];
            self.timeTextField.text = timeString;
                    
            
        }
    }
}//close button method

- (IBAction)kinematicNoAccelerationClearButtonPress:(id)sender {
    [self clear];
}
-(void)clear {
    self.initialVelocityTextField.text = [NSString stringWithFormat:@""];
    self.finalVelocityTextField.text = [NSString stringWithFormat:@""];
    self.displacementTextField.text = [NSString stringWithFormat:@""];
    self.timeTextField.text = [NSString stringWithFormat:@""];
}

-(float)findInitialVelocity:(float)fV d:(float)d t:(float)t {
    float initialVelocity;
    float finalVelocity = fV;
    float displacement = d;
    float time = t;
    float holder;
    
    //Equation:
    //∆x = (Vi+Vf)/(2) * t
    //Calculations
    float twoDOverT = (2*displacement)/time;
    holder = twoDOverT - finalVelocity;
    
    initialVelocity = holder;
    
    return initialVelocity;
}

-(float)findFinalVelocity:(float)iV d:(float)d t:(float)t {
    float finalVelocity;
    float initialVelocity = iV;
    float displacement = d;
    float time = t;
    float holder;
    
    //calculations
    float twoDOverT = (2 * displacement) / time;
    
    holder = twoDOverT - initialVelocity;
    finalVelocity = holder;
    
    
    return finalVelocity;
}

-(float)findDisplacement:(float)iV fV:(float)fV t:(float)t {
    float displacement;
    float initialVelocity = iV;
    float finalVelocity = fV;
    float time = t;
    
    //calculations
    displacement = ((initialVelocity + finalVelocity)/2) * time;
    
    return displacement;
}

-(float)findTime:(float)iV fV:(float)fV d:(float)d {
    float time;
    float initialVelocity = iV;
    float finalVelocity = fV;
    float displacement = d;
    
    time = (2 * displacement)/(initialVelocity + finalVelocity);
    
    return time;
}
-(int)howManyEmpty {
    NSString *initialVelocityString = [self.initialVelocityTextField text];
    NSString *finalVelocityString = [self.finalVelocityTextField text];
    NSString *displacementString = [self.displacementTextField text];
    NSString *timeString = [self.timeTextField text];
    
    int count = 0;
    
    if([initialVelocityString isEqualToString:@""]) {
        count += 1;
        NSLog(@"initial Velocity: Empty");
    }
    if ([finalVelocityString isEqualToString:@""]) {
        count += 1;
        NSLog(@"final Velocity: Empty");
    }
    if ([displacementString isEqualToString:@""]) {
        count += 1;
        NSLog(@"displacement: Empty");
    } else {
        NSLog(@"displacement: full. Displacement Value: %@ Time Value: %@", displacementString, timeString);
    }
    if([timeString isEqualToString:@""]) {
        NSLog(@"time: Empty");
        count += 1;
    }
        
    return count;
}

//Hide keyboard method
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

@end
