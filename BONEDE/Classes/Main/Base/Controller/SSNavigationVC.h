//
//  SSNavigationVC.h
//  BONEDE
//
//  Created by hank on 2018/9/5.
//  Copyright © 2018年 hank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSNavigationVC : UINavigationController

/**
 *  是否能活动返回 default YES
 */
@property (nonatomic,assign) BOOL canDragBack;
/**
 *  获取当前视图的image
 *
 *  @return Image
 */
+ (UIImage *)capture;

@end
