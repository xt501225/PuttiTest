//
//  ItemListCell.m
//  PuttiTest
//
//  Created by Sam on 16/9/2.
//  Copyright © 2016年 Sam. All rights reserved.
//

#import "ItemListCell.h"


@interface ItemListCell()
@property (nonatomic,strong) EventModel* itemModel;

@end

@implementation ItemListCell


- (void)initCell {
    UIView *superview = self.contentView;
    
    _imageImageView = [self componentImageView];
    [superview addSubview:_imageImageView];
    
    _titleLabel = [self componentTitleLabel];
    [superview addSubview:_titleLabel];
    
    _subtitleLabel = [self componentSubtitleLabel];
    [superview addSubview:_subtitleLabel];
    
    _lastModifiedTimeLabel = [self componentTimeLabel];
    [superview addSubview:_lastModifiedTimeLabel];
}


- (void)initConstraints {
    UIView *superview = self.contentView;
    CGFloat hOffset = [self hPadding];
    [_imageImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(80);
        make.top.and.bottom.and.left.equalTo(superview).priority(999);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superview).with.offset(10);
        make.left.equalTo(_imageImageView.mas_right).with.offset(10);
    }];
    [_subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLabel);
        make.top.equalTo(_titleLabel.mas_bottom).with.offset(3);
    }];
    [_lastModifiedTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_subtitleLabel);
        make.right.equalTo(superview).with.offset(-hOffset);
        make.left.equalTo(_subtitleLabel.mas_right).with.offset(5);
    }];
}


- (void)prepareForDisplayWithValue:(EventModel *)itemModel {
    self.itemModel = itemModel;
    [_titleLabel setText:[_itemModel title]];
    [_subtitleLabel setText:[_itemModel ordering]];
    [_lastModifiedTimeLabel setText:[_itemModel updatedDate]];
    [_imageImageView sd_setImageWithURL:[NSURL URLWithString: _itemModel.thumbnailImageURL] placeholderImage:[UIImage imageNamed:@"tableViewCell_itemListPlaceholder"]];
}


- (void)tappedInTableView:(UITableView *)tableView viewController:(UIViewController *)viewController {
    ItemDetailVC* vc = [[ItemDetailVC alloc]initWithItem:_itemModel];
    [viewController.navigationController pushViewController:vc animated:true];
}


#pragma mark Component
- (UILabel *)componentTitleLabel {
    UILabel *label = [UILabel new];
    CGFloat titleFontSize =[UIFont systemFontSize];
    [label setFont:[UIFont systemFontOfSize:titleFontSize]];
    
    return label;
}

- (UILabel *)componentSubtitleLabel {
    UILabel *label = [UILabel new];
    CGFloat titleFontSize =[UIFont systemFontSize]+1.5;
    [label setFont:[UIFont systemFontOfSize:titleFontSize]];
    return label;
}

- (UIImageView *)componentImageView {
    UIImageView *imageView = [UIImageView new];
    [imageView setContentMode:UIViewContentModeScaleToFill];
    [imageView setClipsToBounds:YES];
    return imageView;
}

- (UILabel *)componentTimeLabel {
    UILabel *label = [UILabel new];
    [label setFont:[UIFont systemFontOfSize:11.0f]];
    [label setTextAlignment:NSTextAlignmentRight];
    return label;
}

@end
