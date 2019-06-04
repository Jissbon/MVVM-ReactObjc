//
//  Present.m
//  003--MVP
//
//  Created by Cooci on 2018/4/1.
//  Copyright © 2018年 Cooci. All rights reserved.
//

#import "Present.h"

@implementation Present

- (instancetype)init{
    if (self = [super init]) {
        [self loadData];
    }
    return self;
}



- (void)loadData{
    
    self.dataArray = [Present loadDatas];
}

+ (NSMutableArray *)loadDatas{
    
    NSArray *temArray =
    @[
      @{@"name":@"prf1",@"imageUrl":@"http://CC",@"num":@"9"},
      @{@"name":@"prf2",@"imageUrl":@"http://James",@"num":@"9"},
      @{@"name":@"prf3",@"imageUrl":@"http://Gavin",@"num":@"9"},
      @{@"name":@"prf4",@"imageUrl":@"http://Cooci",@"num":@"9"},
      @{@"name":@"prf5",@"imageUrl":@"http://Dean ",@"num":@"9"},
      @{@"name":@"prf6",@"imageUrl":@"http://CC",@"num":@"9"},
      @{@"name":@"prf7",@"imageUrl":@"http://James",@"num":@"9"},
      @{@"name":@"prf8",@"imageUrl":@"http://Gavin",@"num":@"9"},
      @{@"name":@"prf9",@"imageUrl":@"http://Cooci",@"num":@"9"},
      @{@"name":@"prf10",@"imageUrl":@"http://CC",@"num":@"9"},
      @{@"name":@"prf11",@"imageUrl":@"http://James",@"num":@"9"},
      @{@"name":@"prf12",@"imageUrl":@"http://Gavin",@"num":@"9"},
      @{@"name":@"prf13",@"imageUrl":@"http://Cooci",@"num":@"9"},
      @{@"name":@"prf14",@"imageUrl":@"http://CC",@"num":@"9"},
      @{@"name":@"prf15",@"imageUrl":@"http://James",@"num":@"9"},
      @{@"name":@"prf16",@"imageUrl":@"http://Gavin",@"num":@"9"},
      @{@"name":@"prf17",@"imageUrl":@"http://Cooci",@"num":@"9"},
      @{@"name":@"prf18",@"imageUrl":@"http://Dean ",@"num":@"9"}];
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i<temArray.count; i++) {
        Model *m = [Model modelWithDictionary:temArray[i]];
        [array addObject:m];
    }
    return array;
}

#pragma mark - lazy

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataArray;
}


#pragma mark - PresentDelegate
- (void)didClickAddBtnWithNum:(NSString *)num indexPath:(NSIndexPath *)indexPath{

    if (self.dataArray.count > indexPath.row) {
        Model *m = self.dataArray[indexPath.row];
        m.num = num;
    }
    
}


@end
