//
//  LinearGradientView.m
//
//  Created by Thomas Goode on 7/26/12.
//

#import "LinearGradientView.h"

@interface LinearGradientView ()

- (void)drawGradient;

@end

@implementation LinearGradientView

@synthesize firstColor = _firstColor;
@synthesize secondColor = _secondColor;
@synthesize isHorizontal = _isHorizontal;

+ (UIView *)linearGradientViewForView:(UIView *)view {
	return [[LinearGradientView alloc] initWithFrame:view.bounds];
}

- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		self.isHorizontal = NO;
		[self setupGradientLayer];
	}
	return self;
}

+ (Class)layerClass {
	return [CAGradientLayer class];
}

- (void)setupGradientLayer {
	self.layer.bounds = [self bounds];
	self.layer.masksToBounds = YES;
	self.layer.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
	[self drawGradient];
}

- (void)drawGradient {
	[(CAGradientLayer *)self.layer setColors:[NSArray arrayWithObjects:(id)[self.firstColor CGColor], (id)[self.secondColor CGColor], nil]];
}

#pragma mark Custom getters/setters
- (UIColor *)firstColor {
	if (!_firstColor) {
		return [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
	}
	return _firstColor;
}

- (UIColor *)secondColor {
	if (!_secondColor) {
		return [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
	}
	return _secondColor;
}

- (void)setFirstColor:(UIColor *)firstColor {
	_firstColor = firstColor;
	[self drawGradient];
}

- (void)setSecondColor:(UIColor *)secondColor {
	_secondColor = secondColor;
	[self drawGradient];
}

- (void)setIsHorizontal:(BOOL)isHorizontal {
	_isHorizontal = isHorizontal;
	if (_isHorizontal) {
		[(CAGradientLayer *)self.layer setStartPoint:CGPointMake(0.0, 0.5)];
		[(CAGradientLayer *)self.layer setEndPoint:CGPointMake(1.0, 0.5)];
	}
	else {
		[(CAGradientLayer *)self.layer setStartPoint:CGPointMake(0.5, 0.0)];
		[(CAGradientLayer *)self.layer setEndPoint:CGPointMake(0.5, 1.0)];
	}
	[self drawGradient];
}

@end
