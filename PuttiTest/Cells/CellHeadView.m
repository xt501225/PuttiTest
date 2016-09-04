//
//  CellHeadView.m
//  PuttiTest
//
//  Created by Sam on 16/9/4.
//  Copyright © 2016年 Sam. All rights reserved.
//

#import "CellHeadView.h"

@interface CellHeadView () {
    UILabel *_label;
}
@end

@implementation CellHeadView


- (instancetype)initWithText: (NSString*) headTitle {
    self = [super init];
    if (self) {
        _label = [UILabel new];
        [_label setText:headTitle];
        [_label setTextAlignment:NSTextAlignmentCenter];
        _label.textColor = [UIColor blackColor];
        _label.font = [UIFont boldSystemFontOfSize:14];

        [self addSubview:_label];
        self.backgroundColor = [UIColor clearColor];
        
        
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self).priority(999);
            make.edges.equalTo(self)
            .with.insets(UIEdgeInsetsMake(0, 0, 5, 0))
            .priority(999);
        }];
    }
    
    return self;
}

@end
