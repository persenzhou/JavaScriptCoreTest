//
//  Console.h
//  JavaScriptExample
//
//  Created by Apple on 2017/7/19.
//  Copyright © 2017年 PS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
@protocol ConsoleJSExport <JSExport>
- (void)log;
@end

@interface Console : NSObject<ConsoleJSExport>
- (void)log;
@end
