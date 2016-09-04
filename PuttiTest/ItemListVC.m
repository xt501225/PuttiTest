//
//  ItemListVC.m
//  PuttiTest
//
//  Created by sam on 16/9/2.
//  Copyright © 2016年 Sam. All rights reserved.
//

#import "ItemListVC.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"

@implementation ItemListVC

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.title =@"Putti Test";
    [self.tableView setEstimatedRowHeight:44.0];
    //[self loadDataFromServerByAFNetworking];
    [self loadDataFromServerByNSURLConnection];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loadDataFromServerByAFNetworking {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = @"Loading";
    
    NSDictionary *dic = @{@"event_type": @"interview"};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager.requestSerializer setValue:@"MyTestClient : X-Signiture=1Uhi8g9A91" forHTTPHeaderField:@"User-Agent"];
    [manager.requestSerializer setValue:@"697381b065bbfe4a714cd14cf394978e" forHTTPHeaderField:@"X-Key"];
    
    NSString *urlstr = [NSString stringWithFormat:SERVER_URL];

    [manager POST:urlstr parameters:dic progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              [hud hideAnimated:YES];
              NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
              // JSON TO Model
              self.events = [[Events alloc]init];
              NSString* jsonData = [dic valueForKeyPath:CONSTANT_EVENT];
              self.events.itemModels = [NSArray yy_modelArrayWithClass:[EventModel class] json:jsonData];
              [self.tableView reloadData];
    }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              NSLog(@"%@",error.localizedDescription);
          }];
    
}

- (void)loadDataFromServerByNSURLConnection {
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = @"Loading";
    
    NSString *urlStr = [NSString stringWithFormat:SERVER_URL];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [@"event_type=interview" dataUsingEncoding:NSUTF8StringEncoding];
    //request.timeoutInterval = 10;
    
    [request setValue:@"MyTestClient : X-Signiture=1Uhi8g9A91" forHTTPHeaderField:@"User-Agent"];
    [request setValue:@"697381b065bbfe4a714cd14cf394978e" forHTTPHeaderField:@"X-Key"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        [hud hideAnimated:YES];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        // JSON TO Model
        self.events = [[Events alloc]init];
        NSString* jsonData = [dic valueForKeyPath:CONSTANT_EVENT];
        self.events.itemModels = [NSArray yy_modelArrayWithClass:[EventModel class] json:jsonData];
        [self.tableView reloadData];

    }];
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
