//
//  RowDescriptor.h
//  PuttiTest
//
//  Created by summer on 16/9/3.
//  Copyright © 2016年 Sam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "ItemCellProtocol.h"
#import "ItemCellProtocol.h"

@interface RowDescriptor : NSObject

@property(nonatomic) Class cellClass;

@property(nonatomic) UITableViewCellStyle cellStyle;

@property(nonatomic, getter=isCellReusable) BOOL cellReusability;

@property(nonatomic, copy) NSString *cellIdentifier;

@property(nonatomic) id cellValue;


+ (instancetype)descriptorWithCellClass:(Class)cellClass cellValue:(id)cellValue;

- (__kindof UITableViewCell *)cellForTableView:(UITableView *)tableView viewController: (UIViewController *)viewController;

@end

