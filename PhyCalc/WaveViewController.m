//
//  WaveViewController.m
//  PhyCalc
//
//  Created by Cole Johnson on 4/14/15.
//  Copyright (c) 2015 Cole Johnson. All rights reserved.
//

#import "WaveViewController.h"

@interface WaveViewController ()

@end

@implementation WaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.speedTextField setDelegate:self];
    [self.wavelengthTextField setDelegate:self];
    [self.periodTextField setDelegate:self];
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

- (IBAction)waveCalculateButtonPress:(id)sender {
    NSString *speedAsString = [self.speedTextField text];
    NSString *waveLengthAsString = [self.wavelengthTextField text];
    NSString *periodAsString = [self.periodTextField text];
    
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
    
        float speed = [[self.speedTextField text] floatValue];
        float waveLength = [[self.wavelengthTextField text] floatValue];
        float period = [[self.periodTextField text] floatValue];
        
        if([speedAsString isEqualToString:@""]) {
            
            
            float speedResult = [self findSpeed:waveLength p:period];
            NSString *speedString = [NSString stringWithFormat:@"%f", speedResult];
            self.speedTextField.text = speedString;
            
            
        } else if([waveLengthAsString isEqualToString:@""]) {
            
            
            float waveLengthResult = [self findWaveLength:speed p:period];
            NSString *waveLengthString = [NSString stringWithFormat:@"%f", waveLengthResult];
            self.wavelengthTextField.text = waveLengthString;
            
            
        } else if ([periodAsString isEqualToString:@""]) {
            
            
            float periodResult = [self findPeriod:speed wL:waveLength];
            NSString *periodString = [NSString stringWithFormat:@"%f", periodResult];
            self.periodTextField.text = periodString;
            
            
        }
    }
}

- (IBAction)waveClearButtonPress:(id)sender {
    [self clear];
}
- (void)clear {
    self.speedTextField.text = [NSString stringWithFormat:@""];
    self.wavelengthTextField.text = [NSString stringWithFormat:@""];
    self.periodTextField.text = [NSString stringWithFormat:@""];
}

-(float)findSpeed:(float)wL p:(float)p {
    float speed;
    float waveLength = wL;
    float period = p;
    
    speed = waveLength / period;
    
    return speed;
}

-(float)findWaveLength:(float)s p:(float)p {
    float waveLength;
    float speed = s;
    float period = p;
    
    waveLength = period * speed;
    
    return waveLength;
    
}

-(float)findPeriod:(float)s wL:(float)wL {
    float period;
    float speed = s;
    float waveLength = wL;
    
    period = speed / waveLength;
    
    return period;
}

//Method to help with error alerts
//Sees how many fields are empty and returns it
-(int)howManyEmpty {
    NSString *speedAsString = [self.speedTextField text];
    NSString *waveLengthAsString = [self.wavelengthTextField text];
    NSString *periodAsString = [self.periodTextField text];
    
    int count = 0;
    if([speedAsString isEqualToString:@""]) {
        count += 1;
    }
    if([waveLengthAsString isEqualToString:@""]) {
        count += 1;
    }
    if([periodAsString isEqualToString:@""]) {
        count += 1;
    }
    
    return count;
}

//Method to hide keyboard
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
@end
