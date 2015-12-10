//
//  NSObject+DictionaryToObject.m
//  kiosk
//
//  Created by Adil Malik on 05/11/2015.
//  Copyright © 2015 cape. All rights reserved.
//

#import "NSObject+DictionaryToObject.h"

@implementation NSObject (DictionaryToObject)

- (void)populateObjectValueFromDictionary:(NSDictionary *)dictionary withMappingDictionay:(NSDictionary *)mappingDictionary
{
    [mappingDictionary enumerateKeysAndObjectsUsingBlock: ^(NSString *_Nonnull jsonKey, id _Nonnull attribute, BOOL *_Nonnull stop) {
        [self setValue:[dictionary valueForKey:jsonKey] forKey:attribute];
    }];
}

@end