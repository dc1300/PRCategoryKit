#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "Header.h"
#import "CALayer+LayerColor.h"
#import "EmojiDelegate.h"
#import "LCDStringContainsEmoji.h"
#import "NSArray+Sort.h"
#import "NSAttributedString+Extensions.h"
#import "NSCalendar+PRCalender.h"
#import "NSDate+Extensions.h"
#import "NSDate+Helper.h"
#import "NSMutableDictionary+URL.h"
#import "NSNumberFormatter+Currency.h"
#import "NSString+Check.h"
#import "NSString+Currency.h"
#import "NSString+Emoji.h"
#import "NSString+Extensions.h"
#import "NSString+MD5.h"
#import "NSURL+PRUrl.h"
#import "UIButton+EdgeInsets.h"
#import "UIButton+PFVButton.h"
#import "UIButton+Touch.h"
#import "UIColor+HexCode.h"
#import "UIDevice+UIDeviceCategory.h"
#import "UIFont+PFVCommon.h"
#import "UIImage+Image.h"
#import "UIImage+Resolution.h"
#import "UILabel+PFVAlignment.h"
#import "UISearchBar+JCSearchBarPlaceholder.h"
#import "UITextField+ExtentRange.h"
#import "UITextView+PlaceHolder.h"
#import "UIView+ACExtension.h"
#import "UIView+Frame.h"
#import "UIViewController+DCPOP.h"
#import "UIViewController+Utils.h"
#import "SSKeychain.h"
#import "DateUtil.h"
#import "PFVDictionaryMgr.h"
#import "PFVFinancialDicMgr.h"
#import "PFVNoteDicMgr.h"
#import "UIView+PFVViewUtils.h"
#import "UIViewExt.h"
#import "Utils.h"
#import "WeakScriptMessageDelegate.h"
#import "BXTextField.h"
#import "JKCountDownButton.h"
#import "MBProgressHUD+XWAdd.h"
#import "MBProgressHUD.h"
#import "NSString+XWKit.h"
#import "PFIdCardField.h"
#import "UIBarButtonItem+Item.h"
#import "UITextField+BXExtension.h"
#import "UIView+BXExtension.h"
#import "UIView+ZJFrame.h"
#import "UIViewController+ZJScrollPageController.h"
#import "XWAlertViewController.h"
#import "XWMatching.h"
#import "ZJCollectionView.h"
#import "ZJContentView.h"
#import "ZJScrollPageView.h"
#import "ZJScrollPageViewDelegate.h"
#import "ZJScrollSegmentView.h"
#import "ZJSegmentStyle.h"
#import "ZJTitleView.h"

FOUNDATION_EXPORT double PRCategoryKitVersionNumber;
FOUNDATION_EXPORT const unsigned char PRCategoryKitVersionString[];

