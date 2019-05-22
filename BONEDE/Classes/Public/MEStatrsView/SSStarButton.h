//
//  SSStarButton.h
//  BONEDE
//
//  Created by hank on 2018/9/7.
//  Copyright © 2018年 hank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSStarButton : UIButton

@property (nonatomic, strong) UIImage *normalImage;
@property (nonatomic, strong) UIImage *highlightedImage;
@property (nonatomic, assign) CGFloat fractionPart;
- (instancetype)initWithSize:(CGSize)size;
- (CGFloat)fractionPartOfPoint:(CGPoint)point;

@end
