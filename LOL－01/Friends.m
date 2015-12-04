//
//  Friends.m
//  LOL－01
//
//  Created by Joker on 15/12/4.
//  Copyright © 2015年 Joker. All rights reserved.
//

#import "Friends.h"

@implementation Friends

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)friendWithDictionary:(NSDictionary *)dict {
    return [[self alloc]initWithDictionary:dict];
}
@end
