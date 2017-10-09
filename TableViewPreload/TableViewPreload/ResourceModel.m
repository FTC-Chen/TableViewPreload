//
//  ResourceModel.m
//  YDYXT
//
//  Created by Micheal on 16/2/20.
//  Copyright © 2016年 Medalands. All rights reserved.
//

#import "ResourceModel.h"

@implementation ResourceModel

- (void) setValue:(id)value forKey:(NSString *)key{
    
    if ([key isEqualToString:@"id"]) {
        
        self.ID = value;
    }
    else if ([key isEqualToString:@"description"]){
        
        self.des = value;
    }
    else
        [super setValue:value forKey:key];
}

@end
