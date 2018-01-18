//
//  LiaotianTableViewCell.m
//  liaotiandemo
//
//  Created by VVVVVVVVVV on 2018/1/11.
//  Copyright © 2018年 huchenchen. All rights reserved.
//

#import "LiaotianTableViewCell.h"
#define Frame(x,y,w,h)   CGRectMake(x, y, w, h)
#define WIDTH [UIScreen mainScreen].bounds.size.width
//#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define _mx [UIScreen mainScreen].bounds.size.width/375
//#define my [UIScreen mainScreen].bounds.size.height/667
#define _my [UIScreen mainScreen].bounds.size.width/375
#define HEIGHT ({CGFloat height; if([UIScreen mainScreen].bounds.size.height == 812) {height = [UIScreen mainScreen].bounds.size.height-34;} else {height = [UIScreen mainScreen].bounds.size.height;} height;})
#define NavHeight ({CGFloat height; if([UIScreen mainScreen].bounds.size.height == 812) {height = 88;} else {height = 64;} height;})
@implementation LiaotianTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self add_view];
    }
    return self;
}


-(void)add_view
{
    self.headerImg = [[UIImageView alloc]init];
    self.headerImg.frame = Frame(10*_mx, 5*_my, 70*_mx, 70*_my);
    self.headerImg.image = [UIImage imageNamed:@"1233"];
    self.headerImg.layer.masksToBounds = YES;
    self.headerImg.layer.cornerRadius = self.headerImg.frame.size.height/2;
    [self addSubview:self.headerImg];
    
    //添加手势
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    self.headerImg.userInteractionEnabled=YES;
    [self.headerImg addGestureRecognizer:tap];
    
    self.nickLabel = [[UILabel alloc]init];
    self.nickLabel.frame = Frame(CGRectGetMaxX(self.headerImg.frame)+5*_mx, 8*_my, 100*_mx, 30*_my);
    self.nickLabel.text = @"123456";
    [self addSubview:self.nickLabel];
    
    
    self.timeLabel = [[UILabel alloc]init];
    self.timeLabel.frame = Frame(CGRectGetMaxX(self.headerImg.frame)+5*_mx, CGRectGetMaxY(self.nickLabel.frame)+5*_my, 100*_mx, 30*_my);
    self.timeLabel.text = @"时间";
    [self addSubview:self.timeLabel];
    
    
    self.detailLabel = [[UILabel alloc]init];
    self.detailLabel.frame = Frame(10*_mx, CGRectGetMaxY(self.headerImg.frame)+5*_my, WIDTH - 20*_mx, 30*_my);
    self.detailLabel.text = @"sadasdas";
    [self addSubview:self.detailLabel];
    
    
    self.touchBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.touchBtn.frame = Frame(WIDTH-30*_mx, 5*_my, 25*_mx, 25*_my);
    self.touchBtn.backgroundColor = [UIColor redColor];
    [self.touchBtn addTarget:self action:@selector(like:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.touchBtn];
    
    self.commentImage = [[UIImageView alloc]init];
    self.commentImage.frame = Frame(0, CGRectGetMaxY(self.detailLabel.frame), WIDTH, 200);
    self.commentImage.image = [UIImage imageNamed:@"评论背景@2x"];
//    self.commentImage.layer.masksToBounds = YES;
//    self.commentImage.layer.cornerRadius = self.commentImage.frame.size.height/2;
    [self addSubview:self.commentImage];
    
    [self status];
}


-(void)tapAction:(UITapGestureRecognizer *)sender
{
    //评论显示交换
    self.selete=!self.selete;
    NSString *str=nil;
    if (self.selete) {//显示评论
        NSLog(@"显示");
        str=[NSString stringWithFormat:@"%f", CGRectGetMaxY(self.detailLabel.frame)+200];
    
    }else{//隐藏
        NSLog(@"关闭");
        str=[NSString stringWithFormat:@"%f", CGRectGetMaxY(self.detailLabel.frame)];
    }
    
    if (_delegate &&[_delegate respondsToSelector:@selector(sendCellHeiget:LiaotianCelltag:select:)]) {
        [_delegate sendCellHeiget:str LiaotianCelltag:self.tag select:self.selete];
    }
//    [self status];
}

//评论显示状态
-(void)status{
    if (self.selete) {//显示评论
                self.commentImage.hidden=NO;
//        str=[NSString stringWithFormat:@"%f", self.frame.size.height+200];
        //        str=@"200";
    }else{//隐藏
                self.commentImage.hidden=YES;
//        str=[NSString stringWithFormat:@"%f", self.frame.size.height-200];
    }
    
}



-(void)like:(UIButton *)sender
{
    _likeAction(sender);
}

//-(void)layoutSubviews
//{
//    [super layoutSubviews];
//
//
//
//
//
//
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
