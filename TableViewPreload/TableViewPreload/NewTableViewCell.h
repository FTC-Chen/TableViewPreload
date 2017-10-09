//
//  NewTableViewCell.h
//  TableViewPreload
//
//  Created by anyongxue on 2017/9/25.
//  Copyright © 2017年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResourceModel.h"

@interface NewTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

- (void) bindDataWithResourceModel:(ResourceModel *)model withIndex:(NSInteger)index;

@end
