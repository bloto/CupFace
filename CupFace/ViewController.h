//
//  ViewController.h
//  CupFace
//
//  Created by Tomasz Zablocki on 05/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CupFace.h"

@interface ViewController : UIViewController
{
    CupFace *cupFace;
}

@property (strong, nonatomic) IBOutlet UIImageView *cupImage;
@property (strong, nonatomic) IBOutlet UIImageView *cameraImage;
@property (strong, nonatomic) IBOutlet UIImageView *resultingImage;

@end
