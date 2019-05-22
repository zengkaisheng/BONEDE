//
//  SSCLerkWorkShowListModel.h
//  BONEDE
//
//  Created by hank on 2019/5/17.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

/*
 "member_id": 4,
 "header_pic": "https://wx.qlogo.cn/mmopen/vi_32/j0kicbVPYIfrHmy1I0ezPlU2b11Cs8teFad87s6uwHsUViaKsyWpwNicbGnIbOHLS8X3SBJyWJ9WdXIMfhqwAgiaWA/132",
 "name": "爱是空白日记_",
 "count": 2
 */
@interface SSCLerkWorkShowListModel : SSBaseModel

@property (nonatomic, copy) NSString *member_id;
@property (nonatomic, copy) NSString *header_pic;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *count;

@end

NS_ASSUME_NONNULL_END
