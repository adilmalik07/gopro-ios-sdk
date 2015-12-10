//
//  NSObject+DictionaryToObject.h
//  kiosk
//
//  Created by Adil Malik on 05/11/2015.
//  Copyright © 2015 cape. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DictionaryToObject)

- (void)populateObjectValueFromDictionary:(NSDictionary *)dictionary withMappingDictionay:(NSDictionary *)mappingDictionary;

@end