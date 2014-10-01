//
//  IDESourceCodeEditorContainerViewExplorer.h
//  MagnetRoof
//
//  Created by Daniel L. Alves on 1/10/14.
//  Copyright (c) 2014 Daniel L. Alves. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface IDESourceCodeEditorContainerViewExplorer : NSObject

@property( nonatomic, readwrite, weak )NSView *codeEditorContainerView;                // ( ??? ) @interface IDESourceCodeEditorContainerView : DVTLayoutView_ML : NSView
@property( nonatomic, readwrite, weak )NSScrollView *sourceTextScrollView;             // ( DVTKit.framework ) @interface DVTSourceTextScrollView : NSScrollView
@property( nonatomic, readwrite, weak )NSClipView *clipView;
@property( nonatomic, readwrite, unsafe_unretained )NSTextView *clippedSourceTextView; // ( DVTKit.framework ) @interface DVTSourceTextView : DVTCompletingTextView : DVTTextView : NSTextView
@property( nonatomic, readwrite, weak )NSRulerView *textSidebarView;                   // ( DVTKit.framework ) @interface DVTTextSidebarView : NSRulerView
@property( nonatomic, readwrite, weak )NSScroller *markedScroller;                     // ( DVTKit.framework ) @interface DVTMarkedScroller : NSScroller
@property( nonatomic, readwrite, weak )NSScroller *scroller;

+( instancetype )explorerWithIDESourceCodeEditorContainerView:( NSView * )codeEditorContainerView;

@end
