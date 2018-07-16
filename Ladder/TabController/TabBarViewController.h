//
//  TabBarViewController.h
//  Ladder
//
//  Created by Rain on 2018/7/12.
//  Copyright © 2018年 Aofei Sheng. All rights reserved.
//

//随机色xitong
#define RGBACOLORS(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define APPColor(color) [UIColor colorFromHexString:color]
#define MAINCOLOR [UIColor colorWithRed:(15)/255.0f green:(9)/255.0f blue:(207)/255.0f alpha:(1)]

#define DEVICE_UUID [[UIDevice currentDevice].identifierForVendor UUIDString]

#define KIsiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define WIDTH [[UIScreen mainScreen] bounds].size.width
#define HEIGHT [[UIScreen mainScreen] bounds].size.height
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#import "CYTabBarController.h"

@interface TabBarViewController : CYTabBarController

@end
