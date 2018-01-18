//
//  LiaotianTableViewCell.h
//  liaotiandemo
//
//  Created by VVVVVVVVVV on 2018/1/11.
//  Copyright © 2018年 huchenchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LiaotianCellDelegate <NSObject>

-(void)sendCellHeiget:(NSString *)height LiaotianCelltag:(NSInteger)tag select:(Boolean )select;
@end

@interface LiaotianTableViewCell : UITableViewCell

typedef void(^likeAction)(UIButton *button);

@property(nonatomic, strong) UIImageView *headerImg;
@property(nonatomic, strong) UILabel *nickLabel;
@property(nonatomic, strong) UILabel *timeLabel;
@property(nonatomic, strong) UIButton *touchBtn;
@property(nonatomic, strong) UILabel *detailLabel;

@property(nonatomic, copy) likeAction likeAction;

@property(nonatomic, assign)id<LiaotianCellDelegate> delegate;
@property(nonatomic, strong) UIImageView *commentImage;//评论
@property(nonatomic, assign)Boolean selete;//评论状态

-(void)status;

@end
