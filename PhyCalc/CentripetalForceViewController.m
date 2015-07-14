//
//  CentripetalForceViewController.m
//  PhyCalc
//
//  Created by Cole Johnson on 4/17/15.
//  Copyright (c) 2015 Cole Johnson. All rights reserved.
//

#import "CentripetalForceViewController.h"

@interface CentripetalForceViewController ()

@end

@implementation CentripetalForceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.forceTextField setDelegate:self];
    [self.massTextField setDelegate:self];
    [self.velocityTextField setDelegate:self];
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

- (IBAction)centripetalForceCalculateButtonPress:(id)sender {
    NSString *forceAsString = [self.forceTextField text];
    NSString *massAsString = [self.massTextField text];
    NSString *velocityAsString = [self.velocityTextField text];
    NSString *radiusAsString = [self.radiusTextField text];
    
    
    
    NSScanner *fScanner = [NSScanner scannerWithString:forceAsString];
    BOOL forceIsNumeric = [fScanner scanDouble:NULL] && [fScanner isAtEnd];
    
    NSScanner *mScanner = [NSScanner scannerWithString:massAsString];
    BOOL massIsNumeric = [mScanner scanDouble:NULL] && [mScanner isAtEnd];
    
    NSScanner *vScanner = [NSScanner scannerWithString:velocityAsString];
    BOOL velocityIsNumeric = [vScanner scanDouble:NULL] && [vScanner isAtEnd];
    
    NSScanner *rScanner = [NSScanner scannerWithString:radiusAsString];
    BOOL radiusIsNumeric = [rScanner scanDouble:NULL] && [rScanner isAtEnd];
    
    
    
    
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
           
    } else {
        
        float force = [[self.forceTextField text] floatValue];
        float mass = [[self.massTextField text] floatValue];
        float velocity = [[self.velocityTextField text] floatValue];
        float radius = [[self.radiusTextField text] floatValue];
        
        if([forceAsString isEqualToString:@""]) {
            
            float forceResult = [self findForce:mass v:velocity r:radius];
            NSString *forceString = [NSString stringWithFormat:@"%f", forceResult];
            self.forceTextField.text = forceString;
            
        } else if([massAsString isEqualToString:@""]) {
            
            float massResult = [self findMass:force v:velocity r:radius];
            NSString *massString = [NSString stringWithFormat:@"%f", massResult];
            self.massTextField.text = massString;
            
        } else if([velocityAsString isEqualToString:@""]) {
            
            float velocityResult = [self findVelocity:force m:mass r:radius];
            NSString *velocitySring = [NSString stringWithFormat:@"%f", velocityResult];
            self.velocityTextField.text = velocitySring;
            
        } else if([radiusAsString isEqualToString:@""]) {
            
            float radiusResult = [self findRadius:force m:mass v:velocity];
            NSString *radiusString = [NSString stringWithFormat:@"%f", radiusResult];
            self.radiusTextField.text = radiusString;
            
        }
        
    }
}

- (IBAction)centripetalForceClearButtonPress:(id)sender {
    [self clear];
}

- (float)findForce:(float)mass v:(float)v r:(float)r {
    float force;
    float m = mass;
    float velocity = v;
    float radius = r;
    
    //f = mv^2/r
    force = (m * (velocity * velocity))/radius;
    
    return force;
}
- (float)findMass:(float)force v:(float)v r:(float)r {
    float mass;
    float f = force;
    float velocity = v;
    float radius = r;
    
    //fr/v2 = m
    
    mass = (f*radius)/(velocity*velocity);
    
    return mass;
}
- (float)findVelocity:(float)force m:(float)m r:(float)r {
    float velocity;
    float f = force;
    float mass = m;
    float radius = r;
    
    //fr = mv2
    //fr/m = v2
    
    velocity = sqrt((f*radius)/mass);
    
    return velocity;
}
- (float)findRadius:(float)force m:(float)m v:(float)v {
    float radius;
    float f = force;
    float mass = m;
    float velocity = v;
    
    radius = (mass * (velocity * velocity))/f;
    
    return radius;
}

- (int)howManyEmpty {
    int count = 0;
    NSString *forceAsString = [self.forceTextField text];
    NSString *massAsString = [self.massTextField text];
    NSString *velocityAsString = [self.velocityTextField text];
    NSString *radiusAsString = [self.radiusTextField text];
    
    if([forceAsString isEqualToString:@""]) {
        count += 1;
    }
    if([massAsString isEqualToString:@""]) {
        count += 1;
    }
    if([velocityAsString isEqualToString:@""]) {
        count +=1;
    }
    if([radiusAsString isEqualToString:@""]) {
        count += 1;
    }
    
    return count;
}
- (void)clear {
    self.forceTextField.text = [NSString stringWithFormat:@""];
    self.massTextField.text = [NSString stringWithFormat:@""];
    self.velocityTextField.text = [NSString stringWithFormat:@""];
    self.radiusTextField.text = [NSString stringWithFormat:@""];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
@end
