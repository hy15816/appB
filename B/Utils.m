//
//  Utils.m
//  B
//
//  Created by AEF-RD-1 on 15/10/19.
//  Copyright (c) 2015年 hyIm. All rights reserved.
//

#import "Utils.h"

@implementation Utils
+(NSDate *)dateString:(NSString *)string formate:(NSString *)format{
    NSDate *date;
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    [df setDateFormat:format];
    date = [df dateFromString:string];
    return date;
}

+(NSString *)dateWithFormate:(NSString *)format{
    
    NSString *str;
    NSDate *d = [NSDate date];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    [df setDateFormat:format];
    str = [df stringFromDate:d];
    
    return str;
}
@end
