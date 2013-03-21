//
//  LinearGradientView.h
//
//  Created by Thomas Goode on 7/26/12.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface LinearGradientView : UIView

// Note: colors must be in the RGB color space to display.
@property (nonatomic, strong) UIColor *firstColor;
@property (nonatomic, strong) UIColor *secondColor;
@property (nonatomic) BOOL isHorizontal;

+ (UIView *)linearGradientViewForView:(UIView *)view;

@end
