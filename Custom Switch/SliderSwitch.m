//
//  SliderSwitch.m
//  Slider Switch Demo
//  Created by Torry Harris on 21/01/13.
//  Copyright (c) 2014 Torry Harris's Mac . All rights reserved.
//  Modified by Torry Harris on 6th March, 2014.
//

#import "SliderSwitch.h"

@implementation SliderSwitch

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _selectedIndex = 0;
        _selectedFont = [UIFont boldSystemFontOfSize:18];
        _selectedColor = [UIColor whiteColor];
        _unSelectedFont = [UIFont systemFontOfSize:14];
        _unSelectedColor = [UIColor blackColor];
        
        _labelOne = [[UILabel alloc] init];
        _labelTwo = [[UILabel alloc] init];
        _labelThree = [[UILabel alloc] init];
        _labelFour = [[UILabel alloc] init];
        _labelFive = [[UILabel alloc] init];
    }
    return self;
}

-(id)init{
    self = [super init];
    if (self) {
        // Initialization code
        _selectedIndex = 0;
        _selectedFont = [UIFont boldSystemFontOfSize:18];
        _selectedColor = [UIColor whiteColor];
        _unSelectedFont = [UIFont systemFontOfSize:14];
        _unSelectedColor = [UIColor blackColor];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        _selectedIndex = 0;
        _selectedFont = [UIFont boldSystemFontOfSize:18];
        _selectedColor = [UIColor whiteColor];
        _unSelectedFont = [UIFont systemFontOfSize:14];
        _unSelectedColor = [UIColor blackColor];
    }
    return self;
}

