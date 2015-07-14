//
//  TorqueViewController.m
//  PhyCalc
//
//  Created by Cole Johnson on 4/17/15.
//  Copyright (c) 2015 Cole Johnson. All rights reserved.
//

#import "TorqueViewController.h"

@interface TorqueViewController ()

@end

@implementation TorqueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.torqueTextField setDelegate:self];
    [self.radiusVectorTextField setDelegate:self];
    [self.linearForceTextField setDelegate:self];
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

- (IBAction)torqueCalculateButtonPress:(id)sender {
    NSString *torqueString = [self.torqueTextField text];
    NSString *radiusVectorString = [self.radiusVectorTextField text];
    NSString *linearForceTextField = [self.linearForceTextField text];
    
    
    NSScanner *tScanner = [NSScanner scannerWithString:torqueString];
    BOOL tIsNumeric = [tScanner scanDouble:NULL] && [tScanner isAtEnd];
    
    NSScanner *rScanner = [NSScanner scannerWithString:radiusVectorString];
    BOOL rIsNumeric = [rScanner scanDouble:NULL] && [rScanner isAtEnd];
    
    NSScanner *lScanner = [NSScanner scannerWithString:linearForceTextField];
    BOOL lIsNumeric = [lScanner scanDouble:NULL] && [lScanner isAtEnd];
    
    
    int emptyCount = [self howManyEmpty];
    
    if(emptyCount == 0) {
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
    
        float torque = [[self.torqueTextField text] floatValue];
        float radiusVector = [[self.radiusVectorTextField text] floatValue];
        float linearForce = [[self.linearForceTextField text] floatValue];
        
        if([torqueString isEqualToString:@""]) {
            
            float torqueResult = [self findTorqe:radiusVector andLinear:linearForce];
            NSString *torqueResultAsString = [NSString stringWithFormat:@"%f", torqueResult];
            self.torqueTextField.text = torqueResultAsString;
            
        } else if ([radiusVectorString isEqualToString:@""]) {
            
            float radiusVectorResult = [self findRadiusVector:torque andLinear:linearForce];
            NSString *radiusVectorResultAsString = [NSString stringWithFormat:@"%f", radiusVectorResult];
            self.radiusVectorTextField.text = radiusVectorResultAsString;
            
        } else if ([linearForceTextField isEqualToString:@""]) {
            
            float linearForceResult = [self findLinearForce:torque andRadius:radiusVector];
            NSString *linearForceAsString = [NSString stringWithFormat:@"%f", linearForceResult];
            self.linearForceTextField.text = linearForceAsString;
            
        }
    }
}

- (IBAction)torqueClearButtonPress:(id)sender {
    [self clear];
}


- (float)findTorqe:(float)radiusVector andLinear:(float)linearForce {
    float t;
    float r = radiusVector;
    float l = linearForce;
    
    //equation
    //t = f * r
    
    t = r * l;
    
    return t;
}


- (float)findRadiusVector:(float)torque andLinear:(float)linearForce {
    float r;
    float t = torque;
    float l = linearForce;
    
    //equation:
    //r = t/f
    
    r = t / l;
    
    return r;
}


- (float)findLinearForce:(float)torque andRadius:(float)radiusVector {
    float l;
    float t = torque;
    float r = radiusVector;
    
    //Equation
    //l = t / r
    
    l = t / r;
    
    return l;
    
}



- (int)howManyEmpty {
    NSString *torqueString = [self.torqueTextField text];
    NSString *radiusVectorString = [self.radiusVectorTextField text];
    NSString *linearForceTextField = [self.linearForceTextField text];
    
    int count = 0;
    
    if([torqueString isEqualToString:@""]) {
        count += 1;
    }
    if([radiusVectorString isEqualToString:@""]) {
        count += 1;
    }
    if([linearForceTextField isEqualToString:@""]) {
        count += 1;
    }
    return count;
}


- (void)clear {
    self.torqueTextField.text = [NSString stringWithFormat:@""];
    self.radiusVectorTextField.text = [NSString stringWithFormat:@""];
    self.linearForceTextField.text = [NSString stringWithFormat:@""];
}
@end
