//
//  Console.m
//  JavaScriptExample
//
//  Created by Apple on 2017/7/19.
//  Copyright © 2017年 PS. All rights reserved.
//

#import "Console.h"

@implementation Console
- (void)log{
    NSLog(@"%@ %@",[JSContext currentArguments],[NSThread currentThread]);
}
@end