-(void)changeSelectedLayer{
    
    if (_selectedIndex == 0) {
        _labelOne.textColor = _selectedColor;
        _labelOne.font = _selectedFont;
        _labelTwo.textColor = _unSelectedColor;
        _labelTwo.font = _unSelectedFont;
        
        if (_labelThree) {
            _labelThree.textColor = _unSelectedColor;
            _labelThree.font = _unSelectedFont;
        }
        if (_labelFour) {
            _labelFour.textColor = _unSelectedColor;
            _labelFour.font = _unSelectedFont;
        }
        if (_labelFive) {
            _labelFive.textColor = _unSelectedColor;
            _labelFive.font = _unSelectedFont;
        }
        
    } else if(_selectedIndex == 1) {
        _labelOne.textColor = _unSelectedColor;
        _labelOne.font = _unSelectedFont;
        _labelTwo.textColor = _selectedColor;
        _labelTwo.font = _selectedFont;
        
        if (_labelThree) {
            _labelThree.textColor = _unSelectedColor;
            _labelThree.font = _unSelectedFont;
        }
        if (_labelFour) {
            _labelFour.textColor = _unSelectedColor;
            _labelFour.font = _unSelectedFont;
        }
        if (_labelFive) {
            _labelFive.textColor = _unSelectedColor;
            _labelFive.font = _unSelectedFont;
        }
        
    } else if(_selectedIndex == 2) {
        _labelOne.textColor = _unSelectedColor;
        _labelOne.font = _unSelectedFont;
        _labelTwo.textColor = _unSelectedColor;
        _labelTwo.font = _unSelectedFont;
        _labelThree.textColor = _selectedColor;
        _labelThree.font = _selectedFont;
        
        if (_labelFour) {
            _labelFour.textColor = _unSelectedColor;
            _labelFour.font = _unSelectedFont;
        }
        if (_labelFive) {
            _labelFive.textColor = _unSelectedColor;
            _labelFive.font = _unSelectedFont;
        }
    } else if(_selectedIndex == 3) {
        _labelOne.textColor = _unSelectedColor;
        _labelOne.font = _unSelectedFont;
        _labelTwo.textColor = _unSelectedColor;
        _labelTwo.font = _unSelectedFont;
        _labelThree.textColor = _unSelectedColor;
        _labelThree.font = _unSelectedFont;
        _labelFour.textColor = _selectedColor;
        _labelFour.font = _selectedFont;
        
        if (_labelFive) {
            _labelFive.textColor = _unSelectedColor;
            _labelFive.font = _unSelectedFont;
        }
    } else {
        _labelOne.textColor = _unSelectedColor;
        _labelOne.font = _unSelectedFont;
        _labelTwo.textColor = _unSelectedColor;
        _labelTwo.font = _unSelectedFont;
        _labelThree.textColor = _unSelectedColor;
        _labelThree.font = _unSelectedFont;
        _labelFour.textColor = _unSelectedColor;
        _labelFour.font = _unSelectedFont;
        _labelFive.textColor = _selectedColor;
        _labelFive.font = _selectedFont;
    }
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
- (void)setFrameVertical:(CGRect)frame numberOfFields:(NSUInteger)number withCornerRadius:(CGFloat)cornerRadius
{
    _selectedIndex = 0;
    //divide frame height by numberOfFields to decide height of each option
    long double height;
    int n=number;
    _numberOflabels=n;
    long double f=(long double)frame.size.height;
    height=f/n;        
    
    //Prepare frame For two Options
    if (number==2) {
        _labelOne.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width,height);
        _labelOne.textAlignment=NSTextAlignmentCenter;
        [_labelOne.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerLeft = [CAShapeLayer layer];
        UIBezierPath *maskPathLeft=[UIBezierPath bezierPathWithRoundedRect:_labelOne.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        maskLayerLeft.path = maskPathLeft.CGPath;
        _labelOne.layer.mask = maskLayerLeft;
        [self addSubview:_labelOne];
        
        _labelTwo.frame = CGRectMake(frame.origin.x, frame.origin.y+height, frame.size.width, height);
        _labelTwo.textAlignment=NSTextAlignmentCenter;
        CAShapeLayer *maskLayerRight = [CAShapeLayer layer];
        UIBezierPath *maskPathRight=[UIBezierPath bezierPathWithRoundedRect:_labelTwo.bounds byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerBottomLeft) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        
        maskLayerRight.path = maskPathRight.CGPath;
        _labelTwo.layer.mask = maskLayerRight;
        [self addSubview:_labelTwo];
        
        _labelOne.userInteractionEnabled=YES;
        _labelTwo.userInteractionEnabled=YES;
        UITapGestureRecognizer *tapGestureLabelone =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelOne addGestureRecognizer:tapGestureLabelone];
        UITapGestureRecognizer *tapGestureLabelTwo =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelTwo addGestureRecognizer:tapGestureLabelTwo];
    }
    
    //Prepare frame For Three Options
    
    if (number==3) {
        
        _labelOne.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, height);
        _labelOne.textAlignment=NSTextAlignmentCenter;
        [_labelOne.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerLeft = [CAShapeLayer layer];
        UIBezierPath *maskPathLeft=[UIBezierPath bezierPathWithRoundedRect:_labelOne.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        maskLayerLeft.path = maskPathLeft.CGPath;
        _labelOne.layer.mask = maskLayerLeft;
        [self addSubview:_labelOne];
        
        _labelTwo.frame = CGRectMake(frame.origin.x, frame.origin.y+height, frame.size.width, height);
        _labelTwo.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_labelTwo];
        
        _labelThree.frame = CGRectMake(_labelTwo.frame.origin.x, _labelTwo.frame.origin.y+height, frame.size.width, height);
        _labelThree.textAlignment=NSTextAlignmentCenter;
        [_labelThree.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerRight = [CAShapeLayer layer];
        UIBezierPath *maskPathRight=[UIBezierPath bezierPathWithRoundedRect:_labelThree.bounds byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerBottomLeft) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        
        maskLayerRight.path = maskPathRight.CGPath;
        _labelThree.layer.mask = maskLayerRight;
        [self addSubview:_labelThree];
        
        _labelOne.userInteractionEnabled=YES;
        _labelTwo.userInteractionEnabled=YES;
        _labelThree.userInteractionEnabled=YES;
        UITapGestureRecognizer *tapGestureLabelone =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelOne addGestureRecognizer:tapGestureLabelone];
        UITapGestureRecognizer *tapGestureLabelTwo =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelTwo addGestureRecognizer:tapGestureLabelTwo];
        UITapGestureRecognizer *tapGestureLabelThree =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelThree addGestureRecognizer:tapGestureLabelThree];       
                
    }
    
    //Prepare frame For Four Options  
    
    if (number==4) {
        
        _labelOne.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, height);
        _labelOne.textAlignment=NSTextAlignmentCenter;
        [_labelOne.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerLeft = [CAShapeLayer layer];
        UIBezierPath *maskPathLeft=[UIBezierPath bezierPathWithRoundedRect:_labelOne.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        maskLayerLeft.path = maskPathLeft.CGPath;
        _labelOne.layer.mask = maskLayerLeft;
        [self addSubview:_labelOne];
        _labelTwo.frame = CGRectMake(frame.origin.x, frame.origin.y+height, frame.size.width, height);
        _labelTwo.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_labelTwo];
        _labelThree.frame = CGRectMake(_labelTwo.frame.origin.x, _labelTwo.frame.origin.y+height, frame.size.width, height);
        _labelThree.textAlignment=NSTextAlignmentCenter;
        [_labelThree.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        [self addSubview:_labelThree];
        _labelFour.frame = CGRectMake(_labelThree.frame.origin.x, _labelThree.frame.origin.y+height, frame.size.width, height);
        _labelFour.textAlignment=NSTextAlignmentCenter;
        [_labelFour.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerRight = [CAShapeLayer layer];
        UIBezierPath *maskPathRight=[UIBezierPath bezierPathWithRoundedRect:_labelFour.bounds byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerBottomLeft) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        
        maskLayerRight.path = maskPathRight.CGPath;
        _labelFour.layer.mask = maskLayerRight;
        [self addSubview:_labelFour];
        _labelOne.userInteractionEnabled=YES;
        _labelTwo.userInteractionEnabled=YES;
        _labelThree.userInteractionEnabled=YES;
        _labelFour.userInteractionEnabled=YES;
        UITapGestureRecognizer *tapGestureLabelone =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelOne addGestureRecognizer:tapGestureLabelone];
        UITapGestureRecognizer *tapGestureLabelTwo =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelTwo addGestureRecognizer:tapGestureLabelTwo];
        UITapGestureRecognizer *tapGestureLabelThree =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelThree addGestureRecognizer:tapGestureLabelThree];
        UITapGestureRecognizer *tapGestureLabelFour =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelFour addGestureRecognizer:tapGestureLabelFour];
    }
    
    //Prepare frame For Five Options
    if (number==5) {
        
        _labelOne.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, height);
        _labelOne.textAlignment=NSTextAlignmentCenter;
        [_labelOne.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerLeft = [CAShapeLayer layer];
        UIBezierPath *maskPathLeft=[UIBezierPath bezierPathWithRoundedRect:_labelOne.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        maskLayerLeft.path = maskPathLeft.CGPath;
        _labelOne.layer.mask = maskLayerLeft;
        [self addSubview:_labelOne];
        _labelTwo.frame = CGRectMake(frame.origin.x, frame.origin.y+height, frame.size.width, height);
        _labelTwo.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_labelTwo];
        _labelThree.frame = CGRectMake(_labelTwo.frame.origin.x, _labelTwo.frame.origin.y+height, frame.size.width, height);
        _labelThree.textAlignment=NSTextAlignmentCenter;
        [_labelThree.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        [self addSubview:_labelThree];
        
        _labelFour.frame = CGRectMake(_labelThree.frame.origin.x, _labelThree.frame.origin.y+height, frame.size.width, height);
        _labelFour.textAlignment=NSTextAlignmentCenter;
        [_labelFour.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        [self addSubview:_labelFour];
        _labelFive.frame = CGRectMake(_labelFour.frame.origin.x, _labelFour.frame.origin.y+height, frame.size.width, height);
        _labelFive.textAlignment=NSTextAlignmentCenter;
        [_labelFive.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerRight = [CAShapeLayer layer];
        UIBezierPath *maskPathRight=[UIBezierPath bezierPathWithRoundedRect:_labelFive.bounds byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerBottomLeft) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        maskLayerRight.path = maskPathRight.CGPath;
        _labelFive.layer.mask = maskLayerRight;
        [self addSubview:_labelFive];
        _labelOne.userInteractionEnabled=YES;
        _labelTwo.userInteractionEnabled=YES;
        _labelThree.userInteractionEnabled=YES;
        _labelFour.userInteractionEnabled=YES;
        _labelFive.userInteractionEnabled=YES;
        UITapGestureRecognizer *tapGestureLabelone =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelOne addGestureRecognizer:tapGestureLabelone];
        UITapGestureRecognizer *tapGestureLabelTwo =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelTwo addGestureRecognizer:tapGestureLabelTwo];
        UITapGestureRecognizer *tapGestureLabelThree =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelThree addGestureRecognizer:tapGestureLabelThree];
        UITapGestureRecognizer *tapGestureLabelFour =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelFour addGestureRecognizer:tapGestureLabelFour];
        UITapGestureRecognizer *tapGestureLabelFive =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelFive addGestureRecognizer:tapGestureLabelFive];
        
    }
    
    //Add Switch button to the frame and place it at first option    
    _toggleButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[_toggleButton setTitle:@"" forState:UIControlStateNormal];
	// add drag listener
	[_toggleButton addTarget:self action:@selector(wasDraggedVertical:withEvent:)
           forControlEvents:UIControlEventTouchDragInside];    
    [_toggleButton addTarget:self action:@selector(finishedDraggingVertical:withEvent:)
           forControlEvents:UIControlEventTouchUpInside];    
	_toggleButton.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, height);
    _toggleButton.backgroundColor=[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    [_toggleButton.layer setBorderWidth:4.0];
    [_toggleButton.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    _toggleButton.layer.cornerRadius=cornerRadius;
   	[self addSubview:_toggleButton];
        
    
}



//create a horizontal slider switch where frame passed is the frame for switch,numberOfFields is the number of available option
- (void)setFrameHorizontal:(CGRect)frame numberOfFields:(NSUInteger)number withCornerRadius:(CGFloat)cornerRadius
{
    //divide frame width by numberOfFields to decide width of each option
    _selectedIndex = 0;
    float width;
    int n=number;
    _numberOflabels=n;
    float f=(float)frame.size.width;    
    width=f/n;    
    
    //Prepare frame For two Options
    if (number==2) {
        _labelOne.frame = CGRectMake(frame.origin.x, frame.origin.y, width, frame.size.height);
        _labelOne.textAlignment=NSTextAlignmentCenter;
        [_labelOne.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerLeft = [CAShapeLayer layer];
        UIBezierPath *maskPathLeft=[UIBezierPath bezierPathWithRoundedRect:_labelOne.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerBottomLeft) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        maskLayerLeft.path = maskPathLeft.CGPath;
        _labelOne.layer.mask = maskLayerLeft;
        [self addSubview:_labelOne];
        _labelTwo.frame = CGRectMake(frame.origin.x+width, frame.origin.y, width, frame.size.height);
        _labelTwo.textAlignment=NSTextAlignmentCenter;
        CAShapeLayer *maskLayerRight = [CAShapeLayer layer];
        UIBezierPath *maskPathRight=[UIBezierPath bezierPathWithRoundedRect:_labelTwo.bounds byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerTopRight) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        maskLayerRight.path = maskPathRight.CGPath;
        _labelTwo.layer.mask = maskLayerRight;
        [self addSubview:_labelTwo];
        _labelOne.userInteractionEnabled=YES;
        _labelTwo.userInteractionEnabled=YES;
        UITapGestureRecognizer *tapGestureLabelone =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelOne addGestureRecognizer:tapGestureLabelone];
        UITapGestureRecognizer *tapGestureLabelTwo =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelTwo addGestureRecognizer:tapGestureLabelTwo];
    }
    
    //Prepare frame For three Options    
    if (number==3) {
        
        _labelOne.frame = CGRectMake(frame.origin.x, frame.origin.y, width, frame.size.height);
        _labelOne.textAlignment=NSTextAlignmentCenter;
        [_labelOne.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerLeft = [CAShapeLayer layer];
        UIBezierPath *maskPathLeft=[UIBezierPath bezierPathWithRoundedRect:_labelOne.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerBottomLeft) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        maskLayerLeft.path = maskPathLeft.CGPath;
        _labelOne.layer.mask = maskLayerLeft;
        [self addSubview:_labelOne];
        _labelTwo.frame = CGRectMake(frame.origin.x+width, frame.origin.y, width, frame.size.height);
        _labelTwo.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_labelTwo];
        _labelThree.frame = CGRectMake(_labelTwo.frame.origin.x+width, frame.origin.y, width, frame.size.height);
        _labelThree.textAlignment=NSTextAlignmentCenter;
        [_labelThree.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerRight = [CAShapeLayer layer];
        UIBezierPath *maskPathRight=[UIBezierPath bezierPathWithRoundedRect:_labelThree.bounds byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerTopRight) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        maskLayerRight.path = maskPathRight.CGPath;
        _labelThree.layer.mask = maskLayerRight;
        [self addSubview:_labelThree];
        _labelOne.userInteractionEnabled=YES;
        _labelTwo.userInteractionEnabled=YES;
        _labelThree.userInteractionEnabled=YES;
        UITapGestureRecognizer *tapGestureLabelone =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelOne addGestureRecognizer:tapGestureLabelone];
        UITapGestureRecognizer *tapGestureLabelTwo =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelTwo addGestureRecognizer:tapGestureLabelTwo];
        UITapGestureRecognizer *tapGestureLabelThree =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelThree addGestureRecognizer:tapGestureLabelThree];
    }
    
    //Prepare frame For four Options    
    if (number==4) {
        _labelOne.frame = CGRectMake(frame.origin.x, frame.origin.y, width, frame.size.height);
        _labelOne.textAlignment=NSTextAlignmentCenter;
        [_labelOne.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerLeft = [CAShapeLayer layer];
        UIBezierPath *maskPathLeft=[UIBezierPath bezierPathWithRoundedRect:_labelOne.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerBottomLeft) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        maskLayerLeft.path = maskPathLeft.CGPath;
        _labelOne.layer.mask = maskLayerLeft;
        [self addSubview:_labelOne];
        _labelTwo.frame = CGRectMake(frame.origin.x+width, frame.origin.y, width, frame.size.height);
        _labelTwo.textAlignment=NSTextAlignmentCenter;
        [_labelTwo.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        [self addSubview:_labelTwo];
        _labelThree.frame = CGRectMake(_labelTwo.frame.origin.x+width, frame.origin.y, width, frame.size.height);
        _labelThree.textAlignment=NSTextAlignmentCenter;
        [_labelThree.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        [self addSubview:_labelThree];
        _labelFour.frame = CGRectMake(_labelThree.frame.origin.x+width, frame.origin.y, width, frame.size.height);
        _labelFour.textAlignment=NSTextAlignmentCenter;
        [_labelFour.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerRight = [CAShapeLayer layer];
        UIBezierPath *maskPathRight=[UIBezierPath bezierPathWithRoundedRect:_labelFour.bounds byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerTopRight) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        maskLayerRight.path = maskPathRight.CGPath;
        _labelFour.layer.mask = maskLayerRight;
        [self addSubview:_labelFour];
        _labelOne.userInteractionEnabled=YES;
        _labelTwo.userInteractionEnabled=YES;
        _labelThree.userInteractionEnabled=YES;
        _labelFour.userInteractionEnabled=YES;
        UITapGestureRecognizer *tapGestureLabelone =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelOne addGestureRecognizer:tapGestureLabelone];
        UITapGestureRecognizer *tapGestureLabelTwo =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelTwo addGestureRecognizer:tapGestureLabelTwo];
        UITapGestureRecognizer *tapGestureLabelThree =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelThree addGestureRecognizer:tapGestureLabelThree];
        UITapGestureRecognizer *tapGestureLabelFour =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelFour addGestureRecognizer:tapGestureLabelFour];
        
    }
    
    //Prepare frame For five Options
    if (number==5) {
        _labelOne.frame = CGRectMake(frame.origin.x, frame.origin.y, width, frame.size.height);
        _labelOne.textAlignment=NSTextAlignmentCenter;
        [_labelOne.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerLeft = [CAShapeLayer layer];
        UIBezierPath *maskPathLeft=[UIBezierPath bezierPathWithRoundedRect:_labelOne.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerBottomLeft) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        maskLayerLeft.path = maskPathLeft.CGPath;
        _labelOne.layer.mask = maskLayerLeft;
        [self addSubview:_labelOne];
        _labelTwo.frame = CGRectMake(frame.origin.x+width, frame.origin.y, width, frame.size.height);
        _labelTwo.textAlignment=NSTextAlignmentCenter;
        [_labelTwo.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        [self addSubview:_labelTwo];
        _labelThree.frame = CGRectMake(_labelTwo.frame.origin.x+width, frame.origin.y, width, frame.size.height);
        _labelThree.textAlignment=NSTextAlignmentCenter;
        [_labelThree.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        [self addSubview:_labelThree];
        _labelFour.frame = CGRectMake(_labelThree.frame.origin.x+width, frame.origin.y, width, frame.size.height);
        _labelFour.textAlignment=NSTextAlignmentCenter;
        [_labelFour.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        [self addSubview:_labelFour];
        _labelFive.frame = CGRectMake(_labelFour.frame.origin.x+width, frame.origin.y, width, frame.size.height);
        _labelFive.textAlignment=NSTextAlignmentCenter;
        [_labelFive.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
        CAShapeLayer *maskLayerRight = [CAShapeLayer layer];
        UIBezierPath *maskPathRight=[UIBezierPath bezierPathWithRoundedRect:_labelFive.bounds byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerTopRight) cornerRadii:CGSizeMake(cornerRadius,cornerRadius)];
        maskLayerRight.path = maskPathRight.CGPath;
        _labelFive.layer.mask = maskLayerRight;
        [self addSubview:_labelFive];
        _labelOne.userInteractionEnabled=YES;
        _labelTwo.userInteractionEnabled=YES;
        _labelThree.userInteractionEnabled=YES;
        _labelFour.userInteractionEnabled=YES;
        _labelFive.userInteractionEnabled=YES;
        UITapGestureRecognizer *tapGestureLabelone =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelOne addGestureRecognizer:tapGestureLabelone];
        UITapGestureRecognizer *tapGestureLabelTwo =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelTwo addGestureRecognizer:tapGestureLabelTwo];
        UITapGestureRecognizer *tapGestureLabelThree =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelThree addGestureRecognizer:tapGestureLabelThree];
        UITapGestureRecognizer *tapGestureLabelFour =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelFour addGestureRecognizer:tapGestureLabelFour];
        UITapGestureRecognizer *tapGestureLabelFive =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapGesture:)];
        [_labelFive addGestureRecognizer:tapGestureLabelFive];
        
        
    }
    
    
    //Add Switch button to the frame and place it at first option
    _toggleButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[_toggleButton setTitle:@"" forState:UIControlStateNormal];
	// add drag listener
	[_toggleButton addTarget:self action:@selector(wasDraggedHorizontal:withEvent:)
           forControlEvents:UIControlEventTouchDragInside];    
    [_toggleButton addTarget:self action:@selector(finishedDraggingHorizontal:withEvent:)
           forControlEvents:UIControlEventTouchUpInside];
   	_toggleButton.frame = CGRectMake(frame.origin.x, frame.origin.y, width, frame.size.height);
    _toggleButton.backgroundColor=[UIColor colorWithRed:0.1 green:0.1 blue:0.0 alpha:0.1];
    [_toggleButton.layer setBorderWidth:4.0];
    [_toggleButton.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    _toggleButton.layer.cornerRadius=cornerRadius;
    [_toggleButton setTitleColor:[UIColor colorWithRed:0.3 green:0.1 blue:0.4 alpha:1.0] forState:UIControlStateNormal];
    [self addSubview:_toggleButton];
    
    
}

