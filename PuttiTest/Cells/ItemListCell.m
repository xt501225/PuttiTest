//
//  ItemListCell.m
//  PuttiTest
//
//  Created by summer on 16/9/2.
//  Copyright © 2016年 Sam. All rights reserved.
//

#import "ItemListCell.h"


static const int SizeI = 80;

@interface ItemListCell () {
    BOOL _setConstraints;
}
@property (nonatomic,strong) EventModel* item;

@end

@implementation ItemListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initCell];
    }
    return self;
}

/**
 *  init itemListCell
 */
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

/**
 *  update cell constraint
 */
- (void)updateConstraints {
    if (!_setConstraints) {
        [self initConstraints];
        _setConstraints = YES;
    }
    
    [super updateConstraints];
}

/**
 *  init cell constraints
 */
- (void)initConstraints {
    UIView *superview = self.contentView;
    CGFloat hOffset = [self hPadding];
    [_imageImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(SizeI);
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


- (void)prepareForDisplayWithValue:(EventModel *)item {
    self.item = item;
    [_titleLabel setText:[item title]];
    [_subtitleLabel setText:[item ordering]];
    [_lastModifiedTimeLabel setText:[item updatedDate]];
    [_imageImageView sd_setImageWithURL:[NSURL URLWithString: item.thumbnailImageURL] placeholderImage:[UIImage imageNamed:@"tableViewCell_itemListPlaceholder"]];
}

/**
 *  tap cell event
 *
 *  @param tableView      <#tableView description#>
 *  @param viewController <#viewController description#>
 */
- (void)tappedInTableView:(UITableView *)tableView viewController:(UIViewController *)viewController {
//    ItemDetailVC *vc = [ItemDetailVC vcWithItem:_item];
//    [viewController.navigationController pushViewController:vc animated:YES];
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
   // [label setTextColor:[ColorTheme primaryColor]];
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
    CGFloat timeFontSize =11;
    [label setFont:[UIFont systemFontOfSize:timeFontSize]];
   // [label setTextColor:[ColorTheme lightGrayColor]];
    [label setTextAlignment:NSTextAlignmentRight];
    return label;
}

- (CGFloat)vPadding {
    return 15;
}

- (CGFloat)hPadding {
    return 20;
}
@end
