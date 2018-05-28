//
//  PFVNoteDicMgr.m
//  PurangFinanceVillage
//
//  Created by daichen on 2017/8/16.
//  Copyright © 2017年 ___PURANG___. All rights reserved.
//

#import "PFVNoteDicMgr.h"
#import "Utils.h"
#import "Header.h"

@implementation PFVNoteDicMgr


+(NSString *)getNoteDirection:(NSString *)text{
    NSDictionary *dic = @{
                          @"卖出":@"1",
                          @"买入":@"2"
                          };
    return [Utils getResult:dic text:text];
}

+ (NSString *)getStraightBankName:(NSString *)text{
    NSDictionary *dic = @{
                          @"国有":@"3010",
                          @"股份":@"3015",
                          @"城商":@"3020",
                          @"农商":@"3030",
                          @"农信":@"3035",
                          @"农合":@"3036",
                          @"外资":@"3040",
                          @"村镇":@"3045",
                          @"财务":@"3046",
                          @"无":@"3050",
                          @"保兑":@"3060",
                          @"保贴":@"3065",
                          @"其他":@"3070"};
    
    return [Utils getResult:dic text:text];
}

+ (NSString *)getStraightBankNameCode:(NSString *)text{

    NSDictionary *dic = @{
                          @"3010":@"国有",
                          @"3015":@"股份",
                          @"3020":@"城商",
                          @"3030":@"农商",
                          @"3035":@"农信",
                          @"3036":@"农合",
                          @"3040":@"外资",
                          @"3045":@"村镇",
                          @"3046":@"财务",
                          @"3050":@"无",
                          @"3060":@"保兑",
                          @"3065":@"保贴",
                          @"3070":@"其他"
                          };
    
    return [Utils getResult:dic text:text];
}

#pragma mark ----- 转贴
+ (NSString *)getQuoteNoteTypeCodeByName:(NSString *)text{
    if ([text containsString:@"银票"]) {
        if ([text containsString:@"纸票"]) {
            return @"1";
        }else{
            return @"2";
        }
    }else if ([text containsString:@"商票"]){
        if ([text containsString:@"纸票"]) {
            return @"3";
        }else{
            return @"4";
        }
    }else{
        if ([text containsString:@"纸"]) {
            return @"5";
        }else{
            return @"6";
        }
    }
}

+ (NSString *)getQuoteBankName:(NSString *)text{
    NSDictionary *dic = @{@"国有":@"3010",
                          @"股份":@"3015",
                          @"城商":@"3020",
                          @"农商":@"3030",
                          @"农信":@"3035",
                          @"农合":@"3036",
                          @"外资":@"3040",
                          @"村镇":@"3045",
                          @"无保兑":@"3050",
                          @"财务":@"3046",
                          @"国股行背书":@"3055",
                          @"国股行保兑":@"3060",
                          @"其他":@"3070",
                          @"不限":@"3080",
                          @"保兑":@"3081",
                          @"保贴":@"3082",
                          @"无":@"3083"
                          };
    return [Utils getResult:dic text:text];
}

+ (NSString *)getQuoteBankNameCode:(NSString *)text{
    NSDictionary *dic = @{
                          @"3010":@"国有",
                          @"3015":@"股份",
                          @"3020":@"城商",
                          @"3030":@"农商",
                          @"3035":@"农信",
                          @"3036":@"农合",
                          @"3040":@"外资",
                          @"3045":@"村镇",
                          @"3046":@"财务",
                          @"3055":@"国股行背书",
                          @"3060":@"国股行保兑",
                          @"3050":@"无保兑",
                          @"3070":@"其他",
                          @"3080":@"不限",
                          @"3081":@"保兑",
                          @"3082":@"保贴",
                          @"3083":@"无"
                          };
    return [Utils getResult:dic text:text];
}

//直贴票据期限 隔夜->0
+ (NSString *)getStraightLimitDay:(NSString *)text{
    //@[@"1年",@"9月",@"6月",@"3月",@"1月",@"14天",@"7天",@"隔夜"]
    NSDictionary *dic = @{
                          @"隔夜":@"0",
                          @"7天":@"7",
                          @"14天":@"14",
                          @"1月":@"1",
                          @"3月":@"3",
                          @"6月":@"6",
                          @"9月":@"9",
                          @"1年":@"12"
                          };
    return [Utils getResult:dic text:text];
}

