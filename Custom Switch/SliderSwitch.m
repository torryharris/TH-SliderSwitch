//
//  SlideView.m
//  Custom Switch
//
//  Created by Abhishek's Mac Mini  on 04/03/13.
//  Copyright (c) 2013 Abhishek's Mac . All rights reserved.
//

#import "SliderSwitch.h"

@implementation SliderSwitch
@synthesize labelTwo,labelOne,labelFour,labelFive,labelThree;
@synthesize toggleButton,numberOflabels;

@synthesize delegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code       
   
    }
    
    return self;
}

//override hitTest to interact with current sub view
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSEnumerator *reverseE = [self.subviews reverseObjectEnumerator];
    UIView *iSubView;
    
    while ((iSubView = [reverseE nextObject])) {
        
        UIView *viewWasHit = [iSubView hitTest:[self convertPoint:point toView:iSubView] withEvent:event];
        if(viewWasHit) {
            return viewWasHit;
        }
        
    }
    return [super hitTest:point withEvent:event];
}


//create a vertical slider switch where frame passed is the frame for switch,numberOfFields is the number of available option
- (void)setFrameVertical:(CGRect)frame numberOfFields:(NSInteger *)number withCornerRadius:(CGFloat)cornerRadius
{
    
    //divide frame height by numberOfFields to decide height of each option
    long double height;
    int n=(int)number;
    numberOflabels=n;
    long double f=(long double)frame.size.height;
    height=f/n;        
    
    //Prepare frame For two Options
    if (number==(NSInteger *)2) {
        labelOne = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width,height)];
        labelOne.textAlignment=UITextAlignmentCenter;
        [labelOne.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerLeft = [CAShapeLayer layer];
        UIBezierPath *maskPathLeft=[UIBezierPath bezierPathWithRoundedRect:labelOne.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        maskLayerLeft.path = maskPathLeft.CGPath;
        labelOne.layer.mask = maskLayerLeft;
        [self addSubview:labelOne];
        
        labelTwo = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y+height, frame.size.width, height)];
        labelTwo.textAlignment=UITextAlignmentCenter;
        CAShapeLayer *maskLayerRight = [CAShapeLayer layer];
        UIBezierPath *maskPathRight=[UIBezierPath bezierPathWithRoundedRect:labelTwo.bounds byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerBottomLeft) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        
        maskLayerRight.path = maskPathRight.CGPath;
        labelTwo.layer.mask = maskLayerRight;
        [self addSubview:labelTwo];
        
        labelOne.userInteractionEnabled=YES;
        labelTwo.userInteractionEnabled=YES;
        UITapGestureRecognizer *tapGestureLabelone =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelOneWithGesture:)];
        [labelOne addGestureRecognizer:tapGestureLabelone];
        UITapGestureRecognizer *tapGestureLabelTwo =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelTwoWithGesture:)];
        [labelTwo addGestureRecognizer:tapGestureLabelTwo];
    }
    
    //Prepare frame For Three Options
    
    if (number==(NSInteger *)3) {
        
        labelOne = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, height)];
        labelOne.textAlignment=UITextAlignmentCenter;
        [labelOne.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerLeft = [CAShapeLayer layer];
        UIBezierPath *maskPathLeft=[UIBezierPath bezierPathWithRoundedRect:labelOne.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        maskLayerLeft.path = maskPathLeft.CGPath;
        labelOne.layer.mask = maskLayerLeft;
        [self addSubview:labelOne];
        
        labelTwo = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y+height, frame.size.width, height)];
        labelTwo.textAlignment=UITextAlignmentCenter;
        [self addSubview:labelTwo];
        
        labelThree = [[UILabel alloc] initWithFrame:CGRectMake(labelTwo.frame.origin.x, labelTwo.frame.origin.y+height, frame.size.width, height)];
        labelThree.textAlignment=UITextAlignmentCenter;
        [labelThree.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerRight = [CAShapeLayer layer];
        UIBezierPath *maskPathRight=[UIBezierPath bezierPathWithRoundedRect:labelThree.bounds byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerBottomLeft) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        
        maskLayerRight.path = maskPathRight.CGPath;
        labelThree.layer.mask = maskLayerRight;
        [self addSubview:labelThree];
        
        labelOne.userInteractionEnabled=YES;
        labelTwo.userInteractionEnabled=YES;
        labelThree.userInteractionEnabled=YES;
        UITapGestureRecognizer *tapGestureLabelone =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelOneWithGesture:)];
        [labelOne addGestureRecognizer:tapGestureLabelone];
        UITapGestureRecognizer *tapGestureLabelTwo =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelTwoWithGesture:)];
        [labelTwo addGestureRecognizer:tapGestureLabelTwo];
        UITapGestureRecognizer *tapGestureLabelThree =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelThreeWithGesture:)];
        [labelThree addGestureRecognizer:tapGestureLabelThree];       
                
    }
    
    //Prepare frame For Four Options  
    
    if (number==(NSInteger *)4) {
        
        labelOne = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, height)];
        labelOne.textAlignment=UITextAlignmentCenter;
        [labelOne.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerLeft = [CAShapeLayer layer];
        UIBezierPath *maskPathLeft=[UIBezierPath bezierPathWithRoundedRect:labelOne.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        maskLayerLeft.path = maskPathLeft.CGPath;
        labelOne.layer.mask = maskLayerLeft;
        [self addSubview:labelOne];        
        labelTwo = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y+height, frame.size.width, height)];
        labelTwo.textAlignment=UITextAlignmentCenter;
        [self addSubview:labelTwo];        
        labelThree = [[UILabel alloc] initWithFrame:CGRectMake(labelTwo.frame.origin.x, labelTwo.frame.origin.y+height, frame.size.width, height)];
        labelThree.textAlignment=UITextAlignmentCenter;
        [labelThree.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        [self addSubview:labelThree];       
        labelFour = [[UILabel alloc] initWithFrame:CGRectMake(labelThree.frame.origin.x, labelThree.frame.origin.y+height, frame.size.width, height)];
        labelFour.textAlignment=UITextAlignmentCenter;
        [labelFour.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerRight = [CAShapeLayer layer];
        UIBezierPath *maskPathRight=[UIBezierPath bezierPathWithRoundedRect:labelFour.bounds byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerBottomLeft) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        
        maskLayerRight.path = maskPathRight.CGPath;
        labelFour.layer.mask = maskLayerRight;
        [self addSubview:labelFour];        
        labelOne.userInteractionEnabled=YES;
        labelTwo.userInteractionEnabled=YES;
        labelThree.userInteractionEnabled=YES;
        labelFour.userInteractionEnabled=YES;
        UITapGestureRecognizer *tapGestureLabelone =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelOneWithGesture:)];
        [labelOne addGestureRecognizer:tapGestureLabelone];
        UITapGestureRecognizer *tapGestureLabelTwo =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelTwoWithGesture:)];
        [labelTwo addGestureRecognizer:tapGestureLabelTwo];
        UITapGestureRecognizer *tapGestureLabelThree =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelThreeWithGesture:)];
        [labelThree addGestureRecognizer:tapGestureLabelThree];
        UITapGestureRecognizer *tapGestureLabelFour =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelFourWithGesture:)];
        [labelFour addGestureRecognizer:tapGestureLabelFour];
    }
    
    //Prepare frame For Five Options
    if (number==(NSInteger *)5) {
        
        labelOne = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, height)];
        labelOne.textAlignment=UITextAlignmentCenter;
        [labelOne.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerLeft = [CAShapeLayer layer];
        UIBezierPath *maskPathLeft=[UIBezierPath bezierPathWithRoundedRect:labelOne.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        maskLayerLeft.path = maskPathLeft.CGPath;
        labelOne.layer.mask = maskLayerLeft;
        [self addSubview:labelOne];        
        labelTwo = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y+height, frame.size.width, height)];
        labelTwo.textAlignment=UITextAlignmentCenter;
        [self addSubview:labelTwo];        
        labelThree = [[UILabel alloc] initWithFrame:CGRectMake(labelTwo.frame.origin.x, labelTwo.frame.origin.y+height, frame.size.width, height)];
        labelThree.textAlignment=UITextAlignmentCenter;
        [labelThree.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        [self addSubview:labelThree];     
        
        labelFour = [[UILabel alloc] initWithFrame:CGRectMake(labelThree.frame.origin.x, labelThree.frame.origin.y+height, frame.size.width, height)];
        labelFour.textAlignment=UITextAlignmentCenter;
        [labelFour.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];        
        [self addSubview:labelFour];        
        labelFive = [[UILabel alloc] initWithFrame:CGRectMake(labelFour.frame.origin.x, labelFour.frame.origin.y+height, frame.size.width, height)];
        labelFive.textAlignment=UITextAlignmentCenter;
        [labelFive.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerRight = [CAShapeLayer layer];
        UIBezierPath *maskPathRight=[UIBezierPath bezierPathWithRoundedRect:labelFive.bounds byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerBottomLeft) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];        
        maskLayerRight.path = maskPathRight.CGPath;
        labelFive.layer.mask = maskLayerRight;
        [self addSubview:labelFive];        
        labelOne.userInteractionEnabled=YES;
        labelTwo.userInteractionEnabled=YES;
        labelThree.userInteractionEnabled=YES;
        labelFour.userInteractionEnabled=YES;
        labelFive.userInteractionEnabled=YES;
        UITapGestureRecognizer *tapGestureLabelone =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelOneWithGesture:)];
        [labelOne addGestureRecognizer:tapGestureLabelone];
        UITapGestureRecognizer *tapGestureLabelTwo =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelTwoWithGesture:)];
        [labelTwo addGestureRecognizer:tapGestureLabelTwo];
        UITapGestureRecognizer *tapGestureLabelThree =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelThreeWithGesture:)];
        [labelThree addGestureRecognizer:tapGestureLabelThree];
        UITapGestureRecognizer *tapGestureLabelFour =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelFourWithGesture:)];
        [labelFour addGestureRecognizer:tapGestureLabelFour];
        UITapGestureRecognizer *tapGestureLabelFive =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelFiveWithGesture:)];
        [labelFive addGestureRecognizer:tapGestureLabelFive];        
        
    }
    
    //Add Switch button to the frame and place it at first option    
    toggleButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[toggleButton setTitle:@"" forState:UIControlStateNormal];    
	// add drag listener
	[toggleButton addTarget:self action:@selector(wasDraggedVertical:withEvent:)
           forControlEvents:UIControlEventTouchDragInside];    
    [toggleButton addTarget:self action:@selector(finishedDraggingVertical:withEvent:)
           forControlEvents:UIControlEventTouchUpInside];    
	toggleButton.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, height);
    toggleButton.backgroundColor=[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    [toggleButton.layer setBorderWidth:4.0];
    [toggleButton.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    toggleButton.layer.cornerRadius=cornerRadius;
   	[self addSubview:toggleButton];
        
    
}



//create a horizontal slider switch where frame passed is the frame for switch,numberOfFields is the number of available option
- (void)setFrameHorizontal:(CGRect)frame numberOfFields:(NSInteger *)number withCornerRadius:(CGFloat)cornerRadius
{
    //divide frame width by numberOfFields to decide width of each option
    float width;
    int n=(int)number;
    numberOflabels=n;
    float f=(float)frame.size.width;    
    width=f/n;    
    
    //Prepare frame For two Options
    if (number==(NSInteger *)2) {
        labelOne = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, width, frame.size.height)];
        labelOne.textAlignment=UITextAlignmentCenter;
        [labelOne.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerLeft = [CAShapeLayer layer];
        UIBezierPath *maskPathLeft=[UIBezierPath bezierPathWithRoundedRect:labelOne.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerBottomLeft) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        maskLayerLeft.path = maskPathLeft.CGPath;
        labelOne.layer.mask = maskLayerLeft;
        [self addSubview:labelOne];        
        labelTwo = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x+width, frame.origin.y, width, frame.size.height)];
        labelTwo.textAlignment=UITextAlignmentCenter;
        CAShapeLayer *maskLayerRight = [CAShapeLayer layer];
        UIBezierPath *maskPathRight=[UIBezierPath bezierPathWithRoundedRect:labelTwo.bounds byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerTopRight) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];        
        maskLayerRight.path = maskPathRight.CGPath;
        labelTwo.layer.mask = maskLayerRight;
        [self addSubview:labelTwo];        
        labelOne.userInteractionEnabled=YES;
        labelTwo.userInteractionEnabled=YES;
        UITapGestureRecognizer *tapGestureLabelone =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelOneWithGesture:)];
        [labelOne addGestureRecognizer:tapGestureLabelone];
        UITapGestureRecognizer *tapGestureLabelTwo =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelTwoWithGesture:)];
        [labelTwo addGestureRecognizer:tapGestureLabelTwo];
    }
    
    //Prepare frame For three Options    
    if (number==(NSInteger *)3) {
        
        labelOne = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, width, frame.size.height)];
        labelOne.textAlignment=UITextAlignmentCenter;
        [labelOne.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerLeft = [CAShapeLayer layer];
        UIBezierPath *maskPathLeft=[UIBezierPath bezierPathWithRoundedRect:labelOne.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerBottomLeft) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        maskLayerLeft.path = maskPathLeft.CGPath;
        labelOne.layer.mask = maskLayerLeft;
        [self addSubview:labelOne];        
        labelTwo = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x+width, frame.origin.y, width, frame.size.height)];
        labelTwo.textAlignment=UITextAlignmentCenter;
        [self addSubview:labelTwo];        
        labelThree = [[UILabel alloc] initWithFrame:CGRectMake(labelTwo.frame.origin.x+width, frame.origin.y, width, frame.size.height)];
        labelThree.textAlignment=UITextAlignmentCenter;
        [labelThree.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerRight = [CAShapeLayer layer];
        UIBezierPath *maskPathRight=[UIBezierPath bezierPathWithRoundedRect:labelThree.bounds byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerTopRight) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];        
        maskLayerRight.path = maskPathRight.CGPath;
        labelThree.layer.mask = maskLayerRight;
        [self addSubview:labelThree];        
        labelOne.userInteractionEnabled=YES;
        labelTwo.userInteractionEnabled=YES;
        labelThree.userInteractionEnabled=YES;
        UITapGestureRecognizer *tapGestureLabelone =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelOneWithGesture:)];
        [labelOne addGestureRecognizer:tapGestureLabelone];
        UITapGestureRecognizer *tapGestureLabelTwo =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelTwoWithGesture:)];
        [labelTwo addGestureRecognizer:tapGestureLabelTwo];
        UITapGestureRecognizer *tapGestureLabelThree =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelThreeWithGesture:)];
        [labelThree addGestureRecognizer:tapGestureLabelThree];
    }
    
    //Prepare frame For four Options    
    if (number==(NSInteger *)4) {
        labelOne = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, width, frame.size.height)];
        labelOne.textAlignment=UITextAlignmentCenter;
        [labelOne.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerLeft = [CAShapeLayer layer];
        UIBezierPath *maskPathLeft=[UIBezierPath bezierPathWithRoundedRect:labelOne.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerBottomLeft) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        maskLayerLeft.path = maskPathLeft.CGPath;
        labelOne.layer.mask = maskLayerLeft;
        [self addSubview:labelOne];        
        labelTwo = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x+width, frame.origin.y, width, frame.size.height)];
        labelTwo.textAlignment=UITextAlignmentCenter;
        [labelTwo.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        [self addSubview:labelTwo];        
        labelThree = [[UILabel alloc] initWithFrame:CGRectMake(labelTwo.frame.origin.x+width, frame.origin.y, width, frame.size.height)];
        labelThree.textAlignment=UITextAlignmentCenter;
        [labelThree.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        [self addSubview:labelThree];        
        labelFour = [[UILabel alloc] initWithFrame:CGRectMake(labelThree.frame.origin.x+width, frame.origin.y, width, frame.size.height)];
        labelFour.textAlignment=UITextAlignmentCenter;
        [labelFour.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerRight = [CAShapeLayer layer];
        UIBezierPath *maskPathRight=[UIBezierPath bezierPathWithRoundedRect:labelFour.bounds byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerTopRight) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];        
        maskLayerRight.path = maskPathRight.CGPath;
        labelFour.layer.mask = maskLayerRight;
        [self addSubview:labelFour];        
        labelOne.userInteractionEnabled=YES;
        labelTwo.userInteractionEnabled=YES;
        labelThree.userInteractionEnabled=YES;
        labelFour.userInteractionEnabled=YES;
        UITapGestureRecognizer *tapGestureLabelone =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelOneWithGesture:)];
        [labelOne addGestureRecognizer:tapGestureLabelone];
        UITapGestureRecognizer *tapGestureLabelTwo =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelTwoWithGesture:)];
        [labelTwo addGestureRecognizer:tapGestureLabelTwo];
        UITapGestureRecognizer *tapGestureLabelThree =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelThreeWithGesture:)];
        [labelThree addGestureRecognizer:tapGestureLabelThree];
        UITapGestureRecognizer *tapGestureLabelFour =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelFourWithGesture:)];
        [labelFour addGestureRecognizer:tapGestureLabelFour];
        
    }
    
    //Prepare frame For five Options
    if (number==(NSInteger *)5) {
        labelOne = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, width, frame.size.height)];
        labelOne.textAlignment=UITextAlignmentCenter;
        [labelOne.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerLeft = [CAShapeLayer layer];
        UIBezierPath *maskPathLeft=[UIBezierPath bezierPathWithRoundedRect:labelOne.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerBottomLeft) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        maskLayerLeft.path = maskPathLeft.CGPath;
        labelOne.layer.mask = maskLayerLeft;
        [self addSubview:labelOne];        
        labelTwo = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x+width, frame.origin.y, width, frame.size.height)];
        labelTwo.textAlignment=UITextAlignmentCenter;
        [labelTwo.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        [self addSubview:labelTwo];        
        labelThree = [[UILabel alloc] initWithFrame:CGRectMake(labelTwo.frame.origin.x+width, frame.origin.y, width, frame.size.height)];
        labelThree.textAlignment=UITextAlignmentCenter;
        [labelThree.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        [self addSubview:labelThree];        
        labelFour = [[UILabel alloc] initWithFrame:CGRectMake(labelThree.frame.origin.x+width, frame.origin.y, width, frame.size.height)];
        labelFour.textAlignment=UITextAlignmentCenter;
        [labelFour.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        [self addSubview:labelFour];        
        labelFive = [[UILabel alloc] initWithFrame:CGRectMake(labelFour.frame.origin.x+width, frame.origin.y, width, frame.size.height)];
        labelFive.textAlignment=UITextAlignmentCenter;
        [labelFive.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerRight = [CAShapeLayer layer];
        UIBezierPath *maskPathRight=[UIBezierPath bezierPathWithRoundedRect:labelFive.bounds byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerTopRight) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];        
        maskLayerRight.path = maskPathRight.CGPath;
        labelFive.layer.mask = maskLayerRight;
        [self addSubview:labelFive];        
        labelOne.userInteractionEnabled=YES;
        labelTwo.userInteractionEnabled=YES;
        labelThree.userInteractionEnabled=YES;
        labelFour.userInteractionEnabled=YES;
        labelFive.userInteractionEnabled=YES;
        UITapGestureRecognizer *tapGestureLabelone =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelOneWithGesture:)];
        [labelOne addGestureRecognizer:tapGestureLabelone];
        UITapGestureRecognizer *tapGestureLabelTwo =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelTwoWithGesture:)];
        [labelTwo addGestureRecognizer:tapGestureLabelTwo];
        UITapGestureRecognizer *tapGestureLabelThree =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelThreeWithGesture:)];
        [labelThree addGestureRecognizer:tapGestureLabelThree];
        UITapGestureRecognizer *tapGestureLabelFour =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelFourWithGesture:)];
        [labelFour addGestureRecognizer:tapGestureLabelFour];
        UITapGestureRecognizer *tapGestureLabelFive =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapLabelFiveWithGesture:)];
        [labelFive addGestureRecognizer:tapGestureLabelFive];
        
        
    }
    
    
    //Add Switch button to the frame and place it at first option
    toggleButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[toggleButton setTitle:@"" forState:UIControlStateNormal];    
	// add drag listener
	[toggleButton addTarget:self action:@selector(wasDraggedHorizontal:withEvent:)
           forControlEvents:UIControlEventTouchDragInside];    
    [toggleButton addTarget:self action:@selector(finishedDraggingHorizontal:withEvent:)
           forControlEvents:UIControlEventTouchUpInside];
   	toggleButton.frame = CGRectMake(frame.origin.x, frame.origin.y, width, frame.size.height);
    toggleButton.backgroundColor=[UIColor colorWithRed:0.1 green:0.1 blue:0.0 alpha:0.1];
    [toggleButton.layer setBorderWidth:4.0];
    [toggleButton.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    toggleButton.layer.cornerRadius=cornerRadius;
    [toggleButton setTitleColor:[UIColor colorWithRed:0.3 green:0.1 blue:0.4 alpha:1.0] forState:UIControlStateNormal];
    [self addSubview:toggleButton];
    
    
}

