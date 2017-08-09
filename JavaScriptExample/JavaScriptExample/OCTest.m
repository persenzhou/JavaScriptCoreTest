//
//  OCTest.m
//  JavaScriptExample
//
//  Created by Apple on 2017/7/19.
//  Copyright © 2017年 PS. All rights reserved.
//

#import "OCTest.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "Point2D.h"
#import "Console.h"
#import "BoyFirend.h"
JSContext *context_;

@implementation OCTest
+(void)initialize{
    
    context_= [[JSContext alloc] init];
    
    context_.exceptionHandler = ^(JSContext *context, JSValue *exception) {
        context.exception = exception;
        NSLog(@"%@",exception);
    };
    
    Console *console = [[Console alloc] init];
    
    context_[@"console"] = console;

}

+ (void)testConstructorBridge{
    
    context_[@"TestClass"] = [TestClass class];
    
    JSValue *result0 = [context_ evaluateScript:@"(new TestClass())"];
    JSValue *result1 = [context_ evaluateScript:@"(new TestClass(\"Hello, world!\")).string"];
    
    JSValue *result2 = [context_ evaluateScript:@"(typeof TestClass.prototype.constructor)"];
    
    JSValue *result3 = [context_ evaluateScript:@"(new TestClass.prototype.constructor)"];
    
    NSLog(@"\n result0 : %@,\n result1:%@, \n result2:%@,  \n result3 = %@, \n class = %@",result0,result1,result2,result3,context_[@"TestClass"]);
}

+ (void)testJSCallOCFormBlock{
    
    context_[@"sum"] = ^(int a, int b,int c){
        
        return a + b;
    };
    
    JSValue *value = [context_ evaluateScript:@"sum(1,2)"];
    
    NSLog(@"%f",[value toDouble]);
}

+ (void)testExport{
    
    Point2D *point = [[Point2D alloc] initWithContent:context_];
    point.x = 1;
    point.y = 2;
    
    context_[@"point"] = point;
    
    NSString *script = @"point.lenght();";
    
    JSValue *value = [context_ evaluateScript:script];
    NSLog(@"testExport = %@",value);
}

+ (JSContext *)testContext{
    return context_;
}

+ (JSValue *)loadScript:(NSString *)fileName{
    
    NSString *jsFile = [NSString stringWithFormat:@"%@/%@.js",[NSBundle mainBundle].resourcePath,fileName];
    
    NSString *script = [NSString stringWithContentsOfFile:jsFile encoding:NSUTF8StringEncoding error:nil];
    
    JSValue *value = [context_ evaluateScript:script];
    
    JSValue *boyvalue = [context_ evaluateScript:@"girl.boyFriend = point"];
    
    NSLog(@"%@",[context_ evaluateScript:@"typeof girl.boyFriend"]);

    return value;
}


+ (void)textValueManager{
    
    JSContext *content = [[JSContext alloc] init];
    
    content.exceptionHandler = ^(JSContext *context, JSValue *exception) {
        context.exception = exception;
        NSLog(@"%@",exception);
    };
    Console *console = [[Console alloc] init];
    content[@"console"] = console;
    
    NSString *jsFile = [NSString stringWithFormat:@"%@/%@.js",[NSBundle mainBundle].resourcePath,@"test"];
    
    NSString *script = [NSString stringWithContentsOfFile:jsFile encoding:NSUTF8StringEncoding error:nil];
    
    [content evaluateScript:script];// 执行文件js
    
    BoyFirend *boyFriend = [[BoyFirend alloc] init];
    
    content[@"boyFriend"] = boyFriend;
    
    [content evaluateScript:@"girl.boyFriend = boyFriend;"];//
    
    NSLog(@"%@",boyFriend.girlFriend);
    boyFriend.girlFriend = [content evaluateScript:@"currentGirl();"];
    NSLog(@"%@",boyFriend.girlFriend);
    
}

+ (void)machine1{
    JSVirtualMachine *mach1 = [[JSVirtualMachine alloc] init];
    JSContext *cottext1 = [[JSContext alloc] initWithVirtualMachine:mach1];
    
    cottext1.exceptionHandler = ^(JSContext *context, JSValue *exception) {
        context.exception = exception;
        NSLog(@"%@",exception);
    };
    Console *console = [[Console alloc] init];
    cottext1[@"console"] = console;
    
    NSString *jsFile = [NSString stringWithFormat:@"%@/%@.js",[NSBundle mainBundle].resourcePath,@"test"];
    
    NSString *script = [NSString stringWithContentsOfFile:jsFile encoding:NSUTF8StringEncoding error:nil];
    
    [cottext1 evaluateScript:script];// 执行文件js
}

+ (void)machine2{
    JSVirtualMachine *mach2 = [[JSVirtualMachine alloc] init];
    JSContext *cottext2 = [[JSContext alloc] initWithVirtualMachine:mach2];
    
    cottext2.exceptionHandler = ^(JSContext *context, JSValue *exception) {
        context.exception = exception;
        NSLog(@"%@",exception);
    };
    Console *console = [[Console alloc] init];
    cottext2[@"console"] = console;
    
    NSString *jsFile = [NSString stringWithFormat:@"%@/%@.js",[NSBundle mainBundle].resourcePath,@"test"];
    
    NSString *script = [NSString stringWithContentsOfFile:jsFile encoding:NSUTF8StringEncoding error:nil];
    
    [cottext2 evaluateScript:script];// 执行文件js
}

+ (void)textMachine{
    
    [self machine1];
    [self machine2];
    
}

@end

@implementation TestClass

@synthesize string = _string;

- (instancetype)initWithString:(NSString *)string
{
    if (!(self = [super init]))
        return nil;
    
    _string = [string copy];
    
    return self;
}

@end
