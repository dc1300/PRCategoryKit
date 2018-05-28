//
//  WeakScriptMessageDelegate.h
//  PurangFinance
//
//  Created by liumingkui on 15/12/21.
//  Copyright © 2015年 ___PURANG___. All rights reserved.
//

#import <UIKit/UIKit.h>
@import WebKit;

@interface WeakScriptMessageDelegate : NSObject<WKScriptMessageHandler>
@property (nonatomic, weak) id<WKScriptMessageHandler> scriptDelegate;

- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)scriptDelegate;
@end
