//
//  ViewController.m
//  LOL－01
//
//  Created by Joker on 15/12/4.
//  Copyright © 2015年 Joker. All rights reserved.
//

#import "ViewController.h"
#import "Friends.h"
#import "MYTableViewCell.h"
#import "FriendGroup.h"
#import "SectionHeaderFooterView.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *heros;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 20)style:UITableViewStylePlain];
    
    [self.view addSubview:tableView];
    

    tableView.delegate = self;
    tableView.dataSource = self;
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSArray *)heros
{
    if (_heros == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"hero" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *model = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            FriendGroup *friendGroup = [FriendGroup GroupWithDictionary:dict];
            [model addObject:friendGroup];
        }
        _heros = model;
    }
    return _heros;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.heros.count;
}
//每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    FriendGroup *friendGroup = self.heros[section];
    if (friendGroup.isopen) {
        return friendGroup.friends.count;
    }
    return 0;
}

//单元格内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    MYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[MYTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    FriendGroup *friendGroup = self.heros[indexPath.section];
    Friends *friend = friendGroup.friends[indexPath.row];
    cell.friend = friend;
    return cell;
}

////section头标题
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    FriendGroup *friendGroup = self.heros[section];
//    return friendGroup.name;
//}

//创建section头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    //创建自定义的section的头视图
    SectionHeaderFooterView *headerView = [SectionHeaderFooterView sectionHeaderViewTAbleView:tableView];
    FriendGroup *friendGroup = self.heros[section];
    
    headerView.friendGroup = friendGroup;
    
    headerView.headerViewClick = ^{
        [tableView reloadData];
    };
    
    return headerView;
}

//设置section的头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
