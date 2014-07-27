//
//  TestViewController.m
//  PodsTest
//
//  Created by Anim on 14-7-26.
//  Copyright (c) 2014年 Anim. All rights reserved.
//

#import "TestViewController.h"

#define isPortrait UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation)

@interface TestViewController ()

@property (nonatomic, strong) UIView *curreentView;

@end

@implementation TestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didRotate:) name:UIDeviceOrientationDidChangeNotification object:nil];   
    self.curreentView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 320, 180)];
    self.curreentView.backgroundColor = [UIColor greenColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(_curreentView.frame.size.width-10-50, _curreentView.frame.size.height-10-50, 50, 50)];
    label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
    label.backgroundColor = [UIColor blueColor];
    label.text = @"hello";
    [_curreentView addSubview:label];
    [self.view addSubview:_curreentView];
}

- (void)didRotate:(NSNotification *)notification
{
//    if (isPortrait) {
//        _curreentView.frame = CGRectMake(0, 0, 480, 320);
//    } else {
//        _curreentView.frame = CGRectMake(0, 20, 320, 180);
//    }
      
    [UIView animateWithDuration:0.3 animations:^{
        UIDevice *device = [UIDevice currentDevice];
        if (device.orientation == UIInterfaceOrientationPortraitUpsideDown || device.orientation == UIInterfaceOrientationPortrait) 
        {
            _curreentView.center = CGPointMake(self.view.frame.size.width/2, 110);
            CGAffineTransform newTransform = CGAffineTransformMakeRotation(0 * (M_PI / 180.0f)); 
            newTransform = CGAffineTransformScale(newTransform, 1.0, 1.0);
            _curreentView.transform = newTransform;            
        } else {
            _curreentView.center = self.view.center;            
            CGAffineTransform newTransform = CGAffineTransformMakeRotation(90 * (M_PI / 180.0f));                                       
            newTransform = CGAffineTransformScale(newTransform, self.view.frame.size.height/320, self.view.frame.size.height/320);            
            _curreentView.transform = newTransform;

        }        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
