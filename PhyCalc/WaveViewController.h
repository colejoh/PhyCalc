//
//  WaveViewController.h
//  PhyCalc
//
//  Created by Cole Johnson on 4/14/15.
//  Copyright (c) 2015 Cole Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaveViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *speedTextField;
@property (strong, nonatomic) IBOutlet UITextField *wavelengthTextField;
@property (strong, nonatomic) IBOutlet UITextField *periodTextField;

- (IBAction)waveCalculateButtonPress:(id)sender;
- (IBAction)waveClearButtonPress:(id)sender;


-(float)findSpeed:(float)wL p:(float)p;

-(float)findWaveLength:(float)s p:(float)p;

-(float)findPeriod:(float)s wL:(float)wL;

-(int)howManyEmpty;

-(void)clear;

@end
