SliderSwitch
============

A custom windowed slider designed by [Chris Norstrom](http://www.chrisnorstrom.com/2012/11/invention-multiple-choice-windowed-slider-ui/) which can be use to replace UISwitch.


![alt text](https://raw.github.com/torryharris/SliderSwitch/master/images/switchH.png "Logo Title Text 1")

##How to use:
1.  Deployment target should be 5.0 or later
2.  Download  Slider Switch Demo
3.  Copy SliderSwitch.h and SliderSwitch.m (It incorporates ARC)
4.  Add the framework QuartzCore.framework in order to be linked into your build.
5.  Import SliderSwitch class and Confirm the SliderSwitchDelegate at your interface

        #import "SliderSwitch.h"
        @interface SwitchViewController : UIViewController  <SliderSwitchDelegate>
        
6.  Create a object of SliderSwitch Class

        SliderSwitch *sliderSwitch = [[SliderSwitch alloc] init];
7.  Call setFrameHorizontal to create a horizontal slider

        [sliderSwitch setFrameHorizontal:(CGRectMake(40, 100, 240, 40)) numberOfFields:3 withCornerRadius:4.0];
    
    OR Call setFrameVertical to create a vertical slider

        [sliderSwitch setFrameVertical:(CGRectMake(40, 200, 210, 120)) numberOfFields:3 withCornerRadius:5.0];

8.  Set delegate as your current Controller (which implements SliderSwitchDelegate).

        sliderSwitch.delegate=self;

9. Call setText by passing a string for a label at particular index(Starts from 1).

        [sliderSwitch setText:@"Red" atLabelIndex:1];
10. Call setFrameBackgroundColor to set the background color of frame.
 
        [sliderSwitch setFrameBackgroundColor:[UIColor grayColor]];
        
    For transparent Slider Switch
   
        [sliderSwitch setFrameBackgroundColor:[UIColor colorWithRed:0.1 green:0.1 blue:0.2 alpha:0.3]];
11. Call setSwitchFrameColor to set the frame color of switch.

        [sliderSwitch setSwitchFrameColor:[UIColor whiteColor]];
12. Call setSwitchBorderWidth to set the border width of Switch.

        [sliderSwitch setSwitchBorderWidth:6.0];
        
13. You can change some of the newly added properties.

        sliderSwitch.selectedFont = [UIFont boldSystemFontOfSize:18];
        sliderSwitch.selectedColor = [UIColor whiteColor];
        sliderSwitch.unSelectedFont = [UIFont systemFontOfSize:14];
        sliderSwitch.unSelectedColor = [UIColor blackColor];
    
    Readonly property is available to check the current selected index
    	
		NSUInteger selectedNumber = sliderSwitch.selectedIndex;
              

14. Implement delegate method switchChangedAtIndex to know the selected option and take appropriate action in your View Controller.This method receives the current slider switch view and index.

         -(void)switchChangedSliderSwitch:(SliderSwitch *)sliderSwitch{
            if (sliderSwitch==sliderSwitch) {
                if (sliderSwitch.selectedIndex==0) {
                    self.view.backgroundColor=[UIColor redColor];
                } else if (sliderSwitch.selectedIndex==1) {
                    self.view.backgroundColor=[UIColor blueColor];
                } else if (sliderSwitch.selectedIndex==2) {
                    self.view.backgroundColor=[UIColor greenColor];
                }
            } 
        }

###Note:
The purpose of setFrameHorizontal and setFrameVertical method is to set a frame for slider switch and decide the height and width of each options by dividing frame's height or width/numberOfFields. So,
while passing frame's width for  setFrameHorizontal   and numberOfFields make sure that division of frame's width by numberOfFields should not be a fractional value. similarly, while passing frame's height for  setFrameVertical   and numberOfFields make sure that division of frame's  height by numberOfFields should not be a fractional value.

####Steps 10,11,12 and 13 are optionals.
##License
SliderSwitch is licensed under the terms of the MIT License. Please see the [License](https://github.com/torryharris/SliderSwitch/blob/master/License) file for full details.
