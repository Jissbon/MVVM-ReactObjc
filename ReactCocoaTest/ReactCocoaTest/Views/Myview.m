//
//  Myview.m
//  ReactCocoaTest
//
//  Created by 庞日富 on 2019/5/26.
//  Copyright © 2019 庞日富. All rights reserved.
//

#import "Myview.h"

@implementation Myview

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.mybtn = [[UIButton alloc] initWithFrame:frame];
        [self.mybtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
    
}


-(void)btnClick:(UIButton *)btn{
    NSLog(@"abc");
}

@end
