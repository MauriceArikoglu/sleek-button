//
//  SleekButton.h
//  tsm-lern
//
//  Created by Maurice Arikoglu on 07.07.17.
//  Copyright © 2017 Maurice Arikoglu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SleekGradient) {
    
    SleekGradientNoGradient,
    SleekGradientLeftToRight,
    SleekGradientTopLeftToBottomRight,
    SleekGradientBottomLeftToTopRight,
    SleekGradientTopRightToBottomLeft,
    SleekGradientBottomRightToTopLeft

    
};

@interface SleekButton : UIButton

@property (nonatomic) SleekGradient gradientStyle;
@property (nonatomic) BOOL shouldDrawDropShadow;
@property (nonatomic) BOOL shouldDrawCornerRadius;
@property (nonatomic) BOOL shouldAnimateTitle;

@property (nonatomic, retain) UIColor *gradientLightColor;
@property (nonatomic, retain) UIColor *gradientDarkColor;

@property (nonatomic) CGFloat cornerRadius;

- (void)setTitleAnimationScaleInPercent:(CGFloat)percent;

@end
