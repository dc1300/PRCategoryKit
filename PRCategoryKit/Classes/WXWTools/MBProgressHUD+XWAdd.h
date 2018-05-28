//
//  MBProgressHUD+XWAdd.h
//  test1
//
//  Created by wangxiangwei on 17/3/3.
//  Copyright © 2017年 purang. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (XWAdd)

+ (void)showHUDAddTo:(UIView *)view;

+ (void)showHUDTitle:(NSString *)title addTo:(UIView *)view;

+ (void)showHUDTitle:(NSString *)title addTo:(UIView *)view delay:(NSInteger)delay;

+ (void)hideHUDFromTo:(UIView *)view;
@end
