//
//  Person.m
//  ReactCocoaTest
//
//  Created by 庞日富 on 2019/6/10.
//  Copyright © 2019 庞日富. All rights reserved.
//

#import "Person.h"
#import <ReactiveObjC.h>

@implementation Person

-(instancetype)init{
    if (self = [super init]) {
        [RACObserve(self, name) subscribeNext:^(id  _Nullable x) {
            if (x) {
                NSLog(@"newName:%@",x);
            }
        }];
    }
    return self;
}




@end
