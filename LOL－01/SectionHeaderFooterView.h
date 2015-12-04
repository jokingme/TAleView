//
//  SectionHeaderFooterView.h
//  LOL－01
//
//  Created by Joker on 15/12/4.
//  Copyright © 2015年 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendGroup.h"

@interface SectionHeaderFooterView : UITableViewHeaderFooterView
@property (nonatomic,strong) FriendGroup *friendGroup;
@property (nonatomic,strong) void (^headerViewClick)(void);
+ (instancetype)sectionHeaderViewTAbleView:(UITableView *)tableView;
@end