//To set the border width of switch button
-(void)setSwitchBorderWidth:(CGFloat)width
{
   [toggleButton.layer setBorderWidth:width];
}

//To set the text color of options
- (void)setTextColor:(UIColor *)color
{
    labelOne.textColor=color;
    labelTwo.textColor=color;
    labelThree.textColor=color;
    labelFour.textColor=color;
    labelFive.textColor=color;
    
}

//To set the background color of options
- (void)setFrameBackgroundColor:(UIColor *)color
{
    labelOne.backgroundColor=color;
    labelTwo.backgroundColor=color;
    labelThree.backgroundColor=color;
    labelFour.backgroundColor=color;
    labelFive.backgroundColor=color;
    
}

//To set the color of transparent switch button
- (void)setSwitchFrameColor:(UIColor *)color
{
    [toggleButton.layer setBorderColor:[color CGColor]];
    //toggleButton.alpha=0.1;
    //toggleButton.backgroundColor=color;
   
}

//First option is tapped
- (void)didTapLabelOneWithGesture:(UITapGestureRecognizer *)tapGesture {
    [UIView animateWithDuration:0.6
                     animations:^{
                         [toggleButton setFrame:labelOne.frame];
                         
                     }
                     completion:^(BOOL finished) {
                         
                     }
     ];
    [self.delegate slideView:self switchChangedAtIndex:0];
    
}

