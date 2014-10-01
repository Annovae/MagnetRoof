//
//  ALDMagnetRoofPlugin.h
//  MagnetRoof
//
//  Created by Daniel L. Alves on 29/9/14.
//  Copyright (c) 2014 Daniel L. Alves. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Don't forget to set every target 'Skip Install' build setting to 'NO'. If you don't,
 *  this plugin won't be installed on build.
 *
 *  These were of great help:
 *
 *  - http://www.blackdogfoundry.com/blog/creating-an-xcode4-plugin/
 *  - http://www.blackdogfoundry.com/blog/common-xcode4-plugin-techniques/
 *  - http://www.blackdogfoundry.com/blog/debugging-your-xcode-plugin/
 *  - http://stackoverflow.com/a/26143958/2933312
 *  - https://github.com/omz/Dash-Plugin-for-Xcode
 *  - https://github.com/omz/ColorSense-for-Xcode
 *
 *  Tools:
 *
 *  - http://stevenygard.com/projects/class-dump/ (brew install class-dump)
 */
@interface ALDMagnetRoofPlugin : NSObject

+( void )pluginDidLoad:( NSBundle * )plugin;

@end
