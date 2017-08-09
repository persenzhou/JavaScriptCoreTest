//
//  BoyFirend.m
//  JavaScriptExample
//
//  Created by Apple on 2017/7/19.
//  Copyright © 2017年 PS. All rights reserved.
//

#import "BoyFirend.h"


@implementation BoyFirend
@synthesize boyFirend = _boyFirend;

- (void)setGirlFriend:(JSValue *)girlFriend{
    
    _girlFriend = [JSManagedValue managedValueWithValue:girlFriend];
    
    [_context.virtualMachine addManagedReference:_girlFriend withOwner:self];

//    _girlFriend = girlFriend;

}

- (void)dealloc
{
    NSLog(@"dealloc");
     [_context.virtualMachine removeManagedReference:_girlFriend withOwner:self];
}
@end
