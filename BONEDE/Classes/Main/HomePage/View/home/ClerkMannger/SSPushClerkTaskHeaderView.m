//
//  SSPushClerkTaskHeaderView.m
//  BONEDE
//
//  Created by hank on 2019/5/15.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSPushClerkTaskHeaderView.h"

@implementation SSPushClerkTaskHeaderView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self addGestureRecognizer:ges];
}

- (void)tap{
    kMeCallBlock(_tapBlock);
}

@end
