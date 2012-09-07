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

@implementation MyNCWidgetController

-(id)init
{
	if ((self = [super init]))
	{
	}

	return self;
}

-(void)dealloc
{
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

		UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 316, 71)];
		lbl.backgroundColor = [UIColor clearColor];
		lbl.textColor = [UIColor whiteColor];
		lbl.text = @"Hello, Notification Center!";
		lbl.textAlignment = UITextAlignmentCenter;
		[_view addSubview:lbl];
		[lbl release];
        
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
    UIMyToast *toast = [[UIMyToast alloc] init];
    [toast show:@"WoW~\nNotification Center" Gravity:TOAST_GRAVITY_CENTURE Length:TOAST_LENGTH_SHORT];
    [toast release];
}

@end