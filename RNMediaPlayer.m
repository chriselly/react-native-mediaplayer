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

  _uri = [options objectForKey:@"uri"];

  NSString *encodedString = [_uri stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
  NSURL *myURL = [[NSURL alloc] initWithString:encodedString];


  dispatch_async(dispatch_get_main_queue(), ^{

    AVPlayerViewController *playerViewController = [[AVPlayerViewController alloc] init];

    playerViewController.player = [AVPlayer playerWithURL: myURL];

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
