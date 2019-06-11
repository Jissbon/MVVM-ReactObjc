//
//  RACVC.m
//  ReactCocoaTest
//
//  Created by 庞日富 on 2019/6/4.
//  Copyright © 2019 庞日富. All rights reserved.
//

#import "RACVC.h"
#import <ReactiveObjC.h>
#import <Masonry.h>
#import "Person.h"

@class Person;

@interface RACVC ()

@property (strong, nonatomic) UIButton  *btn;


@property (strong, nonatomic) Person *p;
@end

@implementation RACVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"RAC";
    self.view.backgroundColor = [UIColor whiteColor];
    self.btn.backgroundColor = [UIColor blueColor];
    
    __weak typeof(self) weakself = self;
    self.btn.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        weakself.p.name = @"prf";
        UIButton *btn = (UIButton *)input;
        [btn setTitle:@"PRF" forState:UIControlStateNormal];
        return [RACSignal empty];
    }];
    

    
}

-(UIButton *)btn{
    if (_btn == nil) {
        _btn = [UIButton new];
        [self.view addSubview:_btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(100);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(50);
            make.centerX.mas_equalTo(0);
        }];
    }
    return _btn;
}

-(Person *)p{
    if (!_p) {
        _p = [Person new];
    }
    return _p;
}


@end
