//
//  ViewController.m
//  ReactCocoaTest
//
//  Created by 庞日富 on 2019/5/24.
//  Copyright © 2019 庞日富. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "Myview.h"
#import "MyCell.h"
#import "MVCVC.h"
#import "MVPVC.h"
#import "MVVMViewController.h"
#import "RACVC.h"
#import <Masonry.h>
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (strong, nonatomic) UITableView *tbview;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    self.tbview = [[UITableView alloc] init];
    [self.view addSubview:self.tbview];
    [self.tbview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    self.tbview.dataSource = self;
    self.tbview.delegate = self;
    [self.tbview setTableFooterView:[UIView new]];
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"MVC";
            break;
        case 1:
            cell.textLabel.text = @"MVP";
            break;
        case 2:
            cell.textLabel.text = @"MVVM";
            break;
        case 3:
            cell.textLabel.text = @"ReactivObjc";
            break;
        default:
            break;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        MVCVC *mvc = [MVCVC new];
        [self.navigationController pushViewController:mvc animated:YES];
    }else if (indexPath.row == 1){
        MVPVC *mpc = [MVPVC new];
        [self.navigationController pushViewController:mpc animated:YES];
    }else if (indexPath.row == 2){
        MVVMViewController *mvvmvc = [MVVMViewController new];
        [self.navigationController pushViewController:mvvmvc animated:YES];
    }else if (indexPath.row == 3){
        RACVC *racvc = [RACVC new];
        [self.navigationController pushViewController:racvc animated:YES];
    }
}


@end
