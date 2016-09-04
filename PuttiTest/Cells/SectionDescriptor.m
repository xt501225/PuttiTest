//
//  SectionDescriptor.m
//  PuttiTest
//
//  Created by Sam on 16/9/3.
//  Copyright © 2016年 Sam. All rights reserved.
//

#import "SectionDescriptor.h"

@implementation SectionDescriptor

- (instancetype)init {
    self = [super init];
    if (self) {
        _rowDescriptors = [NSMutableArray<RowDescriptor *> new];
    }
    return self;
}

- (NSUInteger)numberOfRows {
    return [_rowDescriptors count];
}

- (void)addRowDescriptor:(RowDescriptor *)rowDescriptor {
    [_rowDescriptors addObject:rowDescriptor];
}

- (void)addRowDescriptors:(NSArray<RowDescriptor *> *)rowDescriptors {
    [_rowDescriptors addObjectsFromArray:rowDescriptors];
}

@end