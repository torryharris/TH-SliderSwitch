//
//  SwitchViewController.h
//  Custom Switch
//
//  Created by Abhishek's Mac Mini  on 21/01/13.
//  Copyright (c) 2013 Abhishek's Mac . All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SliderSwitch.h"



@interface SwitchViewController : UIViewController  <SliderSwitchDelegate>
@property(nonatomic,retain) SliderSwitch *slideSwitchH,*slideSwitchV;






@end
