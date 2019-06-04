//
//  MVVMViewController.m
//  003--MVP
//
//  Created by chriseleee on 2018/8/29.
//  Copyright © 2018年 Cooci. All rights reserved.
//

#import "MVVMViewController.h"
#import "LMDataSource.h"
#import "MVVMCell.h"
#import "Model.h"
#import "MVVMViewModel.h"

static NSString *const reuserId = @"reuserId";

@interface MVVMViewController ()<UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) MVVMViewModel *vm;
@property (nonatomic, strong) LMDataSource *dataSource;


@end

@implementation MVVMViewController

#pragma mark lazy
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[MVVMCell class] forCellReuseIdentifier:reuserId];
        [_tableView setTableFooterView:[UIView new]];
    }
    return _tableView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    __weak __typeof(self) weakSelf = self;
    
    self.dataSource = [[LMDataSource alloc] initWithIdentifier:reuserId configureBlock:^(MVVMCell *cell, Model *model, NSIndexPath *indexPath) {
        cell.nameLabel.text = model.name;
        cell.numLabel.text  = model.num;
        cell.num = [model.num intValue];
        cell.indexPath      = indexPath;
        cell.delegate       = weakSelf.vm;
    } selectBlock:^(NSIndexPath *indexPath) {
        NSLog(@"点击了%ld行cell", (long)indexPath.row);
    } reloadData:^(NSMutableArray *array) {
        weakSelf.vm.dataArray = array;
    }];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.dataSource;
    

    self.vm = [[MVVMViewModel alloc]init];
    [self.vm initWithBlock:^(id data) {
        weakSelf.dataSource.dataArray = [weakSelf.vm.dataArray mutableCopy];
        [weakSelf.tableView reloadData];
        weakSelf.title = [NSString stringWithFormat:@"总数%d",[weakSelf.vm total]];
    } fail:nil];
    //加载数据
    [self.vm loadData];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"刷新" style:(UIBarButtonItemStyleDone) target:self action:@selector(datasAdd)];

}

-(void)datasAdd{
    
    [self.vm refreshArray];
    
}

-(void)dealloc{
    NSLog(@"dealloc--%@",self);
}



@end
