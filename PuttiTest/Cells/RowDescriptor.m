//
//  RowDescriptor.m
//  PuttiTest
//
//  Created by Sam on 16/9/3.
//  Copyright © 2016年 Sam. All rights reserved.
//

#import "RowDescriptor.h"

@implementation RowDescriptor

+ (instancetype)descriptorWithCellClass:(Class)cellClass
                              cellValue:(id)cellValue {
    RowDescriptor *descriptor = [RowDescriptor new];
    descriptor.cellClass = cellClass;
    descriptor.cellValue = cellValue;
    return descriptor;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.cellClass = [UITableViewCell class];
        self.cellStyle = UITableViewCellStyleDefault;
        self.cellReusability = YES;
    }
    return self;
}


- (__kindof UITableViewCell *)cellForTableView:(UITableView *)tableView viewController: (UIViewController *)viewController {
    
    __kindof UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    
    if (!cell) {
        cell = [[self.cellClass alloc] initWithStyle:self.cellStyle reuseIdentifier:self.cellIdentifier];
    }
    
    if ([cell conformsToProtocol:@protocol(ItemCellProtocol)]) {
        UITableViewCell<ItemCellProtocol> *cellWithProtocal = cell;
        if ([cellWithProtocal respondsToSelector:@selector(prepareForDisplayWithValue:)])
        {
            [cellWithProtocal prepareForDisplayWithValue:self.cellValue];
        }
    }
    
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    return cell;
}

#pragma mark Getter
- (NSString *)cellIdentifier {
    
    return NSStringFromClass(self.cellClass);
}


@end

