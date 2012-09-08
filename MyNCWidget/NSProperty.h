//
//  NSProperty.h
//  HelloAlert
//
//  Created by ZeroX on 12-9-8.
//
//

#define PLIST_PATH @"/var/mobile/Library/Preferences/com.zerox.MySetting.plist"
#define TOAST_SWITCH_KEY @"SwitchExample"
#define TOAST_TEXT_KEY @"TextExample"

#import <Foundation/Foundation.h>

@interface NSProperty : NSObject

+ (NSDictionary *)propertiesDictionary;

+ (BOOL)isToastEnabled;

+ (NSString *)toastMessage;

@end