//直贴票据期限 1月->1F
+ (NSString *)getEBALimitDay:(NSString *)text{
    NSDictionary *dic = @{
                          @"1月":@"1F",
                          @"3月":@"3",
                          @"6月":@"6",
                          @"9月":@"9",
                          @"1年":@"12"
                          };
    return [Utils getResult:dic text:text];
}

//空->表示全部待撮合->1；交易中：2；已交易：3；未交易：4(保留兼容老版本)；转明天：5；放弃：6
+ (NSString *)getBillSearchStatusByName:(NSString *)text{
    NSDictionary *dic = @{
                          @"待撮合":@"1",
                          @"交易中":@"2",
                          @"已交易":@"3",
                          @"未交易":@"4",
                          @"转明天":@"5",
                          @"放弃":@"6"
                          };
    return [Utils getResult:dic text:text];
}

/**交易日，必填项 String  0: 当天 1: 当月 2: 当年*/
+ (NSString *)getBillDateTypeByName:(NSString *)text{
    NSDictionary *dic = @{
                          @"今日":@"0",
                          @"本月":@"1",
                          @"本年":@"2"
                          };
    return [Utils getResult:dic text:text];
}

#pragma mark ---- 转贴
/**转贴 银票 1001 商票 1002*/
+ (NSString *)getQuoteBillTypeCodeByName:(NSString *)text{
    NSDictionary *dic = @{
                          @"银票":@"1001",
                          @"商票":@"1002"
                          };
    return [Utils getResult:dic text:text];
}
+(NSString *)getQuoteDirection:(NSString *)text{
    NSDictionary *dic = @{
                          @"买入":@"2001",
                          @"卖出":@"2002"
                          };
    return [Utils getResult:dic text:text];
}

+(NSString *)getQuoteDirectionOfBS:(NSString *)text{
    NSDictionary *dic = @{
                          @"买入":@"b",
                          @"卖出":@"s"
                          };
    return [Utils getResult:dic text:text];
}

+(NSString *)getQuoteQuotationDirection:(NSString *)text{
    NSDictionary *dic = @{
                          @"买入":@"0",
                          @"卖出":@"1"
                          };
    return [Utils getResult:dic text:text];
}



//转票据期限 隔夜->0
+ (NSString *)getQuoteLimitDay:(NSString *)text{
    //@[@"1年",@"9月",@"6月",@"3月",@"1月",@"14天",@"7天",@"隔夜"]
    NSDictionary *dic = @{
                          @"隔夜":@"0",
                          @"7天":@"7",
                          @"14天":@"14",
                          @"1月":@"1",
                          @"2月":@"2",
                          @"3月":@"3",
                          @"4月":@"4",
                          @"5月":@"5",
                          @"6月":@"6",
                          @"9月":@"9",
                          @"1年":@"12"
                          };
    return [Utils getResult:dic text:text];
}


+ (NSString *)getTradeModeCodeByName:(NSString *)text{
    NSDictionary *dic = @{
                          @"买断":@"1001",
                          @"卖断":@"1002",
                          @"正回购":@"1003",
                          @"逆回购":@"1004",
                          @"回买":@"1005",
                          @"回卖":@"1006"};
    
    return [Utils getResult:dic text:text];
}

+ (NSString *)getTradeModeNameByCode:(NSString *)text{
    NSDictionary *dic = @{
                          @"1001":@"买断",
                          @"1002":@"卖断",
                          @"1003":@"正回购",
                          @"1004":@"逆回购",
                          @"1005":@"回买",
                          @"1006":@"回卖"};
    
    return [Utils getResult:dic text:text];
}

+ (NSString *)getPayWayNameByCode:(NSString *)text{
    NSDictionary *dic = @{
                          @"1001":@"线上",
                          @"1002":@"线下"
                          };
    return [Utils getResult:dic text:text];
}

//空 表示全部；传Code "1"==待撮合 "2"==交易中 "3"==已交易 "4"==放弃 "5"==转明天
+ (NSString *)getQuoteBillSearchStatusByName:(NSString *)text{
    NSDictionary *dic = @{
                          @"待撮合":@"1",
                          @"交易中":@"2",
                          @"已交易":@"3",
                          @"放弃":@"4",
                          @"转明天":@"5"
                          };
    return [Utils getResult:dic text:text];
}
@end
