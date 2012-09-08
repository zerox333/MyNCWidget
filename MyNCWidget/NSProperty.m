//
//  NSProperty.m
//  HelloAlert
//
//  Created by ZeroX on 12-9-8.
//
//

#import "NSProperty.h"
#import "UIMyToast.h"

@implementation NSProperty

+ (NSDictionary *)propertiesDictionary
{
    NSDictionary *propertiesDic = [NSDictionary dictionaryWithContentsOfFile:PLIST_PATH];
    return propertiesDic;
}

+ (BOOL)isToastEnabled
{
    NSDictionary *propertiesDic = [NSProperty propertiesDictionary];
    BOOL isToastEnabled = [[propertiesDic objectForKey:TOAST_SWITCH_KEY] boolValue];
    NSLog(@"---------------\n isToastEnabled: %d \n-----------------", isToastEnabled);
    
    return isToastEnabled;
}

+ (NSString *)toastMessage
{
    NSDictionary *propertiesDic = [NSProperty propertiesDictionary];
    NSLog(@"---------------\n dic: %@ \n----------------------", propertiesDic);
    
    NSString *toastMessage = [propertiesDic objectForKey:TOAST_TEXT_KEY];
    NSLog(@"---------------\n toastMessage: %@ \n----------------------", toastMessage);
    return toastMessage;
}

@end
