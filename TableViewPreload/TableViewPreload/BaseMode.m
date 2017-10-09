//
//  BaseMode.m
//  YDYXT
//
//  Created by Micheal on 16/1/28.
//  Copyright © 2016年 Medalands. All rights reserved.
//

#import "BaseMode.h"

@implementation BaseMode
// -- KVC
// -- KVC  Key-Value Coding
// -- KVO  Key-Value Observing
- (id) initWithDictionary:(NSDictionary *)dict{
    
    self = [super init];
    
    if (self) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

- (void) setValue:(id)value forKey:(NSString *)key{
    
    [super setValue:value forKey:key];
}

//找不到的key
- (void) setValue:(id)value forUndefinedKey:(NSString *)key{
    
   // NSLog(@"UndefinedKey %@ in %@",key,[self class]);
}

@end
