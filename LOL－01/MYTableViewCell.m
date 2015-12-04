//
//  MYTableViewCell.m
//  LOL－01
//
//  Created by Joker on 15/12/4.
//  Copyright © 2015年 Joker. All rights reserved.
//

#import "MYTableViewCell.h"
#import "Friends.h"
@implementation MYTableViewCell


- (void)setFriend:(Friends *)friend {
    _friend = friend;
    
    self.textLabel.text = friend.name;
    self.detailTextLabel.text = friend.intro;
    self.imageView.image = [UIImage imageNamed:friend.icon];
    self.textLabel.textColor = friend.vip ? [UIColor redColor] : [UIColor blackColor];
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
