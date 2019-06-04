//
//  MVCVC.m
//  ReactCocoaTest
//
//  Created by 庞日富 on 2019/5/29.
//  Copyright © 2019 庞日富. All rights reserved.
//

#import "MVCVC.h"
#import "LMDataSource.h"
#import "MyCell.h"
#import "Model.h"
#import <YYKit.h>
#import "Present.h"
#import <Masonry.h>



@interface MVCVC ()<PresentDelegate>


@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) LMDataSource *dataSource;

//@property (strong, nonatomic) Present *pt;

@end

static NSString *const reuserId = @"reuserId";

@implementation MVCVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MVC";
    
    self.dataArray = [Present loadDatas];
    
    __weak __typeof(self) weakSelf = self;
    
    self.dataSource = [[LMDataSource alloc] initWithIdentifier:reuserId configureBlock:^(MyCell *cell, Model *model, NSIndexPath *indexPath) {
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        cell.delegate = strongSelf;
        cell.indexPath = indexPath;
        cell.nameLabel.text = model.name;
        cell.numLabel.text  = model.num;
        cell.num = [model.num intValue];
    } selectBlock:^(NSIndexPath *indexPath) {
        NSLog(@"点击了%ld行cell", (long)indexPath.row);
    }];
    
    [self.dataSource addDataArray:self.dataArray];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.dataSource;
    

}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[MyCell class] forCellReuseIdentifier:reuserId];
        [_tableView setTableFooterView:[UIView new]];
    }
    return _tableView;
}

-(void)didClickAddBtnWithNum:(NSString *)num indexPath:(NSIndexPath *)indexPath{
    @synchronized (self.dataArray) {
        if (indexPath.row < self.dataArray.count) {
            Model *m = self.dataArray[indexPath.row];
            m.num = num;
        }
    }
}

- (void)reloadDataForUI{
    [self.dataSource addDataArray:self.dataArray];
    [self.tableView reloadData];
}

-(void)dealloc{
    NSLog(@"dealloc----%@",self);
}
@end
