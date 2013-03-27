SliderSwitch
============

A custom windowed slider designed by [Chris Norstrom](http://www.chrisnorstrom.com/2012/11/invention-multiple-choice-windowed-slider-ui/) which can be use to replace UISwitch.

##How to use:
1. Download  Slider Switch Demo
2. Copy SliderSwitch.h and SliderSwitch.m 
3. Add the framework QuartzCore.framework in order to be linked into your build.
4. Implement SliderSwitchDelegate  and declare a property in your viewcontroller.h

        @interface SwitchViewController : UIViewController  <SliderSwitchDelegate>
        @property(nonatomic,retain) SliderSwitch *slideSwitchH,*slideSwitchV;
5. Initialize slideSwitchH and slideSwitchV.

         slideSwitchH=[[ SliderSwitch alloc]init];
         slideSwitchV=[[ SliderSwitch alloc]init];
6.  Call setFrameHorizontal to create a horizontal slider

        [slideSwitchH setFrameHorizontal:(CGRectMake(40, 100, 240, 40)) numberOfFields:3 withCornerRadius:4.0];
7.  Call setFrameVertical to create a vertical slider

        [slideSwitchV setFrameVertical:(CGRectMake(40, 200, 210, 120)) numberOfFields:3 withCornerRadius:5.0];

8. set slideSwitchH.delegate  and slideSwitchV.delegate to your current view Controller (which implements SliderSwitchDelegate).

        slideSwitchH.delegate=self;
        slideSwitchV.delegate=self;

8. Call setText by passing a string for the label at particular index.

        [slideSwitchH setText:@"red" forTextIndex:1];
10. Call setFrameBackgroundColor to set the background color of frame.
 
        [slideSwitchH setFrameBackgroundColor:[UIColor grayColor]];
For transparent Slider Switch
   
        [slideSwitchH setFrameBackgroundColor:[UIColor colorWithRed:0.1 green:0.1 blue:0.2 alpha:0.3]];
11. Call setSwitchFrameColor to set the frame color of switch.

        [slideSwitchH setSwitchFrameColor:[UIColor whiteColor]];
12. Call setSwitchBorderWidth to set the border width of Switch.

        [slideSwitchH setSwitchBorderWidth:6.0];

13. Implement delegate method switchChangedAtIndex to know the selected option and take appropriate action in your View Controller.This method receives the current slider switch view and index.

         -(void)slideView:(SliderSwitch *)slideswitch switchChangedAtIndex:(NSUInteger)index
         {
         NSLog(@"selected option is:::::: %@,%d",slideswitch,index);
    
        if (slideswitch==slideSwitchH) {
        NSLog(@"Horizontal slide Switch");
        if (index==0) {           
            self.view.backgroundColor=[UIColor redColor];           
        }
        else
            if (index==1) {                
                self.view.backgroundColor=[UIColor blueColor];                
            }
            else
                if (index==2) {                    
                    self.view.backgroundColor=[UIColor greenColor];                    
                }

        }
        if (slideswitch==slideSwitchV) {
        NSLog(@"Vertical slide Switch");
        if (index==0) {            
            self.view.backgroundColor=[UIColor redColor];
        }
        else
            if (index==1) {                
                self.view.backgroundColor=[UIColor blueColor];                
            }
            else
                if (index==2) {                    
                    self.view.backgroundColor=[UIColor greenColor];                    
                }
        }    
        }

          

    

###Note:
The purpose of setFrameHorizontal and setFrameVertical method is to set a frame for slider switch and decide the height and width of each options by dividing frame's height or width/numberOfFields. So,
while passing frame's width for  setFrameHorizontal   and numberOfFields make sure that division of frame's width by numberOfFields should not be a fractional value. similarly, while passing frame's height for  setFrameVertical   and numberOfFields make sure that division of frame's  height by numberOfFields should not be a fractional value.

#####Steps 9,10,11,12 are optional.