//Second option is tapped
- (void)didTapLabelTwoWithGesture:(UITapGestureRecognizer *)tapGesture {
    [UIView animateWithDuration:0.6
                     animations:^{
                         [toggleButton setFrame:labelTwo.frame];
                         
                     }
                     completion:^(BOOL finished) {
                         
                     }
     ];
    [self.delegate slideView:self switchChangedAtIndex:1];
    
    
}

//Third option is tapped
- (void)didTapLabelThreeWithGesture:(UITapGestureRecognizer *)tapGesture {
    [UIView animateWithDuration:0.6
                     animations:^{
                         [toggleButton setFrame:labelThree.frame];
                         
                     }
                     completion:^(BOOL finished) {
                         
                     }
     ];
    [self.delegate slideView:self switchChangedAtIndex:2];
    
    
}

//Fourth option is tapped
- (void)didTapLabelFourWithGesture:(UITapGestureRecognizer *)tapGesture {
    [UIView animateWithDuration:0.6
                     animations:^{
                         [toggleButton setFrame:labelFour.frame];
                         
                     }
                     completion:^(BOOL finished) {
                         
                     }
     ];
    [self.delegate slideView:self switchChangedAtIndex:3];
    
    
}

//Fifth option is tapped
- (void)didTapLabelFiveWithGesture:(UITapGestureRecognizer *)tapGesture {
    [UIView animateWithDuration:0.6
                     animations:^{
                         [toggleButton setFrame:labelFive.frame];
                         
                     }
                     completion:^(BOOL finished) {
                         
                     }
     ];
    [self.delegate slideView:self switchChangedAtIndex:4];
    
    
}


