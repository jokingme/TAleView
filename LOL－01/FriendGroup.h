//
//  FriendGroup.h
//  LOL－01
//
//  Created by Joker on 15/12/4.
//  Copyright © 2015年 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendGroup : NSObject
//声明属性
@property (nonatomic, strong) NSString *name;
@property (nonatomic) NSInteger online;
@property (nonatomic, strong) NSArray *friends;
@property (nonatomic) BOOL isopen;

//声明初始化方法
-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)GroupWithDictionary:(NSDictionary *)dict;

@end
