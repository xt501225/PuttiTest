//
//  ItemListCellProtocol.h
//  PuttiTest
//
//  Created by summer on 16/9/2.
//  Copyright © 2016年 Sam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol ItemCellProtocol <NSObject>

@optional
- (void)prepareForDisplayWithValue:(id)value;
- (void)tappedInTableView:(UITableView *)tableView viewController:(UIViewController *)viewController;

@end

