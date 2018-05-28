//
//  PFVFinancialDicMgr.h
//  PurangFinanceVillage
//
//  Created by daichen on 2017/7/17.
//  Copyright © 2017年 ___PURANG___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PFVFinancialDicMgr : NSObject
/**方向 买入->0,卖出->1*/
+(NSString *)getFinancialDirection:(NSString *)text;
/**本息类别*/
+(NSString *)getFinancialInterestType:(NSString *)text;
/**理财评级*/
+(NSString *)getFinancialLevelType:(NSString *)text;
/**发行方*/
+(NSString *)getFinancialIssueTypelType:(NSString *)text;
/**理财主体类别*/
+ (NSString *)getFinancialMainBodyType:(NSString *)text;
/**理财类别   标准->1,非标->2*/
+ (NSString *)getFinancialType:(NSString *)text;
/**理财期限*/
+ (NSString *)getFinancialLimitDay:(NSString *)text;
/**1:表示当天 2表示最近一周 3 表示最近一个月*/
+ (NSString *)getFinancialTime:(NSString *)text;
/**1：待交易 2：交易中 4：已交易 5：未交易*/
+ (NSString *)getFinancialStatus:(NSString *)text;
/**今日->1  周累计->2 月累计->3 年累计->4*/
+ (NSString *)getQuoteTimeType:(NSString *)text;
/**期限时间类型 年->1*/
+ (NSString *)getFinancialMainBodylimitDayType:(NSString *)text;
#pragma mark code—>具体类型
/**理财评级 1-> R1*/
+ (NSString *)getFinancialLevelCode:(NSString *)code;
/**理财评级 1->R1(谨慎型)*/
+(NSString *)getFinancialLevelDetailCode:(NSString *)code;
/**主体类别1：同业理财，2：企业理财*/
+ (NSString *)getFinancialMainBodyCode:(NSString *)code;
/**本息类别；1：保本保息2：保本浮息3：浮本浮息*/
+(NSString *)getFinancialInterestCode:(NSString *)code;
/**发行方：1：银行；2：基金；3：券商；4：信托；5：保险；6：资管；7：不限 8：国有；9：股份；10：城商；11：外资；12：农商；13：其他*/
+ (NSString *)getFinancialIssueTypelCode:(NSString *)code;
/**标准非标*/
+(NSString *)getFinancialTypeCode:(NSString *)code;
/**1 保息2：保息3：浮息*/
+(NSString *)getFinancialInterestTypeCode:(NSString *)code;
/**状态：1：待撮合 2：已撮合 3：正在操作 4：已完成 5：已放弃6 撤单 7 转明天*/
+(NSString *)getFinancialStatusByCode:(NSString *)code;
/**期限时间类型 1->年*/
+ (NSString *)getFinancialMainBodylimitDay:(NSString *)text;
@end
