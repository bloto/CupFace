//
//  CupFace.m
//  CupFace
//
//  Created by Tomasz Zablocki on 05/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CupFace.h"

#define HORIZONTAL_MARGIN 120.0f
#define VERTICAL_MARGIN 80.0f
#define CUP_RADIUS_IN_PIXELS 10.0f
#define CUP_OPACITY 1.0f
#define X_OFFSET -5.0f
#define Y_OFFSET 20.0f
@implementation CupFace


+ (UIImage *) drawImage:(UIImage*) cameraImage inImage:(UIImage*) cupImage
{    
    CFDataRef pixelData = CGDataProviderCopyData(CGImageGetDataProvider(cameraImage.CGImage));
    const UInt8* data = CFDataGetBytePtr(pixelData);
    
    UIGraphicsBeginImageContextWithOptions(cupImage.size, FALSE, 0.0);
    [cupImage drawInRect:CGRectMake( 0, 0, cupImage.size.width, cupImage.size.height)];
    
    float xScale = cameraImage.size.width / (cupImage.size.width - 2 * HORIZONTAL_MARGIN);
    float yScale = cameraImage.size.height / (cupImage.size.height - 2 * VERTICAL_MARGIN);
    
    for (int i = HORIZONTAL_MARGIN; i< cupImage.size.width - HORIZONTAL_MARGIN; ++i)
    {
        float elipseCurve = CUP_RADIUS_IN_PIXELS * sin( (i - HORIZONTAL_MARGIN) * (180.0f / (cupImage.size.width - 2.0f * HORIZONTAL_MARGIN)) * M_PI / 180.0f );
        for (int j = VERTICAL_MARGIN; j< cupImage.size.height - VERTICAL_MARGIN; ++j)
        {
            int x = (i - HORIZONTAL_MARGIN) * xScale;
            int y = (j - VERTICAL_MARGIN) * yScale;
            
            // get original pixel
            int pixelInfo = ((cameraImage.size.width * y) + x ) * 4; // png image
            UInt8 red = data[pixelInfo]; 
            UInt8 green = data[(pixelInfo + 1)]; 
            UInt8 blue = data[pixelInfo + 2]; 
            UInt8 alpha = data[pixelInfo + 3]; 
            UIColor* color = [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:(alpha*CUP_OPACITY)/255.0f]; 
            
            // put pixel
            CGContextRef context = UIGraphicsGetCurrentContext();
            CGContextSetFillColorWithColor(context, [color CGColor]);
            CGContextFillRect(context, CGRectMake(i + X_OFFSET, j + elipseCurve + Y_OFFSET, 1, 1));
        }
    }
    CFRelease(pixelData);
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultingImage;
}

@end