//Button has been finshed vertically dragging 
//This method finds out the shortest distance between switch button and the all the options and then animate the button to move to the nearest option.
- (void)finishedDraggingVertical:(UIButton *)button withEvent:(UIEvent *)event
{
       
    float diffone,difftwo,diffthree,difffour,difffive;
    diffone=fabsf(button.frame.origin.y-labelOne.frame.origin.y);
    difftwo=fabsf(labelTwo.frame.origin.y-button.frame.origin.y);
    diffthree=fabsf(labelThree.frame.origin.y-button.frame.origin.y);
    difffour=fabsf(labelFour.frame.origin.y-button.frame.origin.y);
    difffive=fabsf(labelFive.frame.origin.y-button.frame.origin.y);
    
    
    if (numberOflabels==2) {    
        
        
        if (diffone==difftwo) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }

        if(diffone>difftwo)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        else
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 
                                 [button setFrame:labelOne.frame];
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
            
        }
        
        
    }
    
    if (numberOflabels==3) {
        
        
        if (diffone==difftwo) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if (difftwo==diffthree) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        

        if(diffone<difftwo && diffone<diffthree)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(difftwo<diffone && difftwo<diffthree)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(diffthree<diffone && diffthree<difftwo)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelThree.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        
        
        
        
    }
    
    
    if (numberOflabels==4) {
        
        
        if (diffone==difftwo) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if (difftwo==diffthree) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if (diffthree==difffour) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelThree.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }


        if(diffone<difftwo && diffone<diffthree && diffone<difffour)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(difftwo<diffone && difftwo<diffthree && difftwo<difffour)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(diffthree<diffone && diffthree<difftwo && diffthree<difffour)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelThree.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(difffour<diffone && difffour<difftwo && difffour<diffthree)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelFour.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        
        
        
        
        
    }
    
    
    
    if (numberOflabels==5) {
        
        
        
        if (diffone==difftwo) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if (difftwo==diffthree) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if (diffthree==difffour) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelThree.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if (difffour==difffive) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelFour.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }


        if(diffone<difftwo && diffone<diffthree && diffone<difffour && diffone<difffive)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(difftwo<diffone && difftwo<diffthree && difftwo<difffour && difftwo<difffive)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(diffthree<diffone && diffthree<difftwo && diffthree<difffour && diffthree<difffive)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelThree.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(difffour<diffone && difffour<difftwo && difffour<diffthree && difffour<difffive)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelFour.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(difffive<diffone && difffive<difftwo && difffive<diffthree && difffive<difffour)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelFive.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        
        
        
        
        
        
    }   
    
    
    if(button.frame.origin.y==labelOne.frame.origin.y)
    {      
        
        [self.delegate slideView:self switchChangedAtIndex:0];
    
    
       
    }
    else
        if (button.frame.origin.y==labelTwo.frame.origin.y)
        {
            
            [self.delegate slideView:self switchChangedAtIndex:1];
            
            
            
        }
        else
            if (button.frame.origin.y==labelThree.frame.origin.y)
            {
                
                [self.delegate slideView:self switchChangedAtIndex:2];
                               
                
            }
            else
                if (button.frame.origin.y==labelFour.frame.origin.y)
                {
                    
                    [self.delegate slideView:self switchChangedAtIndex:3];
                    
                }
                else
                    if (button.frame.origin.y==labelFive.frame.origin.y)
                    {
                        
                        [self.delegate slideView:self switchChangedAtIndex:0];
                        
                    }
    
    
       
    
}

