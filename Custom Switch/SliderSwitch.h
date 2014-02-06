//
//  SlideView.h
//  Custom Switch
//
//  Created by Abhishek's Mac Mini  on 04/03/13.
//  Copyright (c) 2013 Abhishek's Mac . All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@protocol SliderSwitchDelegate;

@interface SliderSwitch : UIView

@property (nonatomic) int numberOflabels;
@property (nonatomic, retain) UILabel *labelOne, *labelTwo, *labelThree, *labelFour, *labelFive;
@property (nonatomic,retain) UIButton *toggleButton;
@property (nonatomic,assign) id<SliderSwitchDelegate> delegate;
@property (nonatomic, readonly) NSUInteger selectedIndex;
@property (nonatomic, retain) UIFont *selectedFont;
@property (nonatomic, retain) UIColor *selectedColor;
@property (nonatomic, retain) UIFont *unSelectedFont;
@property (nonatomic, retain) UIColor *unSelectedColor;

- (void)setFrameVertical:(CGRect)frame numberOfFields:(NSInteger *)number withCornerRadius:(CGFloat)cornerRadius;
- (void)setFrameHorizontal:(CGRect)frame numberOfFields:(NSInteger *)number withCornerRadius:(CGFloat)cornerRadius;
- (void)setText:(NSString *)text forTextIndex:(NSInteger *)number;

- (void)wasDraggedHorizontal:(UIButton *)button withEvent:(UIEvent *)event;
- (void)wasDraggedVertical:(UIButton *)button withEvent:(UIEvent *)event;

- (void)finishedDraggingHorizontal:(UIButton *)button withEvent:(UIEvent *)event;
- (void)finishedDraggingVertical:(UIButton *)button withEvent:(UIEvent *)event;
- (void)setFrameBackgroundColor:(UIColor *)color;
- (void)setSwitchFrameColor:(UIColor *)color;
- (void)setTextColor:(UIColor *)color;
-(void)setSwitchBorderWidth:(CGFloat)width;
-(void)changeSelectedLayer;

@end

@protocol SliderSwitchDelegate <NSObject>

-(void)switchChangedSliderSwitch:(SliderSwitch *)sliderSwitch;

@end