//To set the border width of switch button
-(void)setSwitchBorderWidth:(CGFloat)width
{
   [_toggleButton.layer setBorderWidth:width];
}

//To set the background color of options
- (void)setFrameBackgroundColor:(UIColor *)color
{
    _labelOne.backgroundColor=color;
    _labelTwo.backgroundColor=color;
    _labelThree.backgroundColor=color;
    _labelFour.backgroundColor=color;
    _labelFive.backgroundColor=color;
    
}

//To set the color of transparent switch button
- (void)setSwitchFrameColor:(UIColor *)color
{
    [_toggleButton.layer setBorderColor:[color CGColor]];
}

//First option is tapped

- (void)didTapGesture:(UITapGestureRecognizer *)tapGesture {
    
    [UIView animateWithDuration:0.6
                     animations:^{
                         [_toggleButton setFrame:tapGesture.view.frame];
                     }
                     completion:^(BOOL finished){
                     }
     ];
    
    if([tapGesture.view isEqual:_labelOne]){
        _selectedIndex = 0;
    } else if ([tapGesture.view isEqual:_labelTwo]) {
        _selectedIndex = 1;
    } else if ([tapGesture.view isEqual:_labelThree]) {
        _selectedIndex = 2;
    } else if ([tapGesture.view isEqual:_labelFour]) {
        _selectedIndex = 3;
    } else {
        _selectedIndex = 4;
    }
    [self changeSelectedLayer];
    [_delegate switchChangedSliderSwitch:self];
}


