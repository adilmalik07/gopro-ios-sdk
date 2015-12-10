//
//  NSObject+Properties.m
//  kiosk
//
//  Created by Adil Malik on 06/11/2015.
//  Copyright © 2015 cape. All rights reserved.
//

#import "NSObject+Properties.h"
#import <objc/runtime.h>

@implementation NSObject (Properties)

+ (NSArray *)allPropertyNames
{
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    NSMutableArray *allProperties = [NSMutableArray array];
    for (i = 0; i < outCount; i++)
    {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        if (propName)
        {
            NSString *propertyName = [NSString stringWithCString:propName
                                                        encoding:[NSString defaultCStringEncoding]];
            [allProperties addObject:[propertyName copy]];
        }
    }
    free(properties);

    return allProperties;
}

@end