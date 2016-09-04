//
//  ItemRichLabelCell.m
//  PuttiTest
//
//  Created by Sam on 16/9/3.
//  Copyright © 2016年 Sam. All rights reserved.
//

#import "ItemRichLabelCell.h"


@implementation ItemRichLabelCell


- (void)initCell {
    self.label = [UILabel new];
    UIFont *font = [UIFont systemFontOfSize:14.0f];
    //[self.label setFont:[UIFont systemFontOfSize:labelFontSize]];
    self.label.font = font;
   // [_label setLineBreakMode:NSLineBreakByTruncatingTail];
    [_label setNumberOfLines:0];
    [self addSubview:self.label];
    [self.contentView addSubview:_label];
}

- (void)initConstraints {
    UIView *superview = self.contentView;
    CGFloat vOffset = [self vPadding];
    CGFloat hOffset = [self hPadding];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(superview)
        .with.insets(UIEdgeInsetsMake(vOffset, hOffset, vOffset, hOffset));
    }];
}

#pragma mark IanTVCellProtocal
- (void)prepareForDisplayWithValue:(NSString *)str {
    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[str dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    self.label.attributedText = attrStr;
    CGFloat labelFontSize =[UIFont systemFontSize] + 1.5;
    UIFont *font = [UIFont systemFontOfSize:labelFontSize];
    self.label.font = font;
}

@end
