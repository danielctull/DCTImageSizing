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

	CGRect imageRect = [DCTContentSizer rectForOriginalSize:self.size desiredSize:size contentMode:contentMode];
	UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
	CGImageRef sourceImg = CGImageCreateWithImageInRect([self CGImage], imageRect);
	[self drawInRect:imageRect];
	CGImageRelease(sourceImg);
	UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();

	return image;
}

@end
