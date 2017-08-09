//
//  OCTest.h
//  JavaScriptExample
//
//  Created by Apple on 2017/7/19.
//  Copyright © 2017年 PS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import <UIKit/UIKit.h>
@protocol TestInterface <JSExport>
- (instancetype)initWithString:(NSString *)string;
@property (readonly) NSString *string;
@end
@interface TestClass : NSObject <TestInterface>
@end

@interface OCTest : NSObject

+ (JSContext *)testContext;
+ (void)testConstructorBridge;
+ (void)testJSCallOCFormBlock;
+ (void)testExport;
+ (JSValue *)loadScript:(NSString *)fileName;
+ (void)textValueManager;
+ (void)textMachine;
@end

@protocol UIButtonJSExport <JSExport>
@property (readonly) NSString *text;
@end
