//
//  SSMyAppointmentVC.h
//  BONEDE
//
//  Created by hank on 2018/9/12.
//  Copyright © 2018年 hank. All rights reserved.
//

#import "SSBaseVC.h"

@interface SSMyAppointmentVC : SSBaseVC

- (instancetype)initWithType:(SSAppointmenyStyle)type;
- (instancetype)initWithType:(SSAppointmenyStyle)type userType:(SSClientTypeStyle)userType;

@end
