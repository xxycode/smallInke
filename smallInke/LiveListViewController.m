//
//  ViewController.m
//  smallInke
//
//  Created by Xiaoxueyuan on 12/9/16.
//  Copyright © 2016年 Xiaoxueyuan. All rights reserved.
//

#import "LiveListViewController.h"
#import "AFNetworking.h"
#import "Live.h"
#import "LiveListStore.h"
#import "LiveRoomViewController.h"
#import "MJRefresh.h"

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@interface LiveListViewController ()


@property (strong, nonatomic) IBOutlet LiveListStore *dataStore;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LiveListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTitleTextAttributes:
    @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.title = @"小映客";
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self.navigationController.navigationBar setBarTintColor:UIColorFromRGB(0x00d8c9)];
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    self.tableView.rowHeight = 10 + 42 + 10 + screenWidth;
    self.tableView.tableHeaderView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, CGFLOAT_MIN)];
        view;
    });
    self.tableView.tableFooterView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, CGFLOAT_MIN)];
        view;
    });
    MJRefreshNormalHeader *header = [[MJRefreshNormalHeader alloc] init];
    header.refreshingTarget = self;
    header.refreshingAction = @selector(getLiveList);
    self.tableView.mj_header = header;
    [header beginRefreshing];
    
    __weak typeof(self) weakSelf = self;
    [self.dataStore setSelectedRowAtIndexPath:^(NSIndexPath *indexPath) {
        [weakSelf watchLive:indexPath.section];
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)getLiveList{
    
    __weak typeof(self) weakSelf = self;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    [manager GET:@"http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1&count=20"
      parameters:nil
        progress:nil
         success:\
     ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         NSArray *lives = responseObject[@"lives"];
         NSMutableArray *liveArray = @[].mutableCopy;
         for (NSDictionary *liveDic in lives) {
             Live *live = [[Live alloc] initWithDictionary:liveDic];
             [liveArray addObject:live];
         }
         [weakSelf finishLoadList:liveArray];
     }
         failure:\
     ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"%@",error.localizedDescription);
     }];
}

- (void)finishLoadList:(NSArray *)array{
    [self.tableView.mj_header endRefreshing];
    self.dataStore.liveList = array;
    [self.tableView reloadData];
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)watchLive:(NSInteger)index{
    Live *live = self.dataStore.liveList[index];
    [self performSegueWithIdentifier:@"watchLive" sender:live];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"watchLive"]) {
        LiveRoomViewController *roomVC = segue.destinationViewController;
        roomVC.liveModel = sender;
    }
}

@end
