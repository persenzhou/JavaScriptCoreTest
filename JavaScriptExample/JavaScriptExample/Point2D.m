//
//  Point3D.m
//  JavaScriptExample
//
//  Created by Apple on 2017/7/19.
//  Copyright © 2017年 PS. All rights reserved.
//

#import "Point2D.h"
@implementation Point2D

@synthesize x = _x;
@synthesize y = _y;


- (instancetype)initWithContent:(JSContext *)context{
    
    if (self = [super init]) {
        context[@"Point2D"] = [Point2D class];
    }
    
    CATransform3DScale
    CAReplicatorLayer
    
    return self;
}

- (CGFloat)lenght{
    return sqrt(self.x * self.x + self.y * self.y);
}

@end
