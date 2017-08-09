//
//  BoyFirend.h
//  JavaScriptExample
//
//  Created by Apple on 2017/7/19.
//  Copyright © 2017年 PS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol BoyFirendJSExport <JSExport>

@property id boyFirend;

@end

@interface BoyFirend :NSObject <BoyFirendJSExport>

@property (nonatomic,strong) id girlFriend;

@property (nonatomic,weak) JSContext *context;
@end
