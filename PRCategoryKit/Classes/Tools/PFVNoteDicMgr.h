//
//  PFVNoteDicMgr.h
//  PurangFinanceVillage
//
//  Created by daichen on 2017/8/16.
//  Copyright © 2017年 ___PURANG___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PFVNoteDicMgr : NSObject

/**方向 买入->2,卖出->1*/
+(NSString *)getNoteDirection:(NSString *)text;
/**直贴承兑类别 国有->3010*/
+ (NSString *)getStraightBankName:(NSString *)text;
/**直贴承兑类别 3010->国有**/
+ (NSString *)getStraightBankNameCode:(NSString *)text;
/**直贴票据期限 隔日->0*/
+ (NSString *)getStraightLimitDay:(NSString *)text;
+ (NSString *)getEBALimitDay:(NSString *)text;
/**空 表示全部；待交易：1；交易中：2；已交易：3；未交易：4(保留兼容老版本)；转明天：5；已放弃：6*/
+ (NSString *)getBillSearchStatusByName:(NSString *)text;
/**交易日，必填项 String  0: 当天 1: 当月 2: 当年*/
+ (NSString *)getBillDateTypeByName:(NSString *)text;
#pragma mark ----- 转贴
/**转贴 票据类型 银票-纸票 -> 1*/
+ (NSString *)getQuoteNoteTypeCodeByName:(NSString *)text;
/**转贴 银票 1001 商票 1002*/
+ (NSString *)getQuoteBillTypeCodeByName:(NSString *)text;
/**方向 买入->2001,卖出->2002*/
+(NSString *)getQuoteDirection:(NSString *)text;
/**方向 买入->b,卖出->s*/
+(NSString *)getQuoteDirectionOfBS:(NSString *)text;
/**转贴行情方向 买入->0,卖出->1*/
+(NSString *)getQuoteQuotationDirection:(NSString *)text;
/**转贴承兑类别 国有->3010*/
+ (NSString *)getQuoteBankName:(NSString *)text;
/**转贴承兑类别 3010->国有**/
+ (NSString *)getQuoteBankNameCode:(NSString *)text;
/**转贴票据期限 隔日->0*/
+ (NSString *)getQuoteLimitDay:(NSString *)text;
/**转贴交易模式 买断->1001*/
+ (NSString *)getTradeModeCodeByName:(NSString *)text;
/**转贴交易模式Code 1001->买断*/
+ (NSString *)getTradeModeNameByCode:(NSString *)text;
/**转贴电票打款方式 1001->线上*/
+ (NSString *)getPayWayNameByCode:(NSString *)text;
/**空 表示全部；传Code "1"==待交易 "2"==交易中 "3"==已交易 "4"==已放弃 "5"==转明日*/
+ (NSString *)getQuoteBillSearchStatusByName:(NSString *)text;
@end
