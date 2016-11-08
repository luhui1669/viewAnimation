//
//  TPMenuVeiw.h
//  viewAnimation
//
//  Created by H L on 2016/10/31.
//  Copyright © 2016年 H L. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "startRectModel.h"

@interface TPMenuVeiw : UIView

@property (nonatomic, assign)BOOL isHide;

+ (instancetype)TPMenuViewInitialWithFrame:(CGRect)frame
                            Blocks:(NSArray *)blocks
                    deleController:(UIViewController *)vc
                         keyWindow:(UIWindow *)kWindow;
- (void)start:(CGRect)rect ;

@end
