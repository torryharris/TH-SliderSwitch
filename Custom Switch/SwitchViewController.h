//
//  SwitchViewController.h
//  Slider Switch Demo
//  Created by Torry Harris's Mac Mini  on 21/01/13.
//  Copyright (c) 2013 Torry Harris's Mac . All rights reserved.
//  Modified by Torry Harris's Mac on 6th March, 2014.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SliderSwitch.h"

@interface SwitchViewController : UIViewController  <SliderSwitchDelegate>
@property(nonatomic,retain) SliderSwitch *slideSwitchH,*slideSwitchV;

@end
