//
//  ViewController.m
//  liaotiandemo
//
//  Created by VVVVVVVVVV on 2018/1/11.
//  Copyright © 2018年 huchenchen. All rights reserved.
//

#import "ViewController.h"
#import "LiaotianTableViewCell.h"
#define Frame(x,y,w,h)   CGRectMake(x, y, w, h)
#define WIDTH [UIScreen mainScreen].bounds.size.width
//#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define _mx [UIScreen mainScreen].bounds.size.width/375
//#define my [UIScreen mainScreen].bounds.size.height/667
#define _my [UIScreen mainScreen].bounds.size.width/375
#define HEIGHT ({CGFloat height; if([UIScreen mainScreen].bounds.size.height == 812) {height = [UIScreen mainScreen].bounds.size.height-34;} else {height = [UIScreen mainScreen].bounds.size.height;} height;})
#define NavHeight ({CGFloat height; if([UIScreen mainScreen].bounds.size.height == 812) {height = 88;} else {height = 64;} height;})
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,LiaotianCellDelegate>
{
    UITableView *hot_tableview;
    NSMutableArray *heightArray;//cell高度数组
    NSMutableArray *selectArray;//cell高度数组
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    heightArray=[[NSMutableArray alloc]init];
    selectArray=[[NSMutableArray alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"评论";
    NSInteger count=10;//数据条数
    for (int i=0; i<count; i++) {
        [heightArray addObject:[NSString stringWithFormat:@"%f",110*_my]];
        [selectArray addObject:@"0"];
    }
    
    [self add_table];
}


-(void)add_table
{
    hot_tableview = [[UITableView alloc]initWithFrame:Frame(0, NavHeight, WIDTH, HEIGHT-NavHeight) style:UITableViewStylePlain];
    [hot_tableview registerClass:[LiaotianTableViewCell class] forCellReuseIdentifier:@"LiaotianTableViewCell"];
    hot_tableview.delegate = self;
    hot_tableview.dataSource = self;
    hot_tableview.separatorStyle  = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:hot_tableview];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [heightArray[indexPath.row] floatValue];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LiaotianTableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"LiaotianTableViewCell" forIndexPath:indexPath];
    Cell.delegate=self;
    Cell.tag=indexPath.row +1;
    if ([selectArray[indexPath.row] isEqualToString:@"1"]) {
        Cell.selete =YES;
    }else{
        Cell.selete=NO;
    }
    [Cell status];
    Cell.likeAction = ^(UIButton *button) {
        NSLog(@"喜欢按钮");
    };
    return Cell;
}

-(void)sendCellHeiget:(NSString *)height LiaotianCelltag:(NSInteger)tag select:(Boolean)select
{
//    float old=[heightArray[tag-1] floatValue];
//    float new=old +[height floatValue];
//    NSLog(@"new==%f",new);
    if (select) {
        [selectArray replaceObjectAtIndex:tag-1 withObject:@"1"];
    }else{
        [selectArray replaceObjectAtIndex:tag-1 withObject:@"0"];
    }
    
    [heightArray replaceObjectAtIndex: tag-1 withObject: height];
//    NSLog(@"heightArray==%@",heightArray);
    [hot_tableview reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
