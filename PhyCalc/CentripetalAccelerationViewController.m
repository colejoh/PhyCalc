//
//  CentripetalAccelerationViewController.m
//  PhyCalc
//
//  Created by Cole Johnson on 4/17/15.
//  Copyright (c) 2015 Cole Johnson. All rights reserved.
//

#import "CentripetalAccelerationViewController.h"

@interface CentripetalAccelerationViewController ()

@end

@implementation CentripetalAccelerationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.velocityTextField setDelegate:self];
    [self.accelerationTextField setDelegate:self];
    [self.radiusTextField setDelegate:self];
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

- (IBAction)centripetalAccelerationCalculateButtonPress:(id)sender {
    NSString *velocityAsString = [self.velocityTextField text];
    NSString *accelerationAsString = [self.accelerationTextField text];
    NSString *radiusAsString = [self.radiusTextField text];
    
    
    
    NSScanner *vScanner = [NSScanner scannerWithString:velocityAsString];
    BOOL velocityIsNumeric = [vScanner scanDouble:NULL] && [vScanner isAtEnd];
    
    NSScanner *aScanner = [NSScanner scannerWithString:accelerationAsString];
    BOOL accelerationIsNumeric = [aScanner scanDouble:NULL] && [aScanner isAtEnd];
    
    NSScanner *rScanner = [NSScanner scannerWithString:radiusAsString];
    BOOL radiusIsNumeric = [rScanner scanDouble:NULL] && [rScanner isAtEnd];
    
    
    
    
    int emptyCount = [self howManyEmpty];
    
    if(emptyCount == 0) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                   message:@"You must leave the variable blank that you want to solve for."
                                                   delegate:nil
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
        [alert show];
        
    } else if(emptyCount > 1) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                  message:@"You can only leave one field blank."
                                                  delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alert show];
        
    } else if(!velocityIsNumeric || !accelerationIsNumeric || !radiusIsNumeric) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Variables can only be numbers."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    } else {
        
        float velocity = [[self.velocityTextField text] floatValue];
        float acceleration = [[self.accelerationTextField text]floatValue];
        float radius = [[self.radiusTextField text] floatValue];
        
        if([velocityAsString isEqualToString:@""]) {
            
            float velocityResult = [self findVelocity:acceleration r:radius];
            NSString *velocityString = [NSString stringWithFormat:@"%f", velocityResult];
            self.velocityTextField.text = velocityString;
            
        } else if ([accelerationAsString isEqualToString:@""]) {
            
            float accelerationResult = [self findAcceleration:velocity r:radius];
            NSString *accelerationString = [NSString stringWithFormat:@"%f", accelerationResult];
            self.accelerationTextField.text = accelerationString;
            
        } else if ([radiusAsString isEqualToString:@""]) {
            
            float radiusResult = [self findRadius:acceleration v:velocity];
            NSString *radiusString = [NSString stringWithFormat:@"%f", radiusResult];
            self.radiusTextField.text = radiusString;
            
        }
    }
    
}

- (IBAction)centripetalAccelerationClearButtonPress:(id)sender {
    [self clear];
}

- (float)findAcceleration:(float)v r:(float)radius {
    float acceleration;
    float velocity = v;
    float r = radius;
    
    //Equation:
    //a = v^2/r
    acceleration = (velocity * velocity)/r;
    
    NSLog(@"%f", acceleration);
    return acceleration;
    
}
- (float)findVelocity:(float)a r:(float)radius {
    float velocity;
    float acceleration = a;
    float r = radius;
    
    velocity = sqrt(acceleration * r);
    
    NSLog(@"%f", velocity);
    return velocity;
    
}
- (float)findRadius:(float)a v:(float)velocity {
    float radius;
    float acceleration = a;
    float v = velocity;
    
    radius = (v * v)/acceleration;
    
    return radius;
    
}

- (int)howManyEmpty {
    NSString *velocityAsString = [self.velocityTextField text];
    NSString *accelerationAsString = [self.accelerationTextField text];
    NSString *radiusAsString = [self.radiusTextField text];
    
    int count = 0;
    
    if([velocityAsString isEqualToString:@""]) {
        count += 1;
    }
    if([accelerationAsString isEqualToString:@""]) {
        count += 1;
    }
    if ([radiusAsString isEqualToString:@""]) {
        count += 1;
    }
    
    return count;
}

- (void)clear {
    self.velocityTextField.text = [NSString stringWithFormat:@""];
    self.accelerationTextField.text = [NSString stringWithFormat:@""];
    self.radiusTextField.text = [NSString stringWithFormat:@""];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

@end
