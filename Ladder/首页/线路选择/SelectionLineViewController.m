//
//  SelectionLineViewController.m
//  Ladder
//
//  Created by Rain on 2018/7/13.
//  Copyright © 2018年 Aofei Sheng. All rights reserved.
//

#import "SelectionLineViewController.h"
#import "SelectionLineTableViewCell.h"
#import "WHPingTester.h"

@interface NetPingMode:NSObject

@property (nonatomic ,copy) NSString *hostName;
@property (nonatomic ,copy) NSString *pingMs;
@property (nonatomic ,assign)BOOL isNotAvalible;

@end

@implementation NetPingMode
@end


@interface SelectionLineViewController ()<UITableViewDelegate,UITableViewDataSource,WHPingDelegate>

@property(nonatomic, strong) WHPingTester* pingTester;

@property (nonatomic ,strong)NSMutableArray *dataList;

@property (nonatomic ,weak) NetPingMode *currentModel;

@end

@implementation SelectionLineViewController
{
    dispatch_semaphore_t semaphore;
    int currentModeIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SelectionLineTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"SelectionLineTableViewCell"];
    
    [self testData];
  
    [self testPing];
    


}

-(NSArray *)dataList
{
    if (!_dataList) {
        _dataList = [@[]mutableCopy];
    }
    return _dataList;
}

-(void)testData
{
    NetPingMode *mode = [[NetPingMode alloc]init];
    mode.hostName =@"www.baidu.com";
    [self.dataList addObject:mode];
    
    NetPingMode *mode1 = [[NetPingMode alloc]init];
    mode1.hostName =@"www.sina.com";
    [self.dataList addObject:mode1];
    
    NetPingMode *mode2 = [[NetPingMode alloc]init];
    mode2.hostName =@"www.google.com";
    [self.dataList addObject:mode2];
}

-(void)testPing
{
    semaphore = dispatch_semaphore_create(0);
    dispatch_queue_t quene = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
//    self.pingTester = [[WHPingTester alloc] initWithHostName:@"www.baidu.com"];//@"18.218.166.190" //
//    self.pingTester.delegate = self;
    //任务1
    dispatch_async(quene, ^{
        for (NetPingMode *model in self.dataList) {
            NSLog(@"start ping");
            dispatch_async(dispatch_get_main_queue(), ^{
                _currentModel = model;
                //[self.pingTester.simplePing stop];
                self.pingTester = [[WHPingTester alloc] initWithHostName:model.hostName];//@"18.218.166.190" //
                self.pingTester.delegate = self;
                [self.pingTester startPing];

            });
            dispatch_semaphore_wait(self->semaphore, DISPATCH_TIME_FOREVER);
        }

    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SelectionLineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SelectionLineTableViewCell" forIndexPath:indexPath];
    NetPingMode *model = self.dataList[indexPath.row];
    cell.titleLabel.text = model.hostName;
    if (model.pingMs.length) {
        cell.pingLabel.text = model.pingMs;
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}



#pragma mark ping的回调
- (void) didPingSucccessWithTime:(float)time withError:(NSError *)error
{
    if(error){
        NSLog(@"%@网络有问题",_currentModel.hostName);
        _currentModel.pingMs = @">1000ms";
    }else{
       NSString *pingStr = [[NSString stringWithFormat:@"%d", (int)time] stringByAppendingString:@"ms"];
        NSLog(@"%@ ping:%@",_currentModel.hostName,pingStr);
        _currentModel.pingMs = pingStr;
    }
    [self.tableView reloadData];
    [self.pingTester stopPing];
    dispatch_semaphore_signal(semaphore);
    
}

-(IBAction)backBtnClick:(id)sender
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
