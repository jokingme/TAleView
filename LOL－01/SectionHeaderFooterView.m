//
//  SectionHeaderFooterView.m
//  LOL－01
//
//  Created by Joker on 15/12/4.
//  Copyright © 2015年 Joker. All rights reserved.
//

#import "SectionHeaderFooterView.h"
#import "FriendGroup.h"
@interface SectionHeaderFooterView()
@property (nonatomic,strong) UIButton *bgBtn;
@property (nonatomic,strong) UILabel *label;
@end

@implementation SectionHeaderFooterView
static NSString *headerViewIdentifier = @"headerView";
+ (instancetype)sectionHeaderViewTAbleView:(UITableView *)tableView {
    SectionHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerViewIdentifier];
    if (headerView == nil) {
        headerView = [[SectionHeaderFooterView alloc]initWithReuseIdentifier:headerViewIdentifier];
        
    }
    return headerView;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        //添加背景btn
        UIButton *bgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:bgBtn];
        //设置背景图片
        UIImage *img = [[UIImage imageNamed:@"buddy_header_bg"]resizableImageWithCapInsets:UIEdgeInsetsMake(1, 0, 1, 1)];
        [bgBtn setBackgroundImage:img forState:UIControlStateNormal];
        
        UIImage *highlightImg = [[UIImage imageNamed:@"buddy_header_bg_highlighted"]resizableImageWithCapInsets:UIEdgeInsetsMake(1, 0, 1, 1)];
        [bgBtn setBackgroundImage:highlightImg forState:UIControlStateHighlighted];
        
        //设置图标
        [bgBtn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        //设置标题字体颜色
        [bgBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        // 设置内容的显示
        bgBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //设置标题的偏移量
        bgBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        //设置整体的偏移量
        bgBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
        //设置bgBtn的 图片的内容模式
        bgBtn.imageView.contentMode = UIViewContentModeCenter;
        bgBtn.imageView.clipsToBounds = NO;
        
        //添加事件b
        [bgBtn addTarget:self action:@selector(bgBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *label = [[UILabel alloc]init];
        [self addSubview:label];
        
        label.textAlignment = NSTextAlignmentRight;
        
        _bgBtn = bgBtn;
        _label = label;
    }
    return self;
}

-(void)bgBtnClick:(UIButton *)btn{
    
    _friendGroup.isopen = !_friendGroup.isopen;
    
    if (_headerViewClick) {
        _headerViewClick();
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    //设置bgbtn的frame
    _bgBtn.frame = self.bounds;
    //设置label的frame
    CGFloat labelW = 100;
    CGFloat labelH = self.bounds.size.height;
    CGFloat labelX = self.bounds.size.width - labelW - 10;
    CGFloat labelY = 0;
    _label.frame = CGRectMake(labelX, labelY, labelW, labelH);
}

- (void)setFriendGroup:(FriendGroup *)friendGroup {
    _friendGroup = friendGroup;
    
    [_bgBtn setTitle:friendGroup.name forState:UIControlStateNormal];
    _label.text = [NSString stringWithFormat:@"%ld/%ld",friendGroup.online,friendGroup.friends.count];
    
    if (_friendGroup.isopen) {
        _bgBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{
        _bgBtn.imageView.transform = CGAffineTransformIdentity;
    }
}

@end
