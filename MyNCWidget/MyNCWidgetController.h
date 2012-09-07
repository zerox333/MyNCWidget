//
//  MyNCWidgetController.h
//  MyNCWidget
//
//  Created by ding_yuanyi on 12-9-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SpringBoard/BBWeeAppController.h"

@interface MyNCWidgetController : NSObject <BBWeeAppController>
{
    UIView *_view;
}

- (UIView *)view;

@end