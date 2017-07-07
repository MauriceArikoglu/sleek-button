//
//  SleekButton.m
//  tsm-lern
//
//  Created by Maurice Arikoglu on 07.07.17.
//  Copyright © 2017 Maurice Arikoglu. All rights reserved.
//

#import "SleekButton.h"

#define kButtonTitle @"titleLabel.font"

@interface SleekButton ()

@property (nonatomic, retain) UIFont *defaultFont;
@property (nonatomic) CGFloat titleAnimationUpscalePercentage;

@end

@implementation SleekButton

#pragma mark - Class methods

+ (Class)layerClass {
    //override and replace our layer to be a gradientLayer
    return [CAGradientLayer class];
}

- (void)dealloc {
    
    [self removeObserver:self forKeyPath:kButtonTitle];
    
}

- (void)initialScalingTrick {
    
    /*
     To animate our title, we need to perform some hacky magic shit
     We take the font set by the developer and store it as "defaultFont"
     Apply a downscale by the titleAnimationUpscalePercentage
     */
    [self lockObserver:self fromObservingWithKeyPath:kButtonTitle options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil block:^{
        
        self.defaultFont = self.titleLabel.font;
        
        CGFloat scaleMultiplicator = 1.0 + (_titleAnimationUpscalePercentage / 100.0);
        
        CGFloat newFontSize = scaleMultiplicator * _defaultFont.pointSize;
        
        UIFont *newFont = [UIFont fontWithName:_defaultFont.fontName size:newFontSize];
        
        [self.titleLabel setFont:newFont];
        
        [self.titleLabel setTransform:(_shouldAnimateTitle) ? CGAffineTransformMakeScale(1/scaleMultiplicator, 1/scaleMultiplicator) : CGAffineTransformMakeScale(1.0, 1.0)];
        
    }];

}

- (void)configureSleekButton {
    
    //add observer to monitor changes to the titleLabel from outside
    [self addObserver:self forKeyPath:kButtonTitle options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];

    self.gradientStyle = SleekGradientNoGradient;
    _titleAnimationUpscalePercentage = 5.0;

    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.layer.masksToBounds = NO;
    
    _gradientLightColor = UIColor.clearColor;
    _gradientDarkColor = UIColor.clearColor;
    
    _shouldAnimateTitle = YES;
    self.shouldDrawDropShadow = NO;
    self.shouldDrawCornerRadius = NO;
    
    //configuring the animation
    [self addTarget:self action:@selector(upsizeLabel) forControlEvents:UIControlEventTouchDown | UIControlEventTouchDragEnter];
    [self addTarget:self action:@selector(normalizeLabel) forControlEvents:UIControlEventTouchCancel | UIControlEventTouchDragExit | UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    
    if (self.titleLabel.font) {
                
        [self initialScalingTrick];
    }
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self configureSleekButton];
    
}

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {

        [self configureSleekButton];
        
    }
    
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:kButtonTitle]) {
        
        [self initialScalingTrick];
        
    }
    
}

#pragma mark - Custom Setters

- (void)setTitleAnimationScaleInPercent:(CGFloat)percent {
    
    _titleAnimationUpscalePercentage = percent;
    
    [self initialScalingTrick];
    
}

- (void)setShouldAnimateTitle:(BOOL)shouldAnimateTitle {
    
    _shouldAnimateTitle = shouldAnimateTitle;
    
    [self initialScalingTrick];
    
}

- (void)setShouldDrawDropShadow:(BOOL)shouldDrawDropShadow {
    
    _shouldDrawDropShadow = shouldDrawDropShadow;
    
    if (shouldDrawDropShadow) {
        
        self.layer.shadowColor = self.gradientDarkColor.CGColor;
        self.layer.shadowOpacity = .8;
        self.layer.shadowRadius = 4;
        self.layer.shadowOffset = CGSizeMake(0.0f, 4.0f);

    } else {
        
        self.layer.shadowColor = [UIColor clearColor].CGColor;
        self.layer.shadowOpacity = 0;
        self.layer.shadowRadius = 0;
        self.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);

    }
    
}

- (void)setShouldDrawCornerRadius:(BOOL)shouldDrawCornerRadius {
    
    _shouldDrawCornerRadius = shouldDrawCornerRadius;
    
    self.layer.cornerRadius = (shouldDrawCornerRadius) ? _cornerRadius : 0.0f;
    
}

