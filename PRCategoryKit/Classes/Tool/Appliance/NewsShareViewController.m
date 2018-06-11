//
//  NewsShareViewController.m
//  PurangFinanceVillage-Bank
//
//  Created by wangyilu on 16/2/14.
//  Copyright © 2016年 ___PURANG___. All rights reserved.
//

#import "NewsShareViewController.h"
//#import <TencentOpenAPI/QQApi.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import "WeiboSDK.h"
//#import "WeiboSDK+Statistics.h"
#import "WXApiObject.h"
#import "WXApi.h"

#import "Header.h"
#import "UIColor+HexCode.h"
#import "Utils.h"

@interface NewsShareViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIView *shareView;
@property (weak, nonatomic) IBOutlet UICollectionView *shareCollectionView;

@end

@implementation NewsShareViewController {
    NSArray *titleArray;
    NSArray *imgArray;
    BOOL wxAppInstalled;
    BOOL qqAppInstalled;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    if (self.isShareImage == YES) {
        titleArray = @[@"微信",@"朋友圈",@"QQ",@"QQ空间",@"微博"];
        imgArray = @[@"weixin",@"frenders",@"qq",@"kongjian",@"weibo"];
    }else
    {
        titleArray = @[@"微信",@"朋友圈",@"QQ",@"QQ空间",@"微博",@"复制链接"];
        imgArray = @[@"weixin",@"frenders",@"qq",@"kongjian",@"weibo",@"fuzhilianjie"];
    }
    
    
    
    self.shareCollectionView.delegate = self;
    self.shareCollectionView.dataSource = self;
    
    UITapGestureRecognizer *singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelShareBtnClick:)];
    singleRecognizer.delegate = self;
    singleRecognizer.numberOfTapsRequired = 1; // 单击
    [self.view addGestureRecognizer:singleRecognizer];
    
    wxAppInstalled = [WXApi isWXAppInstalled];
    qqAppInstalled = [QQApiInterface isQQInstalled];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    CGPoint touchPoint = [touch locationInView:self.view];
    return !CGRectContainsPoint(self.shareView.frame, touchPoint);
}

