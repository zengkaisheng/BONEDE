//
//  SSTimePickerView.h
//  BONEDE
//
//  Created by hank on 2019/5/16.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSTimePickerView : UIView

- (instancetype)initWithSelectDaye:(kMeDictionaryBlock)block;
- (void)show;

@end

NS_ASSUME_NONNULL_END
