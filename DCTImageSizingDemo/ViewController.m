//
//  ViewController.m
//  DCTImageSizingDemo
//
//  Created by Daniel Tull on 07/07/2012.
//  Copyright (c) 2012 Daniel Tull. All rights reserved.
//

#import "ViewController.h"
#import <DCTImageSizing/DCTImageSizing.h>

NSString * const DCTUIViewContentModeStrings[] = {
	@"ScaleToFill",
	@"ScaleAspectFit",
	@"ScaleAspectFill",
	@"Redraw",
	@"Center",
	@"Top",
	@"Bottom",
	@"Left",
	@"Right",
	@"TopLeft",
	@"TopRight",
	@"BottomLeft",
	@"BottomRight",
};

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *resizedImageView;
@property (nonatomic, weak) IBOutlet UIImageView *contentModeImageView;
@end

@implementation ViewController {
	__strong UIImage *_image;
	CGSize imageViewSize;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	_image = [UIImage imageNamed:@"gravtug_durda_smallf.jpg"];
	self.contentModeImageView.image = _image;
	self.resizedImageView.image = _image;
	CGSize size = self.resizedImageView.bounds.size;
	CGFloat scale = self.resizedImageView.contentScaleFactor;
	imageViewSize = CGSizeMake(size.width * scale, size.height * scale);
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	return 13;
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	return DCTUIViewContentModeStrings[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	self.contentModeImageView.contentMode = row;

	self.resizedImageView.image = [_image dct_imageWithSize:imageViewSize contentMode:row];
	
}

@end
