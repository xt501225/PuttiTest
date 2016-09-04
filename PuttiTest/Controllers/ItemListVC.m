//
//  ItemListVC.m
//  PuttiTest
//
//  Created by sam on 16/9/2.
//  Copyright © 2016年 Sam. All rights reserved.
//

#import "ItemListVC.h"

@interface ItemListVC() {
    SectionDescriptor *_listSD;
}

@end

@implementation ItemListVC

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.title =@"Putti Test";
    //[self loadDataFromServerByAFNetworking];
    [self loadDataFromServerByNSURLConnection];
    
    
}


/**
 *  load data using AFNetworking
 */
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
              [self initSectionDescriptor];
              [self.tableView reloadData];
    }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              hud.label.text =@"network error,please reload";
              [hud hideAnimated:YES afterDelay:2.f];
              NSLog(@"%@",error.localizedDescription);
          }];
    
}

/**
 *  load data using NSURLConnection
 */
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
        if (connectionError != nil || data == nil) {
            hud.label.text =@"network error,please reload";
            [hud hideAnimated:YES afterDelay:2.f];
            NSLog(@"network error");
        }
        else {
            [hud hideAnimated:YES];
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
            // JSON TO Model
            self.events = [[Events alloc]init];
            NSString* jsonData = [dic valueForKeyPath:CONSTANT_EVENT];
            self.events.itemModels = [NSArray yy_modelArrayWithClass:[EventModel class] json:jsonData];
            [self initSectionDescriptor];
            [self.tableView reloadData];
        }

    }];
}

-(void) initSectionDescriptor {
    _listSD = [SectionDescriptor new];
    _listSD.headerHeight = CGFLOAT_MIN;
    
    [self.events.itemModels enumerateObjectsUsingBlock:^(EventModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        RowDescriptor* itemRD = [RowDescriptor descriptorWithCellClass:[ItemListCell class] cellValue: obj];
        [_listSD addRowDescriptor:itemRD];
    }];
    [self addSectionDescriptor:_listSD];
    
}

@end
