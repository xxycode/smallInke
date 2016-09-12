//
//  LiveListStore.m
//  smallInke
//
//  Created by Xiaoxueyuan on 12/9/16.
//  Copyright © 2016年 Xiaoxueyuan. All rights reserved.
//

#import "LiveListStore.h"
#import "LiveCell.h"
#import "Live.h"

@implementation LiveListStore

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.liveList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LiveCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.live = self.liveList[indexPath.section];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.selectedRowAtIndexPath) {
        self.selectedRowAtIndexPath(indexPath);
    }
}

@end
