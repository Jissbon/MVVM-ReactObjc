//
//  MVVMViewModel.m
//  003--MVP
//
//  Created by chriseleee on 2018/8/29.
//  Copyright © 2018年 Cooci. All rights reserved.
//

#import "MVVMViewModel.h"
#import "Model.h"
#import <YYKit.h>
#import <ReactiveObjC.h>
@implementation MVVMViewModel

#pragma mark - lazy

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:2];
        
    }
    return _dataArray;
}


- (instancetype)init{
    if (self==[super init]) {
        
        //KVO
//        [self addObserver:self forKeyPath:@"dataArray" options:(NSKeyValueObservingOptionNew) context:nil];
        
        __weak typeof(self) weakself = self;
        [RACObserve(self, dataArray) subscribeNext:^(id  _Nullable x) {
            @synchronized (weakself.dataArray) {
                if (weakself.successBlock &&  x) {
                    NSLog(@"x的值:%@",x);
                    weakself.successBlock(x);
                }
            }
        }];
    }
    return self;
}

//#pragma mark KVO
//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
//    self.successBlock(change[NSKeyValueChangeNewKey]);
//}

//-(void)dealloc{
//    [self removeObserver:self forKeyPath:@"dataArray"];
//
//}

/**
 数组发生变化
 */
-(void)refreshArray{
    
    
    NSArray *temArray = @[
  @{@"name":@"火车",@"imageUrl":@"http://CC",@"num":@"1"},
  @{@"name":@"飞机",@"imageUrl":@"http://CC",@"num":@"1"},
  @{@"name":@"轮船",@"imageUrl":@"http://CC",@"num":@"1"},
  @{@"name":@"高铁",@"imageUrl":@"http://CC",@"num":@"1"},
  @{@"name":@"火箭",@"imageUrl":@"http://CC",@"num":@"1"},
  @{@"name":@"单车",@"imageUrl":@"http://CC",@"num":@"1"},
  @{@"name":@"汽车",@"imageUrl":@"http://CC",@"num":@"1"}];
    NSMutableArray *mArray = [NSMutableArray new];
    for (NSDictionary *dic in temArray) {
        Model *m = [Model modelWithDictionary:dic];
        [mArray addObject:m];
    }
    @synchronized (self.dataArray) {
        self.dataArray = mArray;
    }
}







-(void)loadData{
    

    //2.异步执行任务
    dispatch_async(dispatch_queue_create(0, 0), ^{
        
        [NSThread sleepForTimeInterval:1];
        NSArray *temArray = @[
  @{@"name":@"火车",@"imageUrl":@"http://CC",@"num":@"1"},
  @{@"name":@"飞机",@"imageUrl":@"http://CC",@"num":@"2"}];
        [self.dataArray removeAllObjects];
        for (int i = 0; i<temArray.count; i++) {
            Model *m = [Model modelWithDictionary:temArray[i]];
            [self.dataArray addObject:m];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            // main更新代码
            self.successBlock(self.dataArray);
        });
    });
}



#pragma mark - PresentDelegate
- (void)didClickAddBtnWithNum:(NSString *)num indexPath:(NSIndexPath *)indexPath{
    
    @synchronized (self.dataArray) {
        if (indexPath.row < self.dataArray.count) {
            Model *m = self.dataArray[indexPath.row];
            m.num  = num;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.successBlock(self.dataArray);
        });
    }
}

-(int)total{
    int total = 0;
    for (Model* dic in self.dataArray) {
        int num = [dic.num intValue];
        total += num;
    }
    return total;
}
@end
