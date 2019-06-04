//
//  MVPVC.m
//  ReactCocoaTest
//
//  Created by 庞日富 on 2019/5/29.
//  Copyright © 2019 庞日富. All rights reserved.
//

#import "MVPVC.h"
#import "LMDataSource.h"
#import "MyCell.h"
#import "Model.h"
#import <YYKit.h>
#import "Present.h"
#import <Masonry.h>
@interface MVPVC ()<PresentDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic, strong) Present *pt;
@property (nonatomic, strong) LMDataSource *dataSource;

@end

static NSString *cellKey = @"mycell";


@implementation MVPVC

/**
 1: 解耦
 2: 解重 : nsobject
 -| 中介
 -| 封装
 
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pt = [[Present alloc] init];
    __weak typeof(self) weakSelf = self;
    self.dataSource = [[LMDataSource alloc] initWithIdentifier:cellKey configureBlock:^(MyCell *cell, Model *model, NSIndexPath *indexPath) {
        // 函数式编程
        // RAC 编程思想之集大成者
        cell.nameLabel.text = model.name;
        cell.numLabel.text  = model.num;
        cell.indexPath      = indexPath;
        cell.delegate       = weakSelf.pt;
    } selectBlock:^(NSIndexPath *indexPath) {
        NSLog(@"点击了%ld行cell", (long)indexPath.row);
    }];
    [self.dataSource addDataArray:self.pt.dataArray];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.dataSource;
    self.pt.delegate          = self;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[MyCell class] forCellReuseIdentifier:cellKey];
    }
    return _tableView;
}


#pragma mark - PresentDelegate
- (void)reloadDataForUI{
    [self.dataSource addDataArray:self.pt.dataArray];
    [self.tableView reloadData];
}



@end
