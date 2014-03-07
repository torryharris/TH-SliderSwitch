//
//  TestSliderSwitch.m
//  Slider Switch Demo
//
//  Created by Torry Harris on 25/02/14.
//  Copyright (c) 2014 Torry Harris. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SliderSwitch.h"

@interface TestSliderSwitch : XCTestCase
@property (nonatomic, retain) SliderSwitch *sliderSwitch;
@end

@implementation TestSliderSwitch

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
    NSLog(@"NSLog-setup");
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testInit
{
    _sliderSwitch = [[SliderSwitch alloc] init];
    NSUInteger selecteValue = 0;
    XCTAssertEqual(selecteValue, _sliderSwitch.selectedIndex, @"Selected Index Not Set");
    XCTAssertEqualObjects([UIFont boldSystemFontOfSize:18], _sliderSwitch.selectedFont, @"Selected Font Not Set");
    XCTAssertEqualObjects([UIColor whiteColor], _sliderSwitch.selectedColor, @"Selected Color Not Set");
    XCTAssertEqualObjects([UIFont systemFontOfSize:14], _sliderSwitch.unSelectedFont, @"Unselected Font Not Set");
    XCTAssertEqualObjects([UIColor blackColor], _sliderSwitch.unSelectedColor, @"Unselected Color Not Set");
    
}

- (void)testInitWithFrame{
    _sliderSwitch = [[SliderSwitch alloc] initWithFrame:CGRectMake(10, 10, 55, 20)];
    NSUInteger selecteValue = 0;
    XCTAssertEqual(selecteValue, _sliderSwitch.selectedIndex, @"Selected Index Not Set");
    XCTAssertEqualObjects([UIFont boldSystemFontOfSize:18], _sliderSwitch.selectedFont, @"Selected Font Not Set");
    XCTAssertEqualObjects([UIColor whiteColor], _sliderSwitch.selectedColor, @"Selected Color Not Set");
    XCTAssertEqualObjects([UIFont systemFontOfSize:14], _sliderSwitch.unSelectedFont, @"Unselected Font Not Set");
    XCTAssertEqualObjects([UIColor blackColor], _sliderSwitch.unSelectedColor, @"Unselected Color Not Set");
    
    XCTAssert(_sliderSwitch.labelOne, @"Label One Not Initialized");
    XCTAssert(_sliderSwitch.labelTwo, @"Label Two Not Initialized");
    XCTAssert(_sliderSwitch.labelThree, @"Label Three Not Initialized");
    XCTAssert(_sliderSwitch.labelFour, @"Label Four Not Initialized");
    XCTAssert(_sliderSwitch.labelFive, @"Label Five Not Initialized");
}

- (void)testInitWithCoder{
    _sliderSwitch = [[SliderSwitch alloc] initWithCoder:NULL];
    NSUInteger selecteValue = 0;
    XCTAssertEqual(selecteValue, _sliderSwitch.selectedIndex, @"Selected Index Not Set");
    XCTAssertEqualObjects([UIFont boldSystemFontOfSize:18], _sliderSwitch.selectedFont, @"Selected Font Not Set");
    XCTAssertEqualObjects([UIColor whiteColor], _sliderSwitch.selectedColor, @"Selected Color Not Set");
    XCTAssertEqualObjects([UIFont systemFontOfSize:14], _sliderSwitch.unSelectedFont, @"Unselected Font Not Set");
    XCTAssertEqualObjects([UIColor blackColor], _sliderSwitch.unSelectedColor, @"Unselected Color Not Set");
    
}

-(void) testFrameBackgroundColor{
    _sliderSwitch = [[SliderSwitch alloc] init];
    [_sliderSwitch setFrameBackgroundColor:[UIColor greenColor]];
    XCTAssertEqualObjects(_sliderSwitch.labelOne.backgroundColor, [UIColor greenColor], @"Frame color didn't set for label One");
    XCTAssertEqualObjects(_sliderSwitch.labelTwo.backgroundColor, [UIColor greenColor], @"Frame color didn't set for label Two");
    XCTAssertEqualObjects(_sliderSwitch.labelThree.backgroundColor, [UIColor greenColor], @"Frame color didn't set for label Three");
    XCTAssertEqualObjects(_sliderSwitch.labelFour.backgroundColor, [UIColor greenColor], @"Frame color didn't set for label Four");
    XCTAssertEqualObjects(_sliderSwitch.labelFive.backgroundColor, [UIColor greenColor], @"Frame color didn't set for label Five");
}

-(void) testSetTextAtIndex{
    _sliderSwitch = [[SliderSwitch alloc] init];
    [_sliderSwitch setText:@"NameOfTheLabel" atLabelIndex:1];
    XCTAssertTrue([_sliderSwitch.labelOne.text isEqualToString:@"NameOfTheLabel"], @"TEXT MUST BE EQUALS TO NameOfTheLabel");
    XCTAssertFalse([_sliderSwitch.labelTwo.text isEqualToString:@"NameOfTheLabel"], @"TEXT MUST NOT EQUALS to NameOfTheLabel");
    [_sliderSwitch setText:@"NameOfTheSecondLabel" atLabelIndex:2];
    XCTAssertTrue([_sliderSwitch.labelTwo.text isEqualToString:@"NameOfTheSecondLabel"], @"TEXT MUST BE EQUALS TO NameOfTheSecondLabel");
    XCTAssertFalse([_sliderSwitch.labelOne.text isEqualToString:@"NameOfTheSecondLabel"], @"TEXT MUST NOT EQUALS to NameOfTheSecondLabel");
}





@end
