//
//  NewsShareViewController.h
//  PurangFinanceVillage-Bank
//
//  Created by wangyilu on 16/2/14.
//  Copyright © 2016年 ___PURANG___. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "NewsEntity.h"

@interface NewsShareViewController : UIViewController

//@property (nonatomic, strong) NewsEntity *news;

@property (nonatomic,strong) NSDictionary * dataDic;
@property (strong, nonatomic) NSString *shareURL;
@property (strong, nonatomic) UIImage *image;
@property (assign, nonatomic) BOOL isShareImage;

@end
