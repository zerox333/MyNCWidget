//
//  MyNCWidgetController.m
//  MyNCWidget
//
//  Created by ding_yuanyi on 12-9-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import "MyNCWidgetController.h"
#import "UIMyToast.h"
#import "NSProperty.h"

@implementation MyNCWidgetController

-(id)init
{
	if ((self = [super init]))
	{
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(updateText:)
                                                     name:TOAST_SHOW_TEXT
                                                   object:nil];
	}

	return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:TOAST_SHOW_TEXT
                                                  object:nil];
    
	[_view release];
	[super dealloc];
}

- (UIView *)view
{
	if (_view == nil)
	{
		_view = [[UIView alloc] initWithFrame:CGRectMake(2, 0, 316, 71)];

		UIImage *bg = [[UIImage imageWithContentsOfFile:@"/System/Library/WeeAppPlugins/StocksWeeApp.bundle/WeeAppBackground.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:71];
        
		UIImageView *bgView = [[UIImageView alloc] initWithImage:bg];
		bgView.frame = CGRectMake(0, 0, 316, 71);
		[_view addSubview:bgView];
		[bgView release];

		_label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 316, 71)];
		_label.backgroundColor = [UIColor clearColor];
		_label.textColor = [UIColor whiteColor];
		_label.text = @"Hello, Notification Center!";
		_label.textAlignment = UITextAlignmentCenter;
		[_view addSubview:_label];
		[_label release];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchAction:)];
        [_view addGestureRecognizer:tapGesture];
        [tapGesture release];
	}

	return _view;
}

- (float)viewHeight
{
	return 71.0f;
}

- (void)touchAction:(UITapGestureRecognizer *)tapGesture
{
    if ([NSProperty isToastEnabled])
    {
        NSString *message = [NSProperty toastMessage];
        
        UIMyToast *toast = [[UIMyToast alloc] init];
        [toast show:message Gravity:TOAST_GRAVITY_CENTURE Length:TOAST_LENGTH_SHORT];
        [toast release];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:TOAST_SHOW_TEXT object:message];
    }
}

- (void)updateText:(NSNotification *)notification
{
    NSString *text = [notification object];
    if (text)
    {
        _label.text = text;
    }
}

@end