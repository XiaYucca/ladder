//
//  HomeViewViewController.m
//  Ladder
//
//  Created by Rain on 2018/7/11.
//  Copyright © 2018年 Aofei Sheng. All rights reserved.
//

//获取导航栏+状态栏的高度
#define getRectNavAndStatusHight  self.navigationController.navigationBar.frame.size.height

#import "HomeViewViewController.h"
#import "Ladder-Swift.h"
#import "TabBarViewController.h"
#import "SelectionLineViewController.h"
//#import <NEKit/NEKit-iOS.h>
//#import <NEKit/NEKit-Swift.h>
//#import <NEKit_iOS/PublicHeader.h>

@interface HomeViewViewController ()

@end

@implementation HomeViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog (@"%@",[UIApplication sharedApplication].keyWindow);
//
//    UINavigationBar *navigationBar = self.navigationController.navigationBar;
//    //bar 透明
//    [navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//
//    //去掉 bar 下面有一条黑色的线
//    [navigationBar setShadowImage:[UIImage new]];
//
//     [self.navigationController setNavigationBarHidden:YES animated:YES];
    
//    self.navigationController.navigationBarHidden = NO;
//    //设置背景透明图片
//    UINavigationController *navigationC = self.navigationController;
//    UINavigationBar *navigationBar = self.navigationController.navigationBar;
//    //bar 透明
//    [navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//
//    //去掉 bar 下面有一条黑色的线
//    [navigationBar setShadowImage:[UIImage new]];
    
      [self.navigationController setNavigationBarHidden:YES animated:YES];
    
   CGFloat navH = getRectNavAndStatusHight;  
    NSLog(@"%lf",navH);
}

-(void)viewWillAppear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    

    // Dispose of any resources that can be recreated.
}


-(IBAction)btnClick:(id)sender
{
    ViewController *tabVC = [[ViewController alloc]init];
    [self.navigationController pushViewController:tabVC animated:YES];
   // [UIApplication sharedApplication].delegate.window.rootViewController = tabVC;
}

-(IBAction)selectLineClick:(id)sender
{
    SelectionLineViewController *selCV = [[SelectionLineViewController alloc]init];
    [self.navigationController pushViewController:selCV animated:YES];
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
