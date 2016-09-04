//
//  ItemImageCell.m
//  PuttiTest
//
//  Created by summer on 16/9/3.
//  Copyright © 2016年 Sam. All rights reserved.
//

#import "ItemImageCell.h"

@interface ItemImageCell ()  {
    UIImageView *_imageView;
}
@end

@implementation ItemImageCell


- (void)initCell {
    _imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    _imageView.backgroundColor = [UIColor lightGrayColor];
    _imageView.clipsToBounds  = YES;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:_imageView];
}

- (void)initConstraints {

    UIView *superview = self.contentView;
    [superview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(_imageView);
    }];
}


#pragma mark ItemCellProtocol
- (void)prepareForDisplayWithValue:(ImageCellModel *)model {
    self.model = model;
     _imageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, model.height);
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:nil];
}
@end

@implementation ImageCellModel

+ (instancetype)modelWithImages:(NSString *)image height:(CGFloat)height {
    ImageCellModel *model = [ImageCellModel new];
    model.image = image;
    model.height = height;
    return model;
}

@end
