//
//  Myview.h
//  ReactCocoaTest
//
//  Created by 庞日富 on 2019/5/26.
//  Copyright © 2019 庞日富. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Myview : UIView

@property (strong, nonatomic) UIButton *mybtn;
-(void)btnClick:(UIButton *)btn;

@end

NS_ASSUME_NONNULL_END
