//
//  ItemLabelCell.m
//  PuttiTest
//
//  Created by summer on 16/9/3.
//  Copyright © 2016年 Sam. All rights reserved.
//

#import "ItemLabelCell.h"


@implementation ItemLabelCell

- (void)initCell {
    CGFloat labelFontSize =[UIFont systemFontSize] + 1.5;
    self.leftLabel = [UILabel new];
    [self.leftLabel setFont:[UIFont systemFontOfSize:labelFontSize]];
    [self.contentView addSubview:self.leftLabel];
    
    self.rightLabel = [UILabel new];
     [self.leftLabel setFont:[UIFont systemFontOfSize:labelFontSize]];
    [self.rightLabel setTextAlignment:NSTextAlignmentRight];
    [self.contentView addSubview:self.rightLabel];
}

- (void)initConstraints {
    UIView *superview = self.contentView;
    
    int hOffsetLL = 10;
    CGFloat vOffset = [self vPadding];
    CGFloat hOffset = [self hPadding];
    [_leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        // superview
        make.left.equalTo(superview.mas_left).with.offset(hOffset);
        make.top.equalTo(superview.mas_top).with.offset(vOffset);
        make.bottom.equalTo(superview.mas_bottom).with.offset(-vOffset);
        // _rightLabel
        make.right.equalTo(_rightLabel.mas_left).with.offset(-hOffsetLL);
    }];
    [_rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(superview.mas_right).with.offset(-hOffset);
        make.top.equalTo(superview.mas_top).with.offset(vOffset);
        make.bottom.equalTo(superview.mas_bottom).with.offset(-vOffset);
    }];
}

#pragma mark ItemCellProtocol
- (void)prepareForDisplayWithValue:(LabelCellModel *)model {
    [_leftLabel setText:model.leftStr];
    [_rightLabel setText:model.rightStr];
}
@end

@implementation LabelCellModel

+ (instancetype)modelWithLeftStr:(NSString *)leftStr
                        rightStr:(NSString *)rightStr {
    LabelCellModel *model = [LabelCellModel new];
    model.leftStr = leftStr;
    model.rightStr = rightStr;
    return model;
}

@end