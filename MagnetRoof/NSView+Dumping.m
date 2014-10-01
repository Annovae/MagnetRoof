//
//  NSView+Dumping.m
//  MagnetRoof
//
//  Created by Daniel L. Alves on 1/10/14.
//  Copyright (c) 2014 Daniel L. Alves. All rights reserved.
//

#import "NSView+Dumping.h"

#pragma mark - Implementation

@implementation NSView( Dumping )

-( void )dumpWithIndent:( NSString * )indent
{
    NSString *clazz = NSStringFromClass([self class]);
    NSString *superclazz = NSStringFromClass([[self class] superclass]);

    NSString *info = @"";
    if ([self respondsToSelector:@selector(title)]) {
        NSString *title = [self performSelector:@selector(title)];
        if (title != nil && [title length] > 0)
            info = [info stringByAppendingFormat:@" title=%@", title];
    }
    if ([self respondsToSelector:@selector(stringValue)]) {
        NSString *string = [self performSelector:@selector(stringValue)];
        if (string != nil && [string length] > 0)
            info = [info stringByAppendingFormat:@" stringValue=%@", string];
    }
    NSString *tooltip = [self toolTip];
    if (tooltip != nil && [tooltip length] > 0)
        info = [info stringByAppendingFormat:@" tooltip=%@", tooltip];

    NSLog(@"%@%@:%@%@", indent, clazz, superclazz, info);

    if ([[self subviews] count] > 0) {
        NSString *subIndent = [NSString stringWithFormat:@"%@%@", indent, ([indent length]/2)%2==0 ? @"| " : @": "];
        for (NSView *subview in [self subviews])
            [subview dumpWithIndent:subIndent];
    }
}

-( id )searchSubviewWithClassNamed:( NSString * )className
{
    return [self searchSubviewWithClassNamed: className deep: YES];
}

-( id )searchSubviewWithClassNamed:( NSString * )className deep:( BOOL )deep
{
    NSView *found = nil;
    for( NSView *view in self.subviews )
    {
        if( [view.className isEqualToString: className] )
        {
            found = view;
            break;
        }

        if( deep )
        {
            found = [view searchSubviewWithClassNamed: className];
            if( found )
                break;
        }
    }
    return found;
}

@end
