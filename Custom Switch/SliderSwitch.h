//
//  SliderSwitch.h
//  Slider Switch Demo
//  Created by Torry Harris on 21/01/13.
//  Copyright (c) 2014 Torry Harris's Mac . All rights reserved.
//  Modified by Torry Harris on 6th March, 2014.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@protocol SliderSwitchDelegate;

@interface SliderSwitch : UIView

@property (nonatomic) int numberOflabels;
@property (nonatomic, retain, readonly) UILabel *labelOne, *labelTwo, *labelThree, *labelFour, *labelFive;
@property (nonatomic,retain) UIButton *toggleButton;
@property (nonatomic,assign) id<SliderSwitchDelegate> delegate;
@property (nonatomic, readonly) NSUInteger selectedIndex;
@property (nonatomic, retain) UIFont *selectedFont;
@property (nonatomic, retain) UIColor *selectedColor;
@property (nonatomic, retain) UIFont *unSelectedFont;
@property (nonatomic, retain) UIColor *unSelectedColor;

- (void)setFrameVertical:(CGRect)frame numberOfFields:(NSUInteger)number withCornerRadius:(CGFloat)cornerRadius;
- (void)setFrameHorizontal:(CGRect)frame numberOfFields:(NSUInteger)number withCornerRadius:(CGFloat)cornerRadius;
- (void)setText:(NSString *)text atLabelIndex:(NSUInteger)number;
- (void)wasDraggedHorizontal:(UIButton *)button withEvent:(UIEvent *)event;
- (void)wasDraggedVertical:(UIButton *)button withEvent:(UIEvent *)event;
- (void)finishedDraggingHorizontal:(UIButton *)button withEvent:(UIEvent *)event;
- (void)finishedDraggingVertical:(UIButton *)button withEvent:(UIEvent *)event;
- (void)setFrameBackgroundColor:(UIColor *)color;
- (void)setSwitchFrameColor:(UIColor *)color;
- (void)setSwitchBorderWidth:(CGFloat)width;
- (void)changeSelectedLayer;

@end

@protocol SliderSwitchDelegate <NSObject>

-(void)switchChangedSliderSwitch:(SliderSwitch *)sliderSwitch;

@end




