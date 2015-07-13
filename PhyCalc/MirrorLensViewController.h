//
//  MirrorLensViewController.h
//  PhyCalc
//
//  Created by Cole Johnson on 4/14/15.
//  Copyright (c) 2015 Cole Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MirrorLensViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *focalLengthTextField;
@property (strong, nonatomic) IBOutlet UITextField *imageDistanceTextField;
@property (strong, nonatomic) IBOutlet UITextField *focalDistanceTextField;

- (IBAction)mirrorLensCalculateButtonPress:(id)sender;
- (IBAction)mirrorLensClearButtonPress:(id)sender;


-(float)findFocalLength:(float)imageDis fD:(float)fD;

-(float)findImageDistance:(float)focalLen fD:(float)fD;

-(float)findFocalDistance:(float)focalLen imageDis:(float)imageDis;

-(int)howManyEmpty;

-(void)clear;

@end
