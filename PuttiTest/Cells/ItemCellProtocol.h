//
//  ItemListCellProtocol.h
//  PuttiTest
//
//  Created by Sam on 16/9/2.
//  Copyright © 2016年 Sam. All rights reserved.
//


@protocol ItemCellProtocol <NSObject>

@optional
- (void)prepareForDisplayWithValue:(id)value;
- (void)tappedInTableView:(UITableView *)tableView viewController:(UIViewController *)viewController;

@end

