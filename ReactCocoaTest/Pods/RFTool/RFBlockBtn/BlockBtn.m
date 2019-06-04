//
//  BlockBtn.m
//  RFDemo
//
//  Created by 庞日富 on 2019/5/22.
//  Copyright © 2019 庞日富. All rights reserved.
//

#import "BlockBtn.h"

@implementation BlockBtn

- (void)doAction:(UIButton *)button {
    
    if (self.block) {
        self.block(button);
    }
}

-(void)addTapBlock:(void(^)(UIButton *btn))block{
    self.block = block;
    
    [self addTarget:self action:@selector(doAction:) forControlEvents:UIControlEventTouchUpInside];
}

@end
