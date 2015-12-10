//
//  NSString+Inflections.m
//  kiosk
//
//  Created by Adil Malik on 06/11/2015.
//  Copyright © 2015 cape. All rights reserved.
//

#import "NSString+Inflections.h"

@implementation NSString (Inflections)

- (NSString *)underscore
{
    NSScanner *scanner = [NSScanner scannerWithString:self];
    scanner.caseSensitive = YES;

    NSCharacterSet *uppercase = [NSCharacterSet uppercaseLetterCharacterSet];
    NSCharacterSet *lowercase = [NSCharacterSet lowercaseLetterCharacterSet];

    NSString *buffer = nil;
    NSMutableString *output = [NSMutableString string];

    while (scanner.isAtEnd == NO)
    {
        if ([scanner scanCharactersFromSet:uppercase intoString:&buffer])
        {
            [output appendString:[buffer lowercaseString]];
        }

        if ([scanner scanCharactersFromSet:lowercase intoString:&buffer])
        {
            [output appendString:buffer];
            if (!scanner.isAtEnd)
            {
                [output appendString:@"_"];
            }
        }
    }

    return [NSString stringWithString:output];
}

- (NSString *)camelcase
{
    NSArray *components = [self componentsSeparatedByString:@"_"];
    NSMutableString *output = [NSMutableString string];

    for (NSUInteger i = 0; i < components.count; i++)
    {
        if (i == 0)
        {
            [output appendString:components[i]];
        }
        else
        {
            [output appendString:[components[i] capitalizedString]];
        }
    }

    return [NSString stringWithString:output];
}

- (NSString *)classify
{
    return [[self camelcase] capitalizedString];
}

@end