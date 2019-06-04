//
//  Present.h
//  003--MVP
//
//  Created by Cooci on 2018/4/1.
//  Copyright © 2018年 Cooci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"
#import <YYKit.h>
#import "PresentDalegate.h"

@interface Present : NSObject<PresentDelegate>
@property (nonatomic, strong) NSMutableArray *dataArray;

//将获取数据的方法独立到工具类里面
+ (NSMutableArray *)loadDatas;

@property (nonatomic, weak) id<PresentDelegate> delegate;

@end
