//
//  NewTableViewCell.m
//  TableViewPreload
//
//  Created by anyongxue on 2017/9/25.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "NewTableViewCell.h"

@implementation NewTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)bindDataWithResourceModel:(ResourceModel *)model withIndex:(NSInteger)index{
    
    if (!model) {
        
    }
    
    NSString *str = [NSString stringWithFormat:@"%ld  %@",index,model.regdate];
    
    [self.timeLabel setText:str];
}

@end
