//
//  startRectModel.h
//  viewAnimation
//
//  Created by H L on 2016/10/31.
//  Copyright © 2016年 H L. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface startRectModel : NSObject

@property (nonatomic, assign)CGRect mainImageRect;
@property (nonatomic, assign)CGRect favorateImageRect;
@property (nonatomic, assign)CGRect loveImageRect;
@property (nonatomic, assign)CGRect scanImageRect;
@property (nonatomic, assign)CGRect addImageRect;

- (CGRect)getRectByTag:(NSInteger)tag;
- (void)setRectByArray:(NSArray*)rectArray;

@end
