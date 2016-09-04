//
//  SectionDescriptor.h
//  PuttiTest
//
//  Created by summer on 16/9/3.
//  Copyright © 2016年 Sam. All rights reserved.
//


#import "RowDescriptor.h"


@interface SectionDescriptor : NSObject

@property(nonatomic, strong) NSMutableArray<RowDescriptor *> *rowDescriptors;

@property(nonatomic) CGFloat headerHeight;

@property(nonatomic) CGFloat footerHeight;

@property(nonatomic, strong) UIView *footerView;

@property(nonatomic, strong) UIView *headerView;


- (NSUInteger)numberOfRows;

- (void)addRowDescriptor:(RowDescriptor *)rowDescriptor;

- (void)addRowDescriptors:(NSArray<RowDescriptor *> *)rowDescriptors;

@end
