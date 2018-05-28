//
//  PFVFinancialDicMgr.m
//  PurangFinanceVillage
//
//  Created by daichen on 2017/7/17.
//  Copyright © 2017年 ___PURANG___. All rights reserved.
//

#import "PFVFinancialDicMgr.h"
#import "Utils.h"
#import "Header.h"
@implementation PFVFinancialDicMgr
+(NSString *)getFinancialDirection:(NSString *)text{
    NSDictionary *dic = @{
                          @"买入":@"0",
                          @"卖出":@"1"
                          };
    return [Utils getResult:dic text:text];
}

//本息类别
+(NSString *)getFinancialInterestType:(NSString *)text{
    if ([text isEqualToString:@"保本保息"]) {
        return @"1";
    }else if ([text isEqualToString:@"保本浮息"]){
        return @"2";
    }else if ([text isEqualToString:@"浮本浮息"]){
        return @"3";
    }else{
        return @"";
    }
}

//理财评级
+(NSString *)getFinancialLevelType:(NSString *)text{
    NSDictionary *dic = @{
                          @"R1(谨慎型)":@"1",
                          @"R2(稳健型)":@"2",
                          @"R3(平衡型)":@"3",
                          @"R4(进取型)":@"4",
                          @"R5(激进型)":@"5",
                          @"不限":@"6",
                          @"其他":@"7"
                          };
    return [Utils getResult:dic text:text];
}

//发行方
+ (NSString *)getFinancialIssueTypelType:(NSString *)text{
    NSDictionary *dic = @{
                          @"银行":@"1",
                          @"基金":@"2",
                          @"券商":@"3",
                          @"信托":@"4",
                          @"保险":@"5",
                          @"资管":@"6",
                          @"不限":@"7",
                          @"国有":@"8",
                          @"股份":@"9",
                          @"城商":@"10",
                          @"外资":@"11",
                          @"农商":@"12",
                          @"其他":@"13",
                          @"民营":@"14"
                          };
    
    return [Utils getResult:dic text:text];
}


//主体类别
+ (NSString *)getFinancialMainBodyType:(NSString *)text{
    NSDictionary *dic = @{
                          @"同业理财":@"1",
                          @"企业理财":@"2"
                          };
    
    return [Utils getResult:dic text:text];
}

///期限时间类型 年->1
+ (NSString *)getFinancialMainBodylimitDayType:(NSString *)text{
    NSDictionary *dic = @{
                          @"天":@"1",
                          @"月":@"2",
                          @"年":@"3"
                          };
    
    return [Utils getResult:dic text:text];
}

///期限时间类型 1->年
+ (NSString *)getFinancialMainBodylimitDay:(NSString *)text{
    NSDictionary *dic = @{
                          @"1":@"天",
                          @"2":@"月",
                          @"3":@"年"
                          };
    
    return [Utils getResult:dic text:text];
}
//产品类别
+ (NSString *)getFinancialType:(NSString *)text{
    NSDictionary *dic = @{
                          @"标准":@"1",
                          @"非标":@"2"
                          };
    
    return [Utils getResult:dic text:text];
}

//理财期限
+ (NSString *)getFinancialTime:(NSString *)text{
    NSDictionary *dic = @{
                          @"当天":@"1",
                          @"最近一周":@"2",
                          @"最近一月":@"3",
                          };
    
    return [Utils getResult:dic text:text];
}

//理财期限
+ (NSString *)getFinancialLimitDay:(NSString *)text{
    NSDictionary *dic = @{
                          @"隔夜":@"0",
                          @"7天":@"1",
                          @"14天":@"2",
                          @"1月":@"3",
                          @"3月":@"4",
                          @"6月":@"5",
                          @"9月":@"6",
                          @"1年":@"7",
                          @"1年以上":@"8",
                          @"期限":@""
                          };
    if ([text isEqualToString:@"1月"]) {
        return @"2,3";
    }
    return [Utils getResult:dic text:text];
}

+ (NSString *)getFinancialStatus:(NSString *)text{
    NSDictionary *dic = @{
                          @"待撮合":@"1",
                          @"交易中":@"2",
                          @"已交易":@"4",
                          @"放弃":@"5",
                          @"转明天":@"7"
                          
                          };
    
    return [Utils getResult:dic text:text];
}


