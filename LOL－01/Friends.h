//
//  Friends.h
//  LOL－01
//
//  Created by Joker on 15/12/4.
//  Copyright © 2015年 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friends : NSObject
@property (nonatomic,strong) NSString *icon;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *intro;
@property (nonatomic,assign) BOOL vip;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)friendWithDictionary:(NSDictionary *)dict;

@end
