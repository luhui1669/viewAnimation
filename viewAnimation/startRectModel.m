//
//  startRectModel.m
//  viewAnimation
//
//  Created by H L on 2016/10/31.
//  Copyright © 2016年 H L. All rights reserved.
//

#import "startRectModel.h"

@implementation startRectModel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (CGRect)getRectByTag:(NSInteger)tag {

    CGRect rect ;
    switch (tag) {
        case 0:
            rect = self.mainImageRect;
            break;
            
        case 1:
            rect = self.favorateImageRect;
            break;
            
        case 2:
            rect = self.loveImageRect;
            break;
            
        case 3:
            rect = self.scanImageRect;
            break;
            
        case 4:
            rect = self.addImageRect;
            break;
            
        default:
            break;
    }
    
    return  rect;
}


- (void)setRectByArray:(NSArray*)rectArray {

    _mainImageRect      = ((UIView *)rectArray[0]).frame;
    _favorateImageRect  = ((UIView *)rectArray[1]).frame;
    _loveImageRect      = ((UIView *)rectArray[2]).frame;
    _scanImageRect      = ((UIView *)rectArray[3]).frame;
    _addImageRect       = ((UIView *)rectArray[4]).frame;


}


@end