//Button has been finshed horizontally dragging
//This method finds out the shortest distance between switch button and the all the options and then animate the button to move to the nearest option.
- (void)finishedDraggingHorizontal:(UIButton *)button withEvent:(UIEvent *)event
{
    
    float diffone,difftwo,diffthree,difffour,difffive;
    diffone=fabsf(button.frame.origin.x-labelOne.frame.origin.x);
    difftwo=fabsf(labelTwo.frame.origin.x-button.frame.origin.x);
    diffthree=fabsf(labelThree.frame.origin.x-button.frame.origin.x);
    difffour=fabsf(labelFour.frame.origin.x-button.frame.origin.x);
    difffive=fabsf(labelFive.frame.origin.x-button.frame.origin.x);
    
    
    if (numberOflabels==2) {
        
        
        if (diffone==difftwo) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(diffone>difftwo)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        else
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 
                                 [button setFrame:labelOne.frame];
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
            
        }
        
        
    }
    
    if (numberOflabels==3) {
        
        
            
        if (diffone==difftwo) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];

        }
        
        if (difftwo==diffthree) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }

        
        if(diffone<difftwo && diffone<diffthree)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(difftwo<diffone && difftwo<diffthree)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(diffthree<diffone && diffthree<difftwo)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelThree.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        
        
        
        
    }
    
    
    if (numberOflabels==4) {
        
        if (diffone==difftwo) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if (difftwo==diffthree) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if (diffthree==difffour) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelThree.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }

        if(diffone<difftwo && diffone<diffthree && diffone<difffour)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(difftwo<diffone && difftwo<diffthree && difftwo<difffour)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(diffthree<diffone && diffthree<difftwo && diffthree<difffour)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelThree.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(difffour<diffone && difffour<difftwo && difffour<diffthree)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelFour.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        
        
        
        
        
    }
    
    
    
    if (numberOflabels==5) {
        
        if (diffone==difftwo) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if (difftwo==diffthree) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if (diffthree==difffour) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelThree.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if (difffour==difffive) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelFour.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }


        if(diffone<difftwo && diffone<diffthree && diffone<difffour && diffone<difffive)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(difftwo<diffone && difftwo<diffthree && difftwo<difffour && difftwo<difffive)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(diffthree<diffone && diffthree<difftwo && diffthree<difffour && diffthree<difffive)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelThree.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(difffour<diffone && difffour<difftwo && difffour<diffthree && difffour<difffive)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelFour.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(difffive<diffone && difffive<difftwo && difffive<diffthree && difffive<difffour)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:labelFive.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    if(button.frame.origin.x==labelOne.frame.origin.x)
    {
        [self.delegate slideView:self switchChangedAtIndex:0];
        
    }
    else
        if (button.frame.origin.x==labelTwo.frame.origin.x)
        {
            [self.delegate slideView:self switchChangedAtIndex:1];
           
            
        }
        else
            if (button.frame.origin.x==labelThree.frame.origin.x)
            {
                [self.delegate slideView:self switchChangedAtIndex:2];
               
                
            }
            else
                if (button.frame.origin.x==labelFour.frame.origin.x)
                {
                    [self.delegate slideView:self switchChangedAtIndex:3];
                }
                else
                    if (button.frame.origin.x==labelFive.frame.origin.x)
                    {
                        [self.delegate slideView:self switchChangedAtIndex:4];
                    }
    
    
    
    
}

