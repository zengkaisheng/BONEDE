//
//  ViewPagerTitleButton.m
//  BONEDE
//
//  Created by gao lei on 2019/5/23.
//  Copyright © 2019年 BONEDE. All rights reserved.
//

#import "ViewPagerTitleButton.h"

@implementation ViewPagerTitleButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
        [self setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateSelected];
    }
    return self;
}
-(void)drawRect:(CGRect)rect
{
    if (self.selected) {
        CGFloat lineWidth = 2;
        CGColorRef color = kSS333333.CGColor;
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGContextSetStrokeColorWithColor(ctx, color);
        CGContextSetLineWidth(ctx, lineWidth);
        CGFloat pointA = self.width != 0 ? (self.frame.size.width - self.width) / 2 : self.frame.size.width / 4;
        CGFloat pointB = self.width != 0 ? pointA + self.width : self.frame.size.width / 4 * 3;
        CGContextMoveToPoint(ctx, pointA, self.frame.size.height-lineWidth);
        CGContextAddLineToPoint(ctx, pointB, self.frame.size.height-lineWidth);
        CGContextStrokePath(ctx);
    }
}

@end
