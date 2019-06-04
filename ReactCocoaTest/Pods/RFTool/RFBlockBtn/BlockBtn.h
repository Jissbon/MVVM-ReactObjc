//
//  BlockBtn.h
//  RFDemo
//
//  Created by 庞日富 on 2019/5/22.
//  Copyright © 2019 庞日富. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ClickBlock)(UIButton * button);

@interface BlockBtn : UIButton

@property (nonatomic, copy) ClickBlock block;

-(void)addTapBlock:(void(^)(UIButton *btn))block;

@end

NS_ASSUME_NONNULL_END
