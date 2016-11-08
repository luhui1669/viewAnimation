//
//  ViewController.m
//  viewAnimation
//
//  Created by H L on 2016/10/31.
//  Copyright © 2016年 H L. All rights reserved.
//

#import "ViewController.h"
#import "TPMenuVeiw.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    TPMenuVeiw *menuView = [[TPMenuVeiw alloc]initWithFrame:self.view.frame];
    [menuView start:CGRectMake([UIScreen mainScreen].bounds.size.width - 70, [UIScreen mainScreen].bounds.size.height - 150, 50, 50)];
    menuView.backgroundColor = [UIColor yellowColor];
    menuView.isHide = YES;
    [self.view addSubview:menuView];

    
 }



@end
