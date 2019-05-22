//
//  SSFourHomeHeaderView.h
//  BONEDE
//
//  Created by hank on 2019/4/12.
//  Copyright © 2019 hank. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

const static CGFloat kSSFourHomeHeaderViewHeight = 322;

@protocol  SSFourHomeHeaderViewDelegate <NSObject>
- (void) toAiVC;
//- (void) toStoreDiagnosisVC;
- (void) toGiftVC;
- (void) toPAVC;
- (void) toClerkManngerVC;
- (void) toCaseVC;
//- (void) toShareVC;
//- (void) toPropagandaVC;
@end

@interface SSFourHomeHeaderView : UITableViewHeaderFooterView

@property(nonatomic, weak) id<SSFourHomeHeaderViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