//Button has been finshed vertically dragging 
//This method finds out the shortest distance between switch button and the all the options and then animate the button to move to the nearest option.
- (void)finishedDraggingVertical:(UIButton *)button withEvent:(UIEvent *)event
{
       
    float diffone,difftwo,diffthree,difffour,difffive;
    diffone=fabsf(button.frame.origin.y-_labelOne.frame.origin.y);
    difftwo=fabsf(_labelTwo.frame.origin.y-button.frame.origin.y);
    diffthree=fabsf(_labelThree.frame.origin.y-button.frame.origin.y);
    difffour=fabsf(_labelFour.frame.origin.y-button.frame.origin.y);
    difffive=fabsf(_labelFive.frame.origin.y-button.frame.origin.y);
    
    
    if (_numberOflabels==2) {
        
        
        if (diffone==difftwo) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }

        if(diffone>difftwo)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        else
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 
                                 [button setFrame:_labelOne.frame];
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
            
        }
        
        
    }
    
    if (_numberOflabels==3) {
        
        
        if (diffone==difftwo) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if (difftwo==diffthree) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        

        if(diffone<difftwo && diffone<diffthree)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(difftwo<diffone && difftwo<diffthree)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(diffthree<diffone && diffthree<difftwo)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelThree.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        
        
        
        
    }
    
    
    if (_numberOflabels==4) {
        
        
        if (diffone==difftwo) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if (difftwo==diffthree) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if (diffthree==difffour) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelThree.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }


        if(diffone<difftwo && diffone<diffthree && diffone<difffour)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(difftwo<diffone && difftwo<diffthree && difftwo<difffour)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(diffthree<diffone && diffthree<difftwo && diffthree<difffour)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelThree.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(difffour<diffone && difffour<difftwo && difffour<diffthree)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelFour.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        
        
        
        
        
    }
    
    
    
    if (_numberOflabels==5) {
        
        
        
        if (diffone==difftwo) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if (difftwo==diffthree) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if (diffthree==difffour) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelThree.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if (difffour==difffive) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelFour.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }


        if(diffone<difftwo && diffone<diffthree && diffone<difffour && diffone<difffive)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(difftwo<diffone && difftwo<diffthree && difftwo<difffour && difftwo<difffive)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(diffthree<diffone && diffthree<difftwo && diffthree<difffour && diffthree<difffive)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelThree.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(difffour<diffone && difffour<difftwo && difffour<diffthree && difffour<difffive)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelFour.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(difffive<diffone && difffive<difftwo && difffive<diffthree && difffive<difffour)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelFive.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        
        
        
        
        
        
    }   
    
    
    if(button.frame.origin.y==_labelOne.frame.origin.y)
    {
        _selectedIndex = 0;
    } else if (button.frame.origin.y==_labelTwo.frame.origin.y)
    {
        _selectedIndex = 1;
    } else if (button.frame.origin.y==_labelThree.frame.origin.y)
    {
        _selectedIndex = 2;
    } else if (button.frame.origin.y==_labelFour.frame.origin.y)
    {
        _selectedIndex = 3;
    } else if (button.frame.origin.y==_labelFive.frame.origin.y)
    {
        _selectedIndex = 4;
    }
    [self changeSelectedLayer];
    [self.delegate switchChangedSliderSwitch:self];
}

