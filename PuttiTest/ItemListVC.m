//
//  ItemListVC.m
//  PuttiTest
//
//  Created by sam on 16/9/2.
//  Copyright © 2016年 Sam. All rights reserved.
//

#import "ItemListVC.h"


@implementation ItemListVC

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.title =@"Putti Test";
    
}

- (void)viewWillAppear:(BOOL)animated {
    NSMutableDictionary *defaults = [[NSMutableDictionary alloc] init];
    [defaults setObject:@"interview" forKey:@"event_type"];
    
    BaseRequest *api =
    [[BaseRequest alloc] initWithDict:defaults
                                   URL:SERVER_URL
                             reqMethod:YTKRequestMethodPost
                 requestSerializerType:YTKRequestSerializerTypeHTTP
                             cacheTime:0];
    [api start];
    [api.requestOperation waitUntilFinished]; //同步调用
     NSDictionary* result = [api responseJSONObject];
    
    //YYModel转换
    self.events = [[Events alloc]init];
    NSString* jsonData = [result valueForKeyPath:CONSTANT_EVENT];
    self.events.itemModels = [NSArray yy_modelArrayWithClass:[EventModel class]
                               json:jsonData];
    
    [self.tableView setEstimatedRowHeight:80];
    //更新数据
    [self.tableView reloadData];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - TableView dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.events.itemModels count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    __kindof UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"itemListCell"];
    if (!cell) {
        cell = [[ItemListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"itemListCell"];
    }
    if ([cell conformsToProtocol:@protocol(ItemCellProtocol)]) {
        UITableViewCell<ItemCellProtocol> *cellWithProtocal = cell;
        if ([cellWithProtocal respondsToSelector:@selector(prepareForDisplayWithValue:)])
        {
            [cellWithProtocal prepareForDisplayWithValue:self.events.itemModels[indexPath.row]];
        }
    }
    
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    EventModel* itemModel = self.events.itemModels[indexPath.row];
    ItemDetailVC* vc = [[ItemDetailVC alloc]initWithItem:itemModel];
    [self.navigationController pushViewController:vc animated:true];
}


@end
