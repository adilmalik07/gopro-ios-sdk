//
//  NSString+Inflections.h
//  kiosk
//
//  Created by Adil Malik on 06/11/2015.
//  Copyright © 2015 cape. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Inflections)

- (NSString *)underscore;

- (NSString *)camelcase;

- (NSString *)classify;

@end