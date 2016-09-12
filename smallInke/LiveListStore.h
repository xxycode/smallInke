//
//  LiveListStore.h
//  smallInke
//
//  Created by Xiaoxueyuan on 12/9/16.
//  Copyright © 2016年 Xiaoxueyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiveListStore : NSObject<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, copy) NSArray *liveList;

@property (nonatomic, copy) void(^selectedRowAtIndexPath)(NSIndexPath *indexPath);

@end
