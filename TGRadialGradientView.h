//
//  TGRadialGradientView.h
//
//  Created by Thomas Goode on 7/21/12.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface TGRadialGradientView : UIView

// Note: colors must be in the RGB color space to display.
@property (nonatomic, strong) UIColor *innerColor;
@property (nonatomic, strong) UIColor *outerColor;

+ (UIView *)radialGradientViewForView:(UIView *)view;

@end