//butoon is dragging vertically
- (void)wasDraggedVertical:(UIButton *)button withEvent:(UIEvent *)event
{
   
    
    UITouch *touch = [[event touchesForView:button] anyObject];
    
    // get delta
    CGPoint previousLocation = [touch previousLocationInView:button];
    CGPoint location = [touch locationInView:button];
    CGFloat delta_y = location.y - previousLocation.y;
    
    // move button on Y axis
    button.center = CGPointMake(button.center.x ,
                                button.center.y +delta_y);
    
    
    if (numberOflabels==2) {
        if (button.frame.origin.y>labelTwo.frame.origin.y) {
            [button setFrame:labelTwo.frame];
        }
        if (button.frame.origin.y<labelOne.frame.origin.y) {
            [button setFrame:labelOne.frame];
        }
    }
    
    if (numberOflabels==3) {
        if (button.frame.origin.y>labelThree.frame.origin.y) {
            [button setFrame:labelThree.frame];
        }
        if (button.frame.origin.y<labelOne.frame.origin.y) {
            [button setFrame:labelOne.frame];
        }
    }
    if (numberOflabels==4) {
        if (button.frame.origin.y>labelFour.frame.origin.y) {
            [button setFrame:labelFour.frame];
        }
        if (button.frame.origin.y<labelOne.frame.origin.y) {
            [button setFrame:labelOne.frame];
        }
    }
    if (numberOflabels==5) {
        if (button.frame.origin.y>labelFive.frame.origin.y) {
            [button setFrame:labelFive.frame];
        }
        if (button.frame.origin.y<labelOne.frame.origin.y) {
            [button setFrame:labelOne.frame];
        }
    }
    
    if(button.frame.origin.y==labelOne.frame.origin.y)
    {
                
        [self.delegate slideView:self switchChangedAtIndex:0];
        
        
      
    }
    else
        if (button.frame.origin.y==labelTwo.frame.origin.y)
        {
            
            [self.delegate slideView:self switchChangedAtIndex:1];
            
            
            
        }
        else
            if (button.frame.origin.y==labelThree.frame.origin.y)
            {
               
                 [self.delegate slideView:self switchChangedAtIndex:2];
                
            }
            else
                if (button.frame.origin.y==labelFour.frame.origin.y)
                {
                    
                    [self.delegate slideView:self switchChangedAtIndex:3];
                   
                }
                else
                    if (button.frame.origin.y==labelFive.frame.origin.y)
                    {
                       
                        [self.delegate slideView:self switchChangedAtIndex:4];
                       
                    }

    
    
    
    
}

