//
//  NSView+Dumping.h
//  MagnetRoof
//
//  Created by Daniel L. Alves on 1/10/14.
//  Copyright (c) 2014 Daniel L. Alves. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface NSView( Dumping )

-( void )dumpWithIndent:( NSString * )indent;

-( id )searchSubviewWithClassNamed:( NSString * )className;
-( id )searchSubviewWithClassNamed:( NSString * )className deep:( BOOL )deep;

@end
