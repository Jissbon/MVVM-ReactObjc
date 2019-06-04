//
//  MyCell.h
//  ReactCocoaTest
//
//  Created by 庞日富 on 2019/5/28.
//  Copyright © 2019 庞日富. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "Present.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyCell : UITableViewCell

@property (strong, nonatomic) Model *model;

@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *numLabel;
@property (strong, nonatomic) UIButton  *addBtn;
@property (strong, nonatomic) UIButton *subBtn;
@property (nonatomic, assign) int num;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic,weak) id<PresentDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
