//
//  NSString+Extension.m
//  LoveFreshBeen_OC
//
//  Created by lynn on 16/3/17.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (NSString *)cleanDecimalPointZear {
    
    NSInteger offset = self.length - 1;
    
    while (offset > 0) {
        NSString *s = [self substringWithRange:NSMakeRange(offset, 1)];
        
        
        if ([s isEqualToString:@"0"] || [s isEqualToString:@"."] ) {
            offset--;
        }else{
            break;
        }
    }
    return [self substringToIndex:offset + 1];
}

@end
