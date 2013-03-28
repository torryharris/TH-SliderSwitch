//
//  SwitchViewController.m
//  Custom Switch
//
//  Created by Abhishek's Mac Mini  on 21/01/13.
//  Copyright (c) 2013 Abhishek's Mac . All rights reserved.
//

#import "SwitchViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "SliderSwitch.h"


@interface SwitchViewController ()

@end

@implementation SwitchViewController
@synthesize slideSwitchH,slideSwitchV;


-(void)viewWillAppear:(BOOL)animated
{
    
}

-(void)viewWillDisappear:(BOOL)animated
{
 
}



- (void)viewDidLoad
{
       
    slideSwitchH=[[SliderSwitch alloc]init];
    
    [slideSwitchH setFrameHorizontal:(CGRectMake(40, 100, 240, 40)) numberOfFields:3 withCornerRadius:4.0];
    //240/3=80
    //width of each option is 80 (It should not be a fractional value)
    slideSwitchH.delegate=self;
    [slideSwitchH setFrameBackgroundColor:[UIColor colorWithRed:0.1 green:0.1 blue:0.2 alpha:0.3]];
    [slideSwitchH setSwitchFrameColor:[UIColor whiteColor]];
    [slideSwitchH setTextColor:[UIColor grayColor]];
    
    [slideSwitchH setText:@"red" forTextIndex:1];
    [slideSwitchH setText:@"blue" forTextIndex:2];
    [slideSwitchH setText:@"green" forTextIndex:3];
    [slideSwitchH setSwitchBorderWidth:6.0];
    [self.view addSubview:slideSwitchH];
    
    slideSwitchV=[[SliderSwitch alloc]init];
    slideSwitchV.delegate=self;     
    [slideSwitchV setFrameVertical:(CGRectMake(40, 200, 210, 120)) numberOfFields:3 withCornerRadius:5.0];
    [slideSwitchV setFrameBackgroundColor:[UIColor grayColor]];
    [slideSwitchV setSwitchFrameColor:[UIColor lightTextColor]];
    [slideSwitchV setSwitchBorderWidth:8.0];
    //120/3=40
    //Height of each option is 40 (It should not be a fractional value)
    
   
    [slideSwitchV setText:@"Red" forTextIndex:1];
    [slideSwitchV setText:@"blue" forTextIndex:2];
    [slideSwitchV setText:@"green" forTextIndex:3];   
    [self.view addSubview:slideSwitchV];
    [super viewDidLoad];      
    
	
}


//Implement delegate method switchChangedAtIndex to know the selected option and take appropriate action
-(void)slideView:(SliderSwitch *)slideswitch switchChangedAtIndex:(NSUInteger)index
{
    NSLog(@"selected option is:::::: %@,%d",slideswitch,index);
    
    if (slideswitch==slideSwitchH) {
        NSLog(@"Horizontal slideview");
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
        NSLog(@"Vertiacal slideview");
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



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