- (IBAction)cancelShareBtnClick:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect newFrame = self.shareView.frame;
        newFrame.origin.y += 304;
        self.shareView.frame = newFrame;
    } completion:^(BOOL finished){
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [titleArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    static NSString* cellId = @"cellId";
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    if (cell == nil)
    {
        cell = [[UICollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    }
    
    UILabel* label = (UILabel*)[cell viewWithTag:3];
    label.text = [titleArray objectAtIndex:row];
    
    UIImageView* imageView = (UIImageView*)[cell viewWithTag:2];
    NSString *imageName = [imgArray objectAtIndex:row];
    if ((row == 2 || row == 3) && !qqAppInstalled) {
        imageName = [NSString stringWithFormat:@"%@-invalid", imageName];
        label.textColor = [UIColor colorFromHexCode:@"dcdcdc"];
    }
    if ((row == 0 || row == 1) && !wxAppInstalled) {
        imageName = [NSString stringWithFormat:@"%@-invalid", imageName];;
        label.textColor = [UIColor colorFromHexCode:@"dcdcdc"];
    }
    imageView.image = [UIImage imageNamed: imageName];
    
    return cell;
}

#pragma mark - collectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    
    if (((row == 0 || row == 1) && !wxAppInstalled) || ((row == 2 || row == 3) && !qqAppInstalled)) {
        return;
    } else {
        NSString *title;
        NSString *desc;
        //分享跳转URL
        NSString *url;
        if (self.dataDic) {
            
            
            if ([self.dataDic[@"isCome"] isEqualToString:@"newsDetailView"]) {
                
                title = self.dataDic[@"title"];
                desc = self.dataDic[@"summary"];
                url = self.shareURL;
                
            }else{
                if (!IsEmpty(self.dataDic[@"desc"])) {
                    
                    desc = self.dataDic[@"desc"];
                    title = [NSString stringWithFormat:@"%@",self.dataDic[@"title"]];
                    url = self.shareURL;
                    
                }else{
                    desc = @"普兰金融村--小讲堂";
                    
                    if (!IsEmpty(self.dataDic[@"shortName"])) {
                        title = [NSString stringWithFormat:@"%@",self.dataDic[@"shortName"]];
                        url = self.shareURL;
                    }else if (!IsEmpty(self.dataDic[@"fullName"])){
                        title = [NSString stringWithFormat:@"%@",self.dataDic[@"fullName"]];
                        url = self.shareURL;
                    }
                }
            }
            
            
            
            
        }else{
            //            title = self.news.title;
            //            desc = self.news.summary;
            //            url = [NSString stringWithFormat:@"%@?id=%@&flag=1",URL_HEAD(URL_NEWSDETAIL),self.news.ID];
        }
        
        
        NSString *previewImageUrl = @"sharelogo-108";
        if (row == 0 || row == 1) {
            
            if (self.isShareImage == YES) {
                WXMediaMessage *mediaMsg = [WXMediaMessage message];
                
                UIImage *thumbnailImage = [Utils compressedImageFiles:self.image imageKB:25];
                
                [mediaMsg setThumbImage:thumbnailImage];
                
                
                WXImageObject *imgObj = [WXImageObject object];
                
                
                NSData *data = UIImagePNGRepresentation(self.image);
                if (data.length/1024.0/1024.0>10.0) {
                    data = [self compressWithMaxLength:8*1024*1024 image:self.image];
                }
                
                imgObj.imageData = data;
                mediaMsg.mediaObject = imgObj;
                
                SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
                req.message = mediaMsg;
                req.bText = NO;
                if (row == 0) {
                    req.scene = WXSceneSession;
                }else{
                    req.scene = WXSceneTimeline;
                }
                
                [WXApi sendReq:req];
            }else{
                WXMediaMessage *message = [WXMediaMessage message];
                message.title = title;
                message.description = desc;
                [message setThumbImage:[UIImage imageNamed:previewImageUrl]];
                WXWebpageObject *object = [WXWebpageObject object];
                object.webpageUrl = url;
                message.mediaObject = object;
                //@"launch";
                SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
                req.bText = NO;
                req.message = message;
                if (row == 0) {
                    req.scene = WXSceneSession;
                }else{
                    req.scene = WXSceneTimeline;
                }
                [WXApi sendReq:req];
                
            }
            
            
            
            
        } else if (row == 2 || row == 3) {
            
            
            if (self.isShareImage == YES) {
                
                NSData * thumbnailDta = [self compressWithMaxLength:1024*1024 image:self.image];
                QQApiImageObject *imgObj = [QQApiImageObject objectWithData:thumbnailDta
                                                           previewImageData:thumbnailDta
                                                                      title:@"title"
                                                               description :@"description"];
                SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:imgObj];
                //将内容分享到qq
                
                if (row == 2) {
                    [QQApiInterface sendReq:req];
                }else{
                    QQApiSendResultCode sent = [QQApiInterface sendReq:req];
                }
                
                
                
            }else{
                UIImage *logoImage = OrigIMG(@"sharelogo-108");
                NSData * imageData = UIImageJPEGRepresentation(logoImage,1);
                QQApiNewsObject *newsObj = [QQApiNewsObject
                                            objectWithURL:[NSURL URLWithString:url]
                                            title: title
                                            description:desc
                                            previewImageData:imageData];
                SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:newsObj];
                //将内容分享到qq
                if (row == 2) {
                    [QQApiInterface sendReq:req];
                }else{
                    [QQApiInterface SendReqToQZone:req];
                }
            }
            
            
            
        }
        
        else if (row==4) {
            
            if (self.isShareImage == YES) {
                [self shareSinaWeiboWithText:@"" image:self.image];
            }else{
                WBAuthorizeRequest *authRequest = [WBAuthorizeRequest request];
                authRequest.redirectURI = kRedirectURI;
                authRequest.scope = @"all";
                
                WBMessageObject *message = [WBMessageObject message];
                WBWebpageObject *webpage = [WBWebpageObject object];
                webpage.objectID = @"identifier1";
                webpage.title = NSLocalizedString(title, nil);
                webpage.description = [NSString stringWithFormat:NSLocalizedString(desc, nil)];
                webpage.thumbnailData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"sharelogo-108" ofType:@"png"]];
                webpage.webpageUrl = url;
                message.mediaObject = webpage;
                NSString *strrrr= [NSString stringWithFormat:@"%@%@",title,url];
                message.text = NSLocalizedString(strrrr, nil);
                WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:message authInfo:authRequest access_token:nil];
                request.userInfo = @{@"ShareMessageFrom": @"普兰金融村",
                                     @"Other_Info_1": [NSNumber numberWithInt:123],
                                     @"Other_Info_2": @[@"obj1", @"obj2"],
                                     @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
                //    request.shouldOpenWeiboAppInstallPageIfNotInstalled = NO;
                [WeiboSDK sendRequest:request];
            }
            
            
            
        } else if (row == 5) {
            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            pasteboard.string = url;
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"复制成功！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:okAction];
            [self presentViewController:alertController animated:YES completion:nil];
        }
    }
}


