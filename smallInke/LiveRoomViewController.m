//
//  LiveRoomViewController.m
//  smallInke
//
//  Created by Xiaoxueyuan on 12/9/16.
//  Copyright © 2016年 Xiaoxueyuan. All rights reserved.
//

#import "LiveRoomViewController.h"
#import "PLPlayerKit.h"

@interface LiveRoomViewController ()

@property (nonatomic, strong) PLPlayer *player;

@end

@implementation LiveRoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    PLPlayerOption *option = [PLPlayerOption defaultOption];
    [option setOptionValue:@10 forKey:PLPlayerOptionKeyTimeoutIntervalForMediaPackets];
    [option setOptionValue:@(NO) forKey:PLPlayerOptionKeyVideoToolbox];
    [option setOptionValue:@(800) forKey:PLPlayerOptionKeyMaxL1BufferDuration];
    [option setOptionValue:@(800) forKey:PLPlayerOptionKeyMaxL2BufferDuration];
    
    self.player = [[PLPlayer alloc] initWithURL:[NSURL URLWithString:self.liveModel.streamAddr] option:option];
    self.player.delegateQueue = dispatch_get_main_queue();
    self.player.backgroundPlayEnable = YES;
    [self.view insertSubview:self.player.playerView atIndex:0];
    self.player.playerView.frame = [UIScreen mainScreen].bounds;
    [self.player play];
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];
    [self.player stop];
}



- (IBAction)close:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