- (void)setGradientStyle:(SleekGradient)gradientStyle {
    
    _gradientStyle = gradientStyle;
    
    /*
     x   y                  x   y
     0 | 0                  1 | 0
       -----------------------
       |        Layer        |
       |      Coordinate     |
       |       System        |
       -----------------------
     0 | 1                  1 | 1
     x   y                  x   y
     */
     
    switch (gradientStyle) {
        case SleekGradientLeftToRight: {
            
            CAGradientLayer *gradient = (CAGradientLayer *)self.layer;
            
            gradient.colors = @[(id)self.gradientLightColor.CGColor, (id)self.gradientDarkColor.CGColor];
            
            gradient.startPoint = CGPointMake(-0.25, .5);
            gradient.endPoint = CGPointMake(1.3, .5);
            
        } break;
            
        case SleekGradientTopLeftToBottomRight: {
            
            CAGradientLayer *gradient = (CAGradientLayer *)self.layer;
            
            gradient.colors = @[(id)self.gradientLightColor.CGColor, (id)self.gradientDarkColor.CGColor];
            
            gradient.startPoint = CGPointMake(-0.25, -0.25);
            gradient.endPoint = CGPointMake(1.3, 1);

        } break;
            
        case SleekGradientBottomLeftToTopRight: {
            
            CAGradientLayer *gradient = (CAGradientLayer *)self.layer;
            
            gradient.colors = @[(id)self.gradientLightColor.CGColor, (id)self.gradientDarkColor.CGColor];
            
            gradient.startPoint = CGPointMake(-0.25, 1);
            gradient.endPoint = CGPointMake(1.3, -0.25);

        } break;
            
        case SleekGradientTopRightToBottomLeft: {
            
            CAGradientLayer *gradient = (CAGradientLayer *)self.layer;
            
            gradient.colors = @[(id)self.gradientDarkColor.CGColor, (id)self.gradientLightColor.CGColor];
            
            gradient.startPoint = CGPointMake(-0.25, 1);
            gradient.endPoint = CGPointMake(1.3, -0.25);

        } break;
            
        case SleekGradientBottomRightToTopLeft: {
            
            CAGradientLayer *gradient = (CAGradientLayer *)self.layer;
            
            gradient.colors = @[(id)self.gradientDarkColor.CGColor, (id)self.gradientLightColor.CGColor];
            
            gradient.startPoint = CGPointMake(-0.25, -0.25);
            gradient.endPoint = CGPointMake(1.3, 1);

        } break;
            

        case SleekGradientNoGradient:
        default: {
          
            CAGradientLayer *gradient = (CAGradientLayer *)self.layer;
            
            gradient.colors = @[(id)UIColor.clearColor.CGColor, (id)UIColor.clearColor.CGColor];
            
            gradient.startPoint = CGPointMake(1, 1);
            gradient.endPoint = CGPointMake(0, 0);

        } break;
    }

    
}

- (void)setGradientLightColor:(UIColor *)gradientLightColor {
    
    _gradientLightColor = gradientLightColor;
    
    [self setGradientStyle:_gradientStyle];

}

- (void)setGradientDarkColor:(UIColor *)gradientDarkColor {
    
    _gradientDarkColor = gradientDarkColor;
    
    [self setGradientStyle:_gradientStyle];
    
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    
    _cornerRadius = cornerRadius;
    
    self.layer.cornerRadius = (_shouldDrawCornerRadius) ? cornerRadius : 0.0f;
    
}

#pragma mark - Perform a block without observers for a moment

- (void)lockObserver:(id)observer fromObservingWithKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context block:(void (^) ())block {
    
    [self removeObserver:observer forKeyPath:keyPath];

    block();
    
    [self addObserver:observer forKeyPath:keyPath options:options context:context];
    
}

#pragma mark - Title Animation Methods

- (void)upsizeLabel {

    [self lockObserver:self fromObservingWithKeyPath:kButtonTitle options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil block:^{
        
        [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            [self.titleLabel setTransform:CGAffineTransformMakeScale(1.0, 1.0)];
            
        } completion:nil];
        
    }];

}

- (void)normalizeLabel {
    
    [self lockObserver:self fromObservingWithKeyPath:kButtonTitle options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil block:^{
        
        CGFloat scaleMultiplicator = 1.0 + (_titleAnimationUpscalePercentage / 100.0);
        
        [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            [self.titleLabel setTransform:CGAffineTransformMakeScale(1/scaleMultiplicator, 1/scaleMultiplicator)];
            
        } completion:nil];

    }];

}


@end
