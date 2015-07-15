//
//  RNMediaPlayer.m
//  RNMediaPlayer
//
//  Created by Chris Elly on 2015.07.12
//

#import "RNMediaPlayer.h"
#import "RCTLog.h"
#import "RCTConvert.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@implementation RNMediaPlayer
{
  AVPlayer *_player;
  AVPlayerViewController *_playerViewcontroller;
  
  NSString *_uri;
}


RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(open:(NSDictionary *)options)
{
  // this method can receive the following options
  //
  // uri: STRING (full resource name with file extension)
  //
  // missing: option to disable autoplay
  
  _uri = [options objectForKey:@"uri"];
  
  RCTLogInfo(@"Loading media: %@", _uri);
  NSString* mediaFilePath = [[NSBundle mainBundle] pathForResource:_uri ofType:nil];
  NSAssert(mediaFilePath, @"Media not found: %@", _uri);
  
  // refactor: implement an option to load network asset instead
  NSURL *fileURL = [NSURL fileURLWithPath:mediaFilePath];
  
  dispatch_async(dispatch_get_main_queue(), ^{
  
    AVPlayerViewController *playerViewController = [[AVPlayerViewController alloc] init];
    
    playerViewController.player = [AVPlayer playerWithURL:fileURL];
    
    // autoplay
    [playerViewController.player play];

    _playerViewcontroller = playerViewController;

    UIViewController *ctrl = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    UIView *view = [ctrl view];

    view.window.windowLevel = UIWindowLevelStatusBar;
    
    [ctrl presentViewController:playerViewController animated:TRUE completion: nil];
    
  });
}

@end