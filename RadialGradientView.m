//
//  RadialGradientView.m
//
//  Created by Thomas Goode on 7/21/12.
//

#import "RadialGradientView.h"

@interface RadialGradientView ()

@property (nonatomic) CGGradientRef gradient;

- (void)redrawGradient;

@end

@implementation RadialGradientView

@synthesize gradient = _gradient;
@synthesize innerColor = _innerColor;
@synthesize outerColor = _outerColor;

+ (UIView *)radialGradientViewForView:(UIView *)view {
	return [[RadialGradientView alloc] initWithFrame:view.bounds];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef currentContext = UIGraphicsGetCurrentContext();

    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));

    CGContextDrawRadialGradient(currentContext, self.gradient, center, 0, center, 300, 3);
}

- (void)redrawGradient {
	// invalidate the gradient layer so it is regenerated
	self.gradient = nil;
	[self setNeedsDisplay];
}

#pragma mark Custom getters/setters
- (CGGradientRef)gradient {
	if (!_gradient) {
		CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();

		CGFloat locations[] = { 0.0, 1.0 };
		CFArrayRef colors = (__bridge CFArrayRef)[NSArray arrayWithObjects:(id)[self.innerColor CGColor], (id)[self.outerColor CGColor], nil];

		_gradient = CGGradientCreateWithColors(colorSpace, colors, locations);
		CGColorSpaceRelease(colorSpace);
	}
	return _gradient;
}

- (UIColor *)innerColor {
	if (!_innerColor) {
		return [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
	}
	return _innerColor;
}

- (UIColor *)outerColor {
	if (!_outerColor) {
		return [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
	}
	return _outerColor;
}

- (void)setInnerColor:(UIColor *)innerColor {
	_innerColor = innerColor;
	[self redrawGradient];
}

- (void)setOuterColor:(UIColor *)outerColor {
	_outerColor = outerColor;
	[self redrawGradient];
}

@end
