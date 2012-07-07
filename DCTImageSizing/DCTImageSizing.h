//
//  DCTImageSizing.h
//  DCTImageSizing
//
//  Created by Daniel Tull on 07/07/2012.
//  Copyright (c) 2012 Daniel Tull. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DCTImageSizing)

- (UIImage *)dct_imageWithSize:(CGSize)size contentMode:(UIViewContentMode)contentMode;

@end
