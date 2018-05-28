//
//  MBProgressHUD+XWAdd.m
//  test1
//
//  Created by wangxiangwei on 17/3/3.
//  Copyright © 2017年 purang. All rights reserved.
//

#import "MBProgressHUD+XWAdd.h"

@implementation MBProgressHUD (XWAdd)

+ (MBProgressHUD *)shareMBProgressHUDTo:(UIView *)view{
    
    MBProgressHUD *hud = [self showHUDAddedTo:view animated:YES];
    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.backgroundColor = [UIColor blackColor];
    
    return hud;
}

+ (void)showHUDAddTo:(UIView *)view{
    [self shareMBProgressHUDTo:view];
}

+ (void)showHUDTitle:(NSString *)title addTo:(UIView *)view{
    [self showHUDTitle:title addTo:view delay:1.2];
}

+ (void)showHUDTitle:(NSString *)title addTo:(UIView *)view delay:(NSInteger)delay{
    MBProgressHUD *hud = [self shareMBProgressHUDTo:view];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = title;
    [hud hideAnimated:YES afterDelay:delay];
}

+ (void)hideHUDFromTo:(UIView *)view{
    [self hideHUDForView:view animated:YES];
}



@end
