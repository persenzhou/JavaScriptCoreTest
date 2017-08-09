//
//  Point2D.h
//  JavaScriptExample
//
//  Created by Apple on 2017/7/19.
//  Copyright © 2017年 PS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol Point2DExport <JSExport>

@property  CGFloat x;
@property  CGFloat y;


- (CGFloat)lenght;

@end

@interface Point2D : NSObject<Point2DExport>

@property (nonatomic,assign) CGFloat x;
@property (nonatomic,assign) CGFloat y;

- (CGFloat)lenght;

- (instancetype)initWithContent:(JSContext *)context;
@end