//butoon is dragging horizontally

- (void)wasDraggedHorizontal:(UIButton *)button withEvent:(UIEvent *)event
{
    
    
    
    
    UITouch *touch = [[event touchesForView:button] anyObject];
    
    // get delta
    CGPoint previousLocation = [touch previousLocationInView:button];
    CGPoint location = [touch locationInView:button];
    CGFloat delta_x = location.x - previousLocation.x;
    
    // move button at x axis
    button.center = CGPointMake(button.center.x + delta_x,
                                button.center.y );
    
    
    if (numberOflabels==2) {
        if (button.frame.origin.x>labelTwo.frame.origin.x) {
            [button setFrame:labelTwo.frame];
        }
        if (button.frame.origin.x<labelOne.frame.origin.x) {
            [button setFrame:labelOne.frame];
        }
    }
    
    if (numberOflabels==3) {
        if (button.frame.origin.x>labelThree.frame.origin.x) {
            [button setFrame:labelThree.frame];
        }
        if (button.frame.origin.x<labelOne.frame.origin.x) {
            [button setFrame:labelOne.frame];
        }
    }
    if (numberOflabels==4) {
        if (button.frame.origin.x>labelFour.frame.origin.x) {
            [button setFrame:labelFour.frame];
        }
        if (button.frame.origin.x<labelOne.frame.origin.x) {
            [button setFrame:labelOne.frame];
        }
    }
    if (numberOflabels==5) {
        if (button.frame.origin.x>labelFive.frame.origin.x) {
            [button setFrame:labelFive.frame];
        }
        if (button.frame.origin.x<labelOne.frame.origin.x) {
            [button setFrame:labelOne.frame];
        }
    }
    
    
    
    
    
    if(button.frame.origin.x==labelOne.frame.origin.x)
    {
        
        
        [self.delegate slideView:self switchChangedAtIndex:0];
        
        
       
    }
    else
        if (button.frame.origin.x==labelTwo.frame.origin.x)
        {
           
            [self.delegate slideView:self switchChangedAtIndex:1];
           
            
            
        }
        else
            if (button.frame.origin.x==labelThree.frame.origin.x)
            {
               
                [self.delegate slideView:self switchChangedAtIndex:2];
                
                
                
            }
            else
                if (button.frame.origin.x==labelFour.frame.origin.x)
                {
                   
                    [self.delegate slideView:self switchChangedAtIndex:3];
                    
                }
                else
                    if (button.frame.origin.x==labelFive.frame.origin.x)
                    {
                      
                        [self.delegate slideView:self switchChangedAtIndex:4];
                        
                    }

    
    
    
    
    
    
    
    
}

//set Text for options label
- (void)setText:(NSString *)text forTextIndex:(NSInteger *)number
{
    int labelnumber=number;
    
    if(labelnumber==1)
    {
        labelOne.text=text;
        //call delegate method by passing labelone so that by default label one eill be selected
        //[self.delegate selectedOption:self withOption:labelOne withIndex:1];
        [self.delegate slideView:self switchChangedAtIndex:0];
        
    }
    if(labelnumber==2)
    {
        labelTwo.text=text;
    }
    if(labelnumber==3)
    {
        labelThree.text=text;
    }
    if(labelnumber==4)
    {
        labelFour.text=text;
    }
    if(labelnumber==5)
    {
        labelFive.text=text;
    }
    
    
    
}





@end