//Button has been finshed horizontally dragging
//This method finds out the shortest distance between switch button and the all the options and then animate the button to move to the nearest option.
- (void)finishedDraggingHorizontal:(UIButton *)button withEvent:(UIEvent *)event
{
    
    float diffone,difftwo,diffthree,difffour,difffive;
    diffone=fabsf(button.frame.origin.x-_labelOne.frame.origin.x);
    difftwo=fabsf(_labelTwo.frame.origin.x-button.frame.origin.x);
    diffthree=fabsf(_labelThree.frame.origin.x-button.frame.origin.x);
    difffour=fabsf(_labelFour.frame.origin.x-button.frame.origin.x);
    difffive=fabsf(_labelFive.frame.origin.x-button.frame.origin.x);
    
    
    if (_numberOflabels==2) {
        
        
        if (diffone==difftwo) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(diffone>difftwo)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        else
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 
                                 [button setFrame:_labelOne.frame];
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
            
        }
        
        
    }
    
    if (_numberOflabels==3) {
        
        
            
        if (diffone==difftwo) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];

        }
        
        if (difftwo==diffthree) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }

        
        if(diffone<difftwo && diffone<diffthree)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(difftwo<diffone && difftwo<diffthree)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(diffthree<diffone && diffthree<difftwo)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelThree.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        
        
        
        
    }
    
    
    if (_numberOflabels==4) {
        
        if (diffone==difftwo) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if (difftwo==diffthree) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if (diffthree==difffour) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelThree.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }

        if(diffone<difftwo && diffone<diffthree && diffone<difffour)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(difftwo<diffone && difftwo<diffthree && difftwo<difffour)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(diffthree<diffone && diffthree<difftwo && diffthree<difffour)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelThree.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(difffour<diffone && difffour<difftwo && difffour<diffthree)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelFour.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
    }
    
    
    
    if (_numberOflabels==5) {
        
        if (diffone==difftwo) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if (difftwo==diffthree) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if (diffthree==difffour) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelThree.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if (difffour==difffive) {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelFour.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }


        if(diffone<difftwo && diffone<diffthree && diffone<difffour && diffone<difffive)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelOne.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(difftwo<diffone && difftwo<diffthree && difftwo<difffour && difftwo<difffive)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelTwo.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(diffthree<diffone && diffthree<difftwo && diffthree<difffour && diffthree<difffive)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelThree.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(difffour<diffone && difffour<difftwo && difffour<diffthree && difffour<difffive)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelFour.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
        
        if(difffive<diffone && difffive<difftwo && difffive<diffthree && difffive<difffour)
        {
            [UIView animateWithDuration:0.6
                             animations:^{
                                 [button setFrame:_labelFive.frame];
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                             }
             ];
            
        }
    }
    
    if(button.frame.origin.x==_labelOne.frame.origin.x)
    {
        _selectedIndex = 0;
    } else if (button.frame.origin.x==_labelTwo.frame.origin.x)
    {
        _selectedIndex = 1;
    } else if (button.frame.origin.x==_labelThree.frame.origin.x)
    {
        _selectedIndex = 2;
    } else if (button.frame.origin.x==_labelFour.frame.origin.x)
    {
        _selectedIndex = 3;
    } else if (button.frame.origin.x==_labelFive.frame.origin.x)
    {
        _selectedIndex = 4;
    }
    [self changeSelectedLayer];
    [_delegate switchChangedSliderSwitch:self];
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
    
    
    if (_numberOflabels==2) {
        if (button.frame.origin.y>_labelTwo.frame.origin.y) {
            [button setFrame:_labelTwo.frame];
        }
        if (button.frame.origin.y<_labelOne.frame.origin.y) {
            [button setFrame:_labelOne.frame];
        }
    }
    
    if (_numberOflabels==3) {
        if (button.frame.origin.y>_labelThree.frame.origin.y) {
            [button setFrame:_labelThree.frame];
        }
        if (button.frame.origin.y<_labelOne.frame.origin.y) {
            [button setFrame:_labelOne.frame];
        }
    }
    if (_numberOflabels==4) {
        if (button.frame.origin.y>_labelFour.frame.origin.y) {
            [button setFrame:_labelFour.frame];
        }
        if (button.frame.origin.y<_labelOne.frame.origin.y) {
            [button setFrame:_labelOne.frame];
        }
    }
    if (_numberOflabels==5) {
        if (button.frame.origin.y>_labelFive.frame.origin.y) {
            [button setFrame:_labelFive.frame];
        }
        if (button.frame.origin.y<_labelOne.frame.origin.y) {
            [button setFrame:_labelOne.frame];
        }
    }
    
    if(button.frame.origin.y==_labelOne.frame.origin.y)
    {
        _selectedIndex = 0;
    } else if (button.frame.origin.y==_labelTwo.frame.origin.y)
    {
        _selectedIndex = 1;
    } else if (button.frame.origin.y==_labelThree.frame.origin.y)
    {
        _selectedIndex = 2;
    } else if (button.frame.origin.y==_labelFour.frame.origin.y)
    {
        _selectedIndex = 3;
    } else if (button.frame.origin.y==_labelFive.frame.origin.y)
    {
        _selectedIndex = 4;
    }
    [self changeSelectedLayer];
    [self.delegate switchChangedSliderSwitch:self];
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
    if (_numberOflabels==2) {
        if (button.frame.origin.x>_labelTwo.frame.origin.x) {
            [button setFrame:_labelTwo.frame];
        }
        if (button.frame.origin.x<_labelOne.frame.origin.x) {
            [button setFrame:_labelOne.frame];
        }
    }
    
    if (_numberOflabels==3) {
        if (button.frame.origin.x>_labelThree.frame.origin.x) {
            [button setFrame:_labelThree.frame];
        }
        if (button.frame.origin.x<_labelOne.frame.origin.x) {
            [button setFrame:_labelOne.frame];
        }
    }
    if (_numberOflabels==4) {
        if (button.frame.origin.x>_labelFour.frame.origin.x) {
            [button setFrame:_labelFour.frame];
        }
        if (button.frame.origin.x<_labelOne.frame.origin.x) {
            [button setFrame:_labelOne.frame];
        }
    }
    if (_numberOflabels==5) {
        if (button.frame.origin.x>_labelFive.frame.origin.x) {
            [button setFrame:_labelFive.frame];
        }
        if (button.frame.origin.x<_labelOne.frame.origin.x) {
            [button setFrame:_labelOne.frame];
        }
    }
    
    if(button.frame.origin.x==_labelOne.frame.origin.x)
    {
        _selectedIndex = 0;
    } else if (button.frame.origin.x==_labelTwo.frame.origin.x)
    {
        _selectedIndex = 1;
    } else if (button.frame.origin.x==_labelThree.frame.origin.x)
    {
        _selectedIndex = 2;
    } else if (button.frame.origin.x==_labelFour.frame.origin.x)
    {
        _selectedIndex = 3;
    } else if (button.frame.origin.x==_labelFive.frame.origin.x)
    {
        _selectedIndex = 4;
    }
    [self changeSelectedLayer];
    [self.delegate switchChangedSliderSwitch:self];
    
}

//set Text for options label
- (void)setText:(NSString *)text atLabelIndex:(NSUInteger )number
{
    switch (number) {
        case 1:
            _labelOne.text=text;
            break;
        case 2:
            _labelTwo.text=text;
            break;
        case 3:
            _labelThree.text=text;
            break;
        case 4:
            _labelFour.text=text;
            break;
        case 5:
            _labelFive.text=text;
            break;
        default:
            break;
    }
    [self changeSelectedLayer];
}





@end
