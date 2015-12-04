//
//  FriendGroup.m
//  LOL－01
//
//  Created by Joker on 15/12/4.
//  Copyright © 2015年 Joker. All rights reserved.
//

#import "FriendGroup.h"
#import "Friends.h"

@implementation FriendGroup

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        NSMutableArray *array = [NSMutableArray array];
        
        for (NSDictionary *dit in self.friends) {
            Friends *friend = [Friends friendWithDictionary:dit];
            [array addObject:friend];
        }
        self.friends = array;
        
    }
    
    return self;
}

+ (instancetype)GroupWithDictionary:(NSDictionary *)dict {
    return [[self alloc]initWithDictionary:dict];
}

@end
