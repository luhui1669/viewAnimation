//
//  TPMenuVeiw.m
//  viewAnimation
//
//  Created by H L on 2016/10/31.
//  Copyright © 2016年 H L. All rights reserved.
//

#import "TPMenuVeiw.h"
#define scale 2
#define distance (66)/scale
@interface TPMenuVeiw()
@property (nonatomic, strong) UIButton *mainImage;
@property (nonatomic, strong) UIButton *favorateImage;
@property (nonatomic, strong) UIButton *loveImage;
@property (nonatomic, strong) UIButton *scanImage;
@property (nonatomic, strong) UIButton *addImage;

@property (nonatomic, strong) NSArray*startFrameArray;
@property (nonatomic, strong) NSArray*endFrameArray;

@property (nonatomic, strong) startRectModel *startRectModel;
@property (nonatomic, strong) startRectModel *endRectModel;
@end

@implementation TPMenuVeiw


- (void)start:(CGRect)rect {
    if (!_mainImage) {
        [self setupViewWithRect:rect];
    }

}

- (void)back {


}


- (void)setupViewWithRect: (CGRect)rect{

    self.mainImage = [UIButton new];
    self.mainImage.frame = CGRectMake(rect.origin.x, rect.origin.y, 100/scale, 100/scale);
    self.mainImage.backgroundColor = [self randomColor];
//    self.mainImage.center = self.center;
    self.mainImage.layer.cornerRadius = self.mainImage.frame.size.width/2.f;
    self.mainImage.tag = 0 + 100;
    [self addSubview:_mainImage];
    
    self.favorateImage = [UIButton new];
    self.favorateImage.frame = CGRectMake(0, 0, 60/scale, 60/scale);
    self.favorateImage.backgroundColor = [self randomColor];
    self.favorateImage.layer.cornerRadius = self.favorateImage.frame.size.width/2.f;
    self.favorateImage.frame = CGRectMake(_mainImage.frame.origin.x + 40/scale, _mainImage.frame.origin.y - 108/scale, 60/scale, 60/scale);
    self.favorateImage.tag = 1 + 100;
    [self.favorateImage addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_favorateImage];
 
    self.loveImage = [UIButton new];
    self.loveImage.frame = CGRectMake(_mainImage.frame.origin.x - 50/scale, _mainImage.frame.origin.y - 88/scale, 66/scale, 66/scale);
    self.loveImage.backgroundColor = [self randomColor];
    self.loveImage.tag = 2 + 100 ;
    self.loveImage.layer.cornerRadius = self.loveImage.frame.size.width/2.f;
    [self.loveImage addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:_loveImage];
    
    self.scanImage = [UIButton new];
    self.scanImage.frame = CGRectMake(_mainImage.frame.origin.x - 110/scale, _mainImage.frame.origin.y - 10/scale, 70/scale, 70/scale);
    self.scanImage.backgroundColor = [self randomColor];
    self.scanImage.tag = 3 +100 ;
    self.scanImage.layer.cornerRadius = self.scanImage.frame.size.width/2.f;
    [self.scanImage addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:_scanImage];
    
    self.addImage = [UIButton new];
    self.addImage.frame = CGRectMake(_mainImage.frame.origin.x - 86/scale, _mainImage.frame.origin.y + 80/scale, 78/scale, 78/scale);
    self.addImage.backgroundColor = [self randomColor];
    self.addImage.tag = 4 +100 ;
    self.addImage.layer.cornerRadius = self.addImage.frame.size.width/2.f;
    [self.addImage addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:_addImage];
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(change)];
    [self.mainImage addGestureRecognizer:gesture];
    
    _startRectModel = [startRectModel new];
    _endRectModel   = [startRectModel new];
    
    [_startRectModel setRectByArray:@[_mainImage,_favorateImage,_loveImage,_scanImage,_addImage]];
    
    for (int i = 0; i < 5; i ++) {
        UIView *view = [self viewWithTag:i + 100];
        view.alpha = 0;
        
        if (i == 0 ) {
            CGRect rect = _mainImage.frame;
            rect.origin.x += distance;
            _mainImage.frame = rect;
            _mainImage.alpha = 1;
            continue;
        }else if (i == 4) {
            UIView *nextview = [self viewWithTag:100];
            view.center = nextview.center;
            continue;
        }
        UIView *nextview = [self viewWithTag:i + 101];
        view.center = nextview.center;

    }
    [_endRectModel setRectByArray:@[_mainImage,_favorateImage,_loveImage,_scanImage,_addImage]];
}

- (UIColor *)randomColor {
    
    return [UIColor colorWithRed:arc4random() % 101 / 100.f
                           green:arc4random() % 101 / 100.f
                            blue:arc4random() % 101 / 100.f
                           alpha:1];
}

- (void)change {
    _isHide = !_isHide;

    _isHide ?  [self backAnimation] : [self startAnimation];
    
}

- (void)startAnimation {

    [UIView animateKeyframesWithDuration:0.3 delay:0 options:2 animations:^{
        for (int i = 0; i < 5; i ++) {
            UIView *view = [self viewWithTag:i + 100];
            view.alpha = 1;
            view.frame = [_startRectModel getRectByTag:i];
        }
        
    } completion:^(BOOL finished) {
        
    }];

}

- (void)backAnimation {

    [UIView animateKeyframesWithDuration:0.3 delay:0 options:2 animations:^{
        for (int i = 0; i < 5; i ++) {
            UIView *view = [self viewWithTag:i + 100 ];
            view.alpha = 0;

            if (i == 0 ) {
                view.alpha = 1;
            }
            view.frame = [_endRectModel getRectByTag:i];
        }

    } completion:^(BOOL finished) {
        
    }];
    
}

- (void)click:(UIButton*) sender{
    [self change];
    NSLog(@"第%@个按钮被点击",@(sender.tag));

}
@end
