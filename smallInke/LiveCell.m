//
//  LiveCell.m
//  smallInke
//
//  Created by Xiaoxueyuan on 12/9/16.
//  Copyright © 2016年 Xiaoxueyuan. All rights reserved.
//

#import "LiveCell.h"
#import "UIImageView+WebCache.h"
#import "UIImage+Add.h"

@interface LiveCell()
@property (weak, nonatomic) IBOutlet UIImageView *avatorImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickName;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *onlineCountLabel;
@property (weak, nonatomic) IBOutlet UIImageView *liveCoverImageView;

@end

@implementation LiveCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setLive:(Live *)live{
    _live = live;
    NSString *loc = live.city;
    if ([loc isEqualToString:@""]) {
        loc = @"火星";
    }
    //SDWebImageAvoidAutoSetImage
        _locationLabel.text = [NSString stringWithFormat:@"%@>",loc];
    _nickName.text = live.creator.nick;
    _onlineCountLabel.text = [NSString stringWithFormat:@"%ld",(long)live.onlineUsers];
    NSString *imgUrl = [NSString stringWithFormat:@"http://img.meelive.cn/%@",live.creator.portrait];
    __weak typeof(self) weakSelf = self;
    CGFloat screenScale = [UIScreen mainScreen].nativeScale;
    [_avatorImageView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:nil options:SDWebImageAvoidAutoSetImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            UIImage *newImage = [image imageByResizeToSize:CGSizeMake(42 * screenScale, 42 * screenScale)];
            newImage = [newImage imageByRoundCornerRadius:21 * screenScale];
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.avatorImageView.image = newImage;
            });
        });
    }];
    [_liveCoverImageView sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
}

@end
