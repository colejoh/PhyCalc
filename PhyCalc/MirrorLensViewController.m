//
//  MirrorLensViewController.m
//  PhyCalc
//
//  Created by Cole Johnson on 4/14/15.
//  Copyright (c) 2015 Cole Johnson. All rights reserved.
//

#import "MirrorLensViewController.h"

@interface MirrorLensViewController ()

@end

@implementation MirrorLensViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.focalLengthTextField setDelegate:self];
    [self.focalDistanceTextField setDelegate:self];
    [self.imageDistanceTextField setDelegate:self];
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

- (IBAction)mirrorLensCalculateButtonPress:(id)sender {
    NSString *focalLengthAsString = [self.focalLengthTextField text];
    NSString *imageDistanceAsString = [self.imageDistanceTextField text];
    NSString *focalDistanceAsString = [self.focalDistanceTextField text];
    
    
    NSScanner *fLScanner = [NSScanner scannerWithString:focalLengthAsString];
    BOOL fLIsNumeric = [fLScanner scanDouble:NULL] && [fLScanner isAtEnd];
    
    NSScanner *iDScanner = [NSScanner scannerWithString:imageDistanceAsString];
    BOOL iDIsNumeric = [iDScanner scanDouble:NULL] && [iDScanner isAtEnd];
    
    NSScanner *fDScanner = [NSScanner scannerWithString:focalDistanceAsString];
    BOOL fDIsNumeric = [fDScanner scanDouble:NULL] && [fDScanner isAtEnd];
    
    
    
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
    } else if (!fLIsNumeric || !iDIsNumeric || !fDIsNumeric) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Variables can only be numbers."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    }else {
        
        float focalLength = [[self.focalLengthTextField text] floatValue];
        float imageDistance = [[self.imageDistanceTextField text] floatValue];
        float focalDistance = [[self.focalDistanceTextField text] floatValue];
        
        if([focalLengthAsString isEqualToString:@""]) {
            
            
            float focalLengthResult = [self findFocalLength:imageDistance fD:focalDistance];
            NSString *focalLengthString = [NSString stringWithFormat:@"%f", focalLengthResult];
            self.focalLengthTextField.text = focalLengthString;
            
            
        } else if([imageDistanceAsString isEqualToString:@""]) {
            
            
            float imageDistanceResult = [self findImageDistance:focalLength fD:focalDistance];
            NSString *imageDistanceString = [NSString stringWithFormat:@"%f", imageDistanceResult];
            self.imageDistanceTextField.text = imageDistanceString;
            
            
        } else if([focalDistanceAsString isEqualToString:@""]) {
            
            
            float focalDistanceResult = [self findFocalDistance:focalLength imageDis:imageDistance];
            NSString *focalDistanceString = [NSString stringWithFormat:@"%f", focalDistanceResult];
            self.focalDistanceTextField.text = focalDistanceString;
            
        }
    }
}

- (IBAction)mirrorLensClearButtonPress:(id)sender {
    [self clear];
}
-(void)clear {
    self.focalDistanceTextField.text = [NSString stringWithFormat:@""];
    self.focalLengthTextField.text = [NSString stringWithFormat:@""];
    self.imageDistanceTextField.text = [NSString stringWithFormat:@""];
}

-(float)findFocalLength:(float)imageDis fD:(float)fD {
    float focalLength;
    float imageDistance = imageDis;
    float focalDistance = fD;
    
    //Equation:
    //1/fl = 1/fd + 1/id
    focalLength = 1/((1/focalDistance) + (1/imageDistance));
    
    return focalLength;
    
}

-(float)findImageDistance:(float)focalLen fD:(float)fD {
    float imageDistance;
    float focalLength = focalLen;
    float focalDistance = fD;
    
    //Equation:
    //1/fl - 1/fd = 1/id
    
    imageDistance = 1/( (1/focalLength) - (1/focalDistance));
    
    return imageDistance;
}

-(float)findFocalDistance:(float)focalLen imageDis:(float)imageDis {
    float focalDistance;
    float focalLength = focalLen;
    float imageDistance = imageDis;
    
    //Equation:
    //1/fl - 1/id = 1/fd
    
    focalDistance = 1/( (1/focalLength) - (1/imageDistance) );
    
    return focalDistance;
    
}

-(int)howManyEmpty {
    NSString *focalLengthAsString = [self.focalLengthTextField text];
    NSString *imageDistanceAsString = [self.imageDistanceTextField text];
    NSString *focalDistanceAsString = [self.focalDistanceTextField text];
    
    int count = 0;
    
    if([focalLengthAsString isEqualToString:@""]) {
        count += 1;
    }
    if([imageDistanceAsString isEqualToString:@""]) {
        count += 1;
    }
    if([focalDistanceAsString isEqualToString:@""]) {
        count += 1;
    }
    return count;
}


-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

@end
