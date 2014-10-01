//
//  IDESourceCodeEditorContainerViewExplorer.m
//  MagnetRoof
//
//  Created by Daniel L. Alves on 1/10/14.
//  Copyright (c) 2014 Daniel L. Alves. All rights reserved.
//

#import "IDESourceCodeEditorContainerViewExplorer.h"

// plugin
#import "NSView+Dumping.h"

#pragma mark - Implementation

@implementation IDESourceCodeEditorContainerViewExplorer

/**
 *  The expected hyerarchy is:
 *
 *  IDESourceCodeEditorContainerView
 *  | DVTSourceTextScrollView
 *  | : NSClipView
 *  | : | DVTSourceTextView
 *  | : DVTTextSidebarView
 *  | : DVTMarkedScroller
 *  | : NSScroller
 */
+( instancetype )explorerWithIDESourceCodeEditorContainerView:( NSView * )codeEditorContainerView
{
    IDESourceCodeEditorContainerViewExplorer *temp = [self new];

    if( [codeEditorContainerView.className isEqualToString: @"IDESourceCodeEditorContainerView"] )
    {
        temp.codeEditorContainerView = codeEditorContainerView;
        temp.sourceTextScrollView = [codeEditorContainerView searchSubviewWithClassNamed: @"DVTSourceTextScrollView" deep: NO];

        NSView *sourceTextScrollView = temp.sourceTextScrollView;
        if( sourceTextScrollView )
        {
            temp.clipView = [sourceTextScrollView searchSubviewWithClassNamed: @"NSClipView" deep: NO];

            if( temp.clipView )
                temp.clippedSourceTextView = [temp.clipView searchSubviewWithClassNamed: @"DVTSourceTextView" deep: NO];

            temp.textSidebarView = [sourceTextScrollView searchSubviewWithClassNamed: @"DVTTextSidebarView" deep: NO];
            temp.markedScroller = [sourceTextScrollView searchSubviewWithClassNamed: @"DVTMarkedScroller" deep: NO];
            temp.scroller = [sourceTextScrollView searchSubviewWithClassNamed: @"NSScroller" deep: NO];
        }
    }

    return temp;
}

-( NSString * )description
{
    return [NSString stringWithFormat: @"%@\n\t%@\n\t%@\n\t%@\n\t%@\n\t%@\n\t%@\n\t%@",
                                       [super description],
                                       _codeEditorContainerView,
                                       _sourceTextScrollView,
                                       _clipView,
                                       _clippedSourceTextView,
                                       _textSidebarView,
                                       _markedScroller,
                                       _scroller];
}

@end
