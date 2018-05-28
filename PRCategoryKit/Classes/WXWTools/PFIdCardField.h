//
//  PFIdCardField.h
//  PurangFinanceVillage
//
//  Created by wangxiangwei on 17/9/19.
//  Copyright © 2017年 ___PURANG___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PFIdCardField : UITextField
/**
 *  使用了键盘头部工具条，调整了键盘的高度
 */
@property (nonatomic, assign) BOOL adjustTextFeildH;
- (void)keyboardWillHide:(NSNotification *)notification;
@end
