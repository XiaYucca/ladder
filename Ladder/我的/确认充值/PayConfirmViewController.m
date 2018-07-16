//
//  PayConfirmViewController.m
//  Ladder
//
//  Created by Rain on 2018/7/13.
//  Copyright © 2018年 Aofei Sheng. All rights reserved.
//

#import "PayConfirmViewController.h"

@interface PayConfirmViewController ()

@end

@implementation PayConfirmViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.comfirmBtn.layer.cornerRadius = 22;
    self.comfirmBtn.layer.masksToBounds = YES;
    self.title = @"确认充值";
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc] init];
    back.title = @"";
    self.navigationController.navigationItem.backBarButtonItem = back;
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_back_white"] style:UIBarButtonItemStylePlain target:self action:@selector(leftItemClick:)];
    left.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = left;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(void)leftItemClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
