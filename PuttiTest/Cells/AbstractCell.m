//
//  AbstractCell.m
//  PuttiTest
//
//  Created by Sam on 16/9/3.
//  Copyright © 2016年 Sam. All rights reserved.
//

#import "AbstractCell.h"

@implementation AbstractCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initCell];
    }
    return self;
}

- (void)updateConstraints {
    if (!_setConstraints) {
        [self initConstraints];
        _setConstraints = YES;
    }
    [super updateConstraints];
}

#pragma mark Abstract Method

- (void)initCell {
}

- (void)initConstraints {
}

- (void)prepareForDisplayWithValue:(id)value {
}


- (CGFloat)vPadding {
    return 15;
}

- (CGFloat)hPadding {
    return 20;
}

@end
