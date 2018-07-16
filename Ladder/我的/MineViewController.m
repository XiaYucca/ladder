//
//  MineViewController.m
//  Ladder
//
//  Created by Rain on 2018/7/12.
//  Copyright © 2018年 Aofei Sheng. All rights reserved.
//

#import "MineViewController.h"
#import "PayConfirmViewController.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong)NSArray *tableData;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.tableView.sectionHeaderHeight = 10;
}

-(NSArray *)tableData
{
    if (!_tableData) {
        _tableData = @[
                       @[
                           @{@"icon":@"wd_icon_czjl",@"title":@"充值记录"},
                           @{@"icon":@"wd_icon_rjxz",@"title":@"软件下载"},
                           @{@"icon":@"wd_icon_fx",@"title":@"分享"}
                         ],
                       
                        @[
                           @{@"icon":@"wd_icon_xgmm",@"title":@"修改密码"},

                        ],
                       @[
                           @{@"icon":@"wd_icon_zxkf",@"title":@"在线客服"},
                           @{@"icon":@"wd_icon_gywm",@"title":@"关于我们"}
                           ]
                       ];
    }
    return _tableData;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.tableData.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray *)(self.tableData[section])).count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = ((NSArray *)self.tableData[indexPath.section])[indexPath.row];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"systemCell"];
    cell.imageView.image = [UIImage imageNamed:dic[@"icon"]];
    cell.textLabel.text = dic[@"title"];
    cell.showsReorderControl = YES;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
  //  cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 10;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)payBtnClick:(id)sender
{
    [self.navigationController pushViewController:[[PayConfirmViewController alloc]init] animated:YES];
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
