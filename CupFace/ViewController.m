//
//  ViewController.m
//  CupFace
//
//  Created by Tomasz Zablocki on 05/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize cupImage;
@synthesize cameraImage;
@synthesize resultingImage;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [cupImage setImage:[UIImage imageNamed:@"cup.png"]];
    [cameraImage setImage:[UIImage imageNamed:@"face.png"]];   
    [resultingImage setImage:[CupFace drawImage:[cameraImage image] inImage:[cupImage image]]];
}

- (void)viewDidUnload
{
    [self setCupImage:nil];
    [self setCameraImage:nil];
    [self setResultingImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
