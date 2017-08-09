//
//  ViewController.swift
//  JavaScriptExample
//
//  Created by Apple on 2017/7/19.
//  Copyright © 2017年 PS. All rights reserved.
//

import UIKit
import JavaScriptCore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
//        test1()
//        test2()
//        test3()
//        test4()
//        testConstructorBridge()
//        testJSCallOCFormBlock()
//        testExport()
//        loadScript(fileName: "test")
        OCTest.textValueManager()
//        OCTest.textMachine()
    }

    // 执行js
    func test1() -> Void {
        
        let context = JSContext()
        
        let value : JSValue! = context?.evaluateScript("1 + 2")

        // 在 JSValue 转换 OC number时 建议使用 toDouble的方式
        print(value.toDouble())
    }

    
    // 塞闭包，call 调用
    func test2() -> Void {
        
        let context = JSContext()
        
        func sum(_ a:NSNumber, _ b:NSNumber) -> NSNumber {
            return NSNumber(integerLiteral:a.intValue + b.intValue)
        }
        
        func sum1() -> [Any]! {
            return JSContext.currentArguments()
        }
        
        let sumKey = "sum" as NSString
        
        // 塞进去一个闭包
        context?.setObject(sum1, forKeyedSubscript: sumKey)

        let value : JSValue! = context?.objectForKeyedSubscript(sumKey)?.call(withArguments: nil);
        
        print(value)
    }
    
    //捕获 js错误打印
    func test3() -> Void {
        
        let context = JSContext()
        
        //((JSContext?, JSValue?) -> Swift.Void)!
        context?.exceptionHandler = {(context :JSContext?,value :JSValue?) in
            
            context?.exception = value
            // 打印 exception
            if let exception = value {
                print(exception)
            }
        }
        
        let _ = context?.evaluateScript("a + b")
    }
    
    func test4() -> Void {
        let script = "function sum(a,b) {return a+b }"
        
        let sumKey = "sum" as NSString
        
        let context = JSContext()
        
        let _ = context?.evaluateScript(script)

        let value : JSValue! = context?.objectForKeyedSubscript(sumKey)?.call(withArguments: [NSNumber(integerLiteral:1),NSNumber(integerLiteral:2)])
        
        print(value)
    }
    
    func testConstructorBridge() -> Void {
        OCTest.testConstructorBridge()
    }
    
    func testJSCallOCFormBlock() -> Void {
        
        OCTest.testJSCallOCFormBlock()
    }
    
    func testExport() -> Void {
        OCTest.testExport()
    }
    
    func loadScript(fileName: String) -> JSValue! {
        return OCTest.loadScript(fileName)
    }
}

