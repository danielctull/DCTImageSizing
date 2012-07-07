//
//  DCTImageSizing.m
//  DCTImageSizing
//
//  Created by Daniel Tull on 07/07/2012.
//  Copyright (c) 2012 Daniel Tull. All rights reserved.
//

#import "DCTImageSizing.h"
#import "DCTContentSizer.h"

@implementation UIImage (DCTImageSizing)

- (UIImage *)dct_imageWithSize:(CGSize)size contentMode:(UIViewContentMode)contentMode {
	
	CGImageRef imageRef = self.CGImage;
	
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGContextRef context = CGBitmapContextCreate(NULL, size.width, size.height, 8, 0, colorSpace, kCGImageAlphaNoneSkipLast);

	CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
	CGContextSetFillColor(context, CGColorGetComponents([UIColor whiteColor].CGColor));
	CGContextFillRect(context, rect);

	CGRect imageRect = [DCTContentSizer rectForOriginalSize:self.size desiredSize:size contentMode:contentMode];
	CGContextDrawImage(context, imageRect, imageRef);

	CGImageRef scaledImageRef = CGBitmapContextCreateImage(context);
	UIImage *scaledImage = [UIImage imageWithCGImage:scaledImageRef];

	CGColorSpaceRelease(colorSpace);
	CGContextRelease(context);
	CGImageRelease(scaledImageRef);

	return scaledImage;
}

@end