-(long long) fileSizeAtPath:(NSString*) filePath{
    
    
    NSFileManager* manager = [NSFileManager defaultManager];
    
    
    if ([manager fileExistsAtPath:filePath]){
        
        
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
        
        
    }
    
    
    return 0;
    
    
}

- (void)shareSinaWeiboWithText:(NSString *)text image:(UIImage *)image{
    
    WBMessageObject *message = [WBMessageObject message];
    message.text = text;
    
    // 消息的图片内容中，图片数据不能为空并且大小不能超过10M
    WBImageObject *imageObject = [WBImageObject object];
    imageObject.imageData = UIImageJPEGRepresentation(image, 1.0);
    message.imageObject = imageObject;
    
    WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:message];
    [WeiboSDK sendRequest:request];
    
}



#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(SCREEN_WIDTH/3, 118);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (void)viewDidAppear:(BOOL)animated {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect newFrame = self.shareView.frame;
        newFrame.origin.y -= (304-TabbarSafeBottomMargin);
        self.shareView.frame = newFrame;
    }];
}


- (NSData *)compressWithMaxLength:(NSUInteger)maxLength image:(UIImage *)image{
    // Compress by quality
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(image, compression);
    //NSLog(@"Before compressing quality, image size = %ld KB",data.length/1024);
    if (data.length < maxLength) return data;
    
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(image, compression);
        //NSLog(@"Compression = %.1f", compression);
        //NSLog(@"In compressing quality loop, image size = %ld KB", data.length / 1024);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
    //NSLog(@"After compressing quality, image size = %ld KB", data.length / 1024);
    if (data.length < maxLength) return data;
    UIImage *resultImage = [UIImage imageWithData:data];
    // Compress by size
    NSUInteger lastDataLength = 0;
    while (data.length > maxLength && data.length != lastDataLength) {
        lastDataLength = data.length;
        CGFloat ratio = (CGFloat)maxLength / data.length;
        //NSLog(@"Ratio = %.1f", ratio);
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio))); // Use NSUInteger to prevent white blank
        UIGraphicsBeginImageContext(size);
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        data = UIImageJPEGRepresentation(resultImage, compression);
        //NSLog(@"In compressing size loop, image size = %ld KB", data.length / 1024);
    }
    //NSLog(@"After compressing size loop, image size = %ld KB", data.length / 1024);
    return data;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 状态栏白色
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
