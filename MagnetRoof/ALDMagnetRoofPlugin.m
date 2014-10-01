//
//  ALDMagnetRoofPlugin.m
//  MagnetRoof
//
//  Created by Daniel L. Alves on 29/9/14.
//  Copyright (c) 2014 Daniel L. Alves. All rights reserved.
//

#import "ALDMagnetRoofPlugin.h"

// osx
#import <AppKit/AppKit.h>

// plugin
#import "IDESourceCodeEditorContainerViewExplorer.h"
#import "NSView+Dumping.h"

#pragma mark - Class Variables

static ALDMagnetRoofPlugin *mySharedPlugin = nil;

#pragma mark - Implementation

@implementation ALDMagnetRoofPlugin

#pragma mark - Ctors & Dtor

-( instancetype )init
{
    self = [super init];
    if( self )
    {
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector( applicationDidFinishLaunching: )
                                                     name: NSApplicationDidFinishLaunchingNotification
                                                   object: nil];

        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector( applicationDidBecomeActive: )
                                                     name: NSApplicationDidBecomeActiveNotification
                                                   object: nil];
    }
    return self;
}

-( void )dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver: self
                                                    name: NSApplicationDidFinishLaunchingNotification
                                                  object: nil];

    [[NSNotificationCenter defaultCenter] removeObserver: self
                                                    name: NSApplicationDidBecomeActiveNotification
                                                  object: nil];
}

#pragma mark - Application Lifecycle

-( void )applicationDidFinishLaunching:( NSNotification * )notification
{
//    NSLog( @"applicationDidFinishLaunching" );
//
//    NSLog( @"Notification %@", notification );
//    NSLog( @"Notification user info %@", notification.userInfo );
//    NSLog( @"Notification object %@", notification.object );
//
//    NSLog( @"Key window %@", [NSApp keyWindow] );
//    NSLog( @"Key window content view %@", [[NSApp keyWindow] contentView] );
//    NSLog( @"Main window %@", [NSApp mainWindow] );
//    NSLog( @"Main window content view %@", [[NSApp mainWindow] contentView] );
//
//    NSArray *windows = [NSApp windows];
//    NSUInteger nWindows = windows.count;
//    NSLog( @"N windows = %d", ( int )nWindows );
//
//    if( nWindows )
//    {
//        NSLog( @"Windows %@", windows );
//    }
}

-( void )applicationDidBecomeActive:( NSNotification * )notification
{
    NSLog( @"applicationDidBecomeActive" );

    NSLog( @"Notification %@", notification );
    NSLog( @"Notification user info %@", notification.userInfo );
    NSLog( @"Notification object %@", notification.object );
    
    NSLog( @"Key window %@", [NSApp keyWindow] );
    NSLog( @"Key window content view %@", [[NSApp keyWindow] contentView] );
    NSLog( @"Main window %@", [NSApp mainWindow] );
    NSLog( @"Main window content view %@", [[NSApp mainWindow] contentView] );

    NSArray *windows = [NSApp windows];
    NSUInteger nWindows = windows.count;
    NSLog( @"N windows = %d", ( int )nWindows );

    if( nWindows )
    {
        NSLog( @"Windows %@", windows );

        for( NSWindow *window in windows )
        {
            if( [window.className isEqualToString: @"IDEWorkspaceWindow"] )
            {
                NSView *contentView = [window contentView];
                NSView *sourceCodeEditorContainerView = [contentView searchSubviewWithClassNamed: @"IDESourceCodeEditorContainerView"];

                IDESourceCodeEditorContainerViewExplorer *explorer = [IDESourceCodeEditorContainerViewExplorer explorerWithIDESourceCodeEditorContainerView: sourceCodeEditorContainerView];
                NSLog( @"%@", explorer );

                CGRect rect = explorer.clippedSourceTextView.frame;
                rect.size.height += explorer.clipView.frame.size.height - [[explorer.clippedSourceTextView layoutManager] defaultLineHeightForFont: explorer.clippedSourceTextView.font];
                explorer.clippedSourceTextView.frame = rect;
            }
        }
    }
}

#pragma mark - Plugin Lifecycle

+( void )pluginDidLoad:( NSBundle * )plugin
{
    static dispatch_once_t onceToken;
    dispatch_once( &onceToken, ^{
        mySharedPlugin = [self new];
    });
}

@end
