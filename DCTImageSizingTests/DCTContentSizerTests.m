//
//  DCTContentSizerTests.m
//  DCTImageSizing
//
//  Created by Daniel Tull on 07/07/2012.
//  Copyright (c) 2012 Daniel Tull. All rights reserved.
//

#import "DCTContentSizerTests.h"
#import <DCTImageSizing/DCTContentSizer.h>

@implementation DCTContentSizerTests {
	CGSize originalSize;
	CGSize desiredSize;
}

- (void)setUp {
    [super setUp];
	originalSize = CGSizeMake(400.0f, 400.0f);
	desiredSize = CGSizeMake(100.0f, 200.0f);
}

- (void)testUIViewContentModeScaleAspectFit {
	CGRect rect = [DCTContentSizer rectForOriginalSize:originalSize
										   desiredSize:desiredSize
										   contentMode:UIViewContentModeScaleAspectFit];
	CGRect expectedRect = CGRectMake(0.0f, 50.0f, 100.0f, 100.0f);
	STAssertTrue(CGRectEqualToRect(expectedRect, rect), @"expectedRect:%@ rect:%@", NSStringFromCGRect(expectedRect), NSStringFromCGRect(rect));
}

- (void)testUIViewContentModeScaleAspectFill {
	CGRect rect = [DCTContentSizer rectForOriginalSize:originalSize
										   desiredSize:desiredSize
										   contentMode:UIViewContentModeScaleAspectFill];
	CGRect expectedRect = CGRectMake(-50.0f, 0.0f, 200.0f, 200.0f);
	STAssertTrue(CGRectEqualToRect(expectedRect, rect), @"expectedRect:%@ rect:%@", NSStringFromCGRect(expectedRect), NSStringFromCGRect(rect));
}

- (void)testUIViewContentModeScaleToFill {
	CGRect rect = [DCTContentSizer rectForOriginalSize:originalSize
										   desiredSize:desiredSize
										   contentMode:UIViewContentModeScaleToFill];
	CGRect expectedRect = CGRectMake(0.0f, 0.0f, 100.0f, 200.0f);
	STAssertTrue(CGRectEqualToRect(expectedRect, rect), @"expectedRect:%@ rect:%@", NSStringFromCGRect(expectedRect), NSStringFromCGRect(rect));
}

- (void)testUIViewContentModeRedraw {
	CGRect rect = [DCTContentSizer rectForOriginalSize:originalSize
										   desiredSize:desiredSize
										   contentMode:UIViewContentModeRedraw];
	CGRect expectedRect = CGRectMake(0.0f, 0.0f, 400.0f, 400.0f);
	STAssertTrue(CGRectEqualToRect(expectedRect, rect), @"expectedRect:%@ rect:%@", NSStringFromCGRect(expectedRect), NSStringFromCGRect(rect));
}

- (void)testUIViewContentModeCenter {
	CGRect rect = [DCTContentSizer rectForOriginalSize:originalSize
										   desiredSize:desiredSize
										   contentMode:UIViewContentModeCenter];
	CGRect expectedRect = CGRectMake(-150.0f, -100.0f, 400.0f, 400.0f);
	STAssertTrue(CGRectEqualToRect(expectedRect, rect), @"expectedRect:%@ rect:%@", NSStringFromCGRect(expectedRect), NSStringFromCGRect(rect));
}

- (void)testUIViewContentModeTop {
	CGRect rect = [DCTContentSizer rectForOriginalSize:originalSize
										   desiredSize:desiredSize
										   contentMode:UIViewContentModeTop];
	CGRect expectedRect = CGRectMake(-150.0f, 0.0f, 400.0f, 400.0f);
	STAssertTrue(CGRectEqualToRect(expectedRect, rect), @"expectedRect:%@ rect:%@", NSStringFromCGRect(expectedRect), NSStringFromCGRect(rect));
}

- (void)testUIViewContentModeBottom {
	CGRect rect = [DCTContentSizer rectForOriginalSize:originalSize
										   desiredSize:desiredSize
										   contentMode:UIViewContentModeBottom];
	CGRect expectedRect = CGRectMake(-150.0f, -200.0f, 400.0f, 400.0f);
	STAssertTrue(CGRectEqualToRect(expectedRect, rect), @"expectedRect:%@ rect:%@", NSStringFromCGRect(expectedRect), NSStringFromCGRect(rect));
}

- (void)testUIViewContentModeLeft {
	CGRect rect = [DCTContentSizer rectForOriginalSize:originalSize
										   desiredSize:desiredSize
										   contentMode:UIViewContentModeLeft];
	CGRect expectedRect = CGRectMake(0.0f, -100.0f, 400.0f, 400.0f);
	STAssertTrue(CGRectEqualToRect(expectedRect, rect), @"expectedRect:%@ rect:%@", NSStringFromCGRect(expectedRect), NSStringFromCGRect(rect));
}

- (void)testUIViewContentModeRight {
	CGRect rect = [DCTContentSizer rectForOriginalSize:originalSize
										   desiredSize:desiredSize
										   contentMode:UIViewContentModeRight];
	CGRect expectedRect = CGRectMake(-300.0f, -100.0f, 400.0f, 400.0f);
	STAssertTrue(CGRectEqualToRect(expectedRect, rect), @"expectedRect:%@ rect:%@", NSStringFromCGRect(expectedRect), NSStringFromCGRect(rect));
}

- (void)testUIViewContentModeTopLeft {
	CGRect rect = [DCTContentSizer rectForOriginalSize:originalSize
										   desiredSize:desiredSize
										   contentMode:UIViewContentModeTopLeft];
	CGRect expectedRect = CGRectMake(0.0f, 0.0f, 400.0f, 400.0f);
	STAssertTrue(CGRectEqualToRect(expectedRect, rect), @"expectedRect:%@ rect:%@", NSStringFromCGRect(expectedRect), NSStringFromCGRect(rect));
}

- (void)testUIViewContentModeTopRight {
	CGRect rect = [DCTContentSizer rectForOriginalSize:originalSize
										   desiredSize:desiredSize
										   contentMode:UIViewContentModeTopRight];
	CGRect expectedRect = CGRectMake(-300.0f, 0.0f, 400.0f, 400.0f);
	STAssertTrue(CGRectEqualToRect(expectedRect, rect), @"expectedRect:%@ rect:%@", NSStringFromCGRect(expectedRect), NSStringFromCGRect(rect));
}

- (void)testUIViewContentModeBottomLeft {
	CGRect rect = [DCTContentSizer rectForOriginalSize:originalSize
										   desiredSize:desiredSize
										   contentMode:UIViewContentModeBottomLeft];
	CGRect expectedRect = CGRectMake(0.0f, -200.0f, 400.0f, 400.0f);
	STAssertTrue(CGRectEqualToRect(expectedRect, rect), @"expectedRect:%@ rect:%@", NSStringFromCGRect(expectedRect), NSStringFromCGRect(rect));
}

- (void)testUIViewContentModeBottomRight {
	CGRect rect = [DCTContentSizer rectForOriginalSize:originalSize
										   desiredSize:desiredSize
										   contentMode:UIViewContentModeBottomRight];
	CGRect expectedRect = CGRectMake(-300.0f, -200.0f, 400.0f, 400.0f);
	STAssertTrue(CGRectEqualToRect(expectedRect, rect), @"expectedRect:%@ rect:%@", NSStringFromCGRect(expectedRect), NSStringFromCGRect(rect));
}

@end
