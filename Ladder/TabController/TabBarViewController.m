//
//  TabBarViewController.m
//  Ladder
//
//  Created by Rain on 2018/7/12.
//  Copyright © 2018年 Aofei Sheng. All rights reserved.
//

#import "TabBarViewController.h"
#import "HomeViewViewController.h"
#import "MoreViewViewController.h"
#import "MineViewController.h"
#import "Ladder-Swift.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController


- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initControllers];
   // [self setUI];
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
//    self.title = NSLocalizedString(@"title.conversation", @"Conversations");
    self.selectedIndex = 0;
}

-(void)setUI{
//    HomeViewViewController * homeVC     = [[HomeViewViewController alloc]init];
//    homeVC.title     = @"首页";
//    [self addChildController:homeVC title:@"首页" imageName:@"biao_icon" selectedImageName:nil];
    
    ViewController * homeVC     = [[ViewController alloc]init];
    homeVC.title     = @"首页";
    
    [self addChildController:homeVC title:@"首页" imageName:@"icon_sy_wxz" selectedImageName:@"icon_sy_xz"];

}

#pragma mark - 如果想添加控制器到tabbar里面在这里面实例化就行
- (void)initControllers
{
    HomeViewViewController * homeVC     = [[HomeViewViewController alloc]init];
    homeVC.title     = @"首页";
    
    MoreViewViewController *moreVC = [[MoreViewViewController alloc]init];
    moreVC.title = @"更多";
    
    MineViewController *mineVC = [[MineViewController alloc]init];
    mineVC.title = @"我的";

    NSArray *viewController=@[homeVC,moreVC,mineVC];
    NSArray * normImage = @[@"icon_sy_wxz",@"icon_gd_wxz",@"wd_wxz"];
    NSArray * selectImage = @[@"icon_sy_xz",@"icon_gd_xz",@"wd_xz"];
    
    NSMutableArray *navArrs=[NSMutableArray arrayWithCapacity:0];
    int i=0;
    for (UIViewController *addView in viewController) {
        
        CGSize imageSize = CGSizeMake(WIDTH, 64);
        UIGraphicsBeginImageContext(imageSize);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [MAINCOLOR CGColor]);
        CGContextFillRect(context, CGRectMake(0, 0, WIDTH, 64));
        UIGraphicsEndImageContext();
        
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:addView];
        nav.navigationBar.barTintColor=MAINCOLOR;
        nav.navigationBar.translucent = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
        [nav.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:21],NSForegroundColorAttributeName:[UIColor whiteColor]}];
        nav.tabBarItem.image=[UIImage imageNamed:normImage[i]];
        
        
#warning 修改
        [self addChildController:nav title:((UIViewController *)viewController[i]).title imageName:normImage[i] selectedImageName:selectImage[i]];
        
        [navArrs addObject:nav];
        i++;

        self.tabBarController.tabBar.backgroundColor = [UIColor clearColor];
        self.tabBarController.tabBar.selectionIndicatorImage = nil;
        
    }
    [[UITabBar appearance] setBarTintColor:RGBACOLORS(0, 0, 0, 1)];
    [self.tabBar setTintColor:RGBACOLORS(240, 65, 116, 1)];
    [[UITabBarItem appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,nil]forState:UIControlStateNormal];
    
    [[UITabBarItem appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGBACOLORS(240, 65, 116, 1),UITextAttributeTextColor,nil]forState:UIControlStateSelected];
    
//    DJVideoViewController *centerVC = [[DJVideoViewController alloc]init];
    
#warning 修改
    //    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:centerVC];
    //    nav.navigationBar.barTintColor=MAINCOLOR;
    //    nav.navigationBar.translucent = NO;
    //    self.edgesForExtendedLayout = UIRectEdgeNone;
    //    [nav.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:17],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
//    [self addCenterController:centerVC bulge:NO title:nil imageName:@"tabbar-center" selectedImageName:nil];
 //   self.selectedIndex = 0;
    
    self.tabBar.backgroundColor = MAINCOLOR;//[UIColor blackColor];
#warning 还原
    //   self.viewControllers=navArrs;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