+ (NSString *)getQuoteTimeType:(NSString *)text{
    NSDictionary *dic = @{
                          @"今日":@"1",
                          @"周累计":@"2",
                          @"月累计":@"3",
                          @"年累计":@"4"
                          };
    
    return [Utils getResult:dic text:text];
}

#pragma mark ---- getCode
+(NSString *)getFinancialLevelCode:(NSString *)code{
    NSString *str = @"";
    switch ([code integerValue]) {
        case 1:
            str = @"R1";
            break;
        case 2:
            str = @"R2";
            break;
        case 3:
            str = @"R3";
            break;
        case 4:
            str = @"R4";
            break;
        case 5:
            str = @"R5";
            break;
        case 6:
            str = @"不限";
            break;
        case 7:
            str = @"其他";
            break;
        default:
            break;
    }
    return str;
}

+(NSString *)getFinancialLevelDetailCode:(NSString *)code{
    NSString *str = @"";
    switch ([code integerValue]) {
        case 1:
            str = @"R1(谨慎型)";
            break;
        case 2:
            str = @"R2(稳健型)";
            break;
        case 3:
            str = @"R3(平衡型)";
            break;
        case 4:
            str = @"R4(进取型)";
            break;
        case 5:
            str = @"R5(激进型)";
            break;
        case 6:
            str = @"不限";
            break;
        case 7:
            str = @"其他";
            break;
            
        default:
            break;
    }
    return str;
}


//主体类别
+ (NSString *)getFinancialMainBodyCode:(NSString *)code{
    NSString *str = @"";
    switch ([code integerValue]) {
        case 1:
            str = @"同业理财";
            break;
        case 2:
            str = @"企业理财";
            break;
        default:
            break;
    }
    return str;
}


//本息类别
+(NSString *)getFinancialInterestCode:(NSString *)code{

    NSString *str = @"";
    switch ([code integerValue]) {
        case 1:
            str = @"保本保息";
            break;
        case 2:
            str = @"保本浮息";
            break;
        case 3:
            str = @"浮本浮息";
            break;
        default:
            break;
    }
    return str;
}


//发行方
+ (NSString *)getFinancialIssueTypelCode:(NSString *)code{
    
    NSString *str = @"";
    switch ([code integerValue]) {
        case 1:
            str = @"银行";
            break;
        case 2:
            str = @"基金";
            break;
        case 3:
            str = @"券商";
            break;
        case 4:
            str = @"信托";
            break;
        case 5:
            str = @"保险";
            break;
        case 6:
            str = @"资管";
            break;
        case 7:
            str = @"不限";
            break;
        case 8:
            str = @"国有";
            break;
        case 9:
            str = @"股份";
            break;
        case 10:
            str = @"城商";
            break;
        case 11:
            str = @"外资";
            break;
        case 12:
            str = @"农商";
            break;
        case 13:
            str = @"其他";
            break;
        case 14:
            str = @"民营";
            break;
        default:
            break;
    }
    return str;
}

//标准非标
+(NSString *)getFinancialTypeCode:(NSString *)code{
    
    NSString *str = @"";
    switch ([code integerValue]) {
        case 1:
            str = @"标准";
            break;
        case 2:
            str = @"非标";
            break;
        default:
            break;
    }
    return str;
}

/**1 保息2：保息3：浮息*/
+(NSString *)getFinancialInterestTypeCode:(NSString *)code{
    
    NSString *str = @"";
    switch ([code integerValue]) {
        case 1:
            str = @"保息";
            break;
        case 2:
            str = @"保本";
            break;
        case 3:
            str = @"浮息";
            break;
        default:
            break;
    }
    return str;
}

/**状态：1：待撮合 2：已撮合 3：正在操作 4：已完成 5：已放弃6 撤单 7 转明天*/
+(NSString *)getFinancialStatusByCode:(NSString *)code{
    NSString *str = @"";
    switch ([code integerValue]) {
        case 1:
            str = @"待撮合";
            break;
        case 2:
            str = @"已撮合";
            break;
        case 3:
            str = @"正在操作";
            break;
        case 4:
            str = @"已完成";
            break;
        case 5:
            str = @"已放弃";
            break;
        case 6:
            str = @"撤单";
            break;
        case 7:
            str = @"转明天";
            break;
        default:
            break;
    }
    return str;
}
@end
