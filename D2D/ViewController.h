//
//  ViewController.h
//  D2D
//
//  Created by jaya prakash rao polsani on 15/12/12.
//  Copyright (c) 2012 jaya prakash rao polsani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "PhotoViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController
{
    
    UIScrollView *photo_ScrollView;
    NSString *sample;
    NSString *str;
    MPMoviePlayerController *moviePlayer;
}

@property(nonatomic,strong) IBOutlet UIScrollView *photo_ScrollView;
@property(nonatomic,strong) NSMutableArray *imagesArray;
@property(nonatomic,strong) NSMutableArray *itemnameArray;
@property(nonatomic,strong) NSMutableArray *itempriceArray;
@property(nonatomic,retain) NSString *sample;
@property(nonatomic,strong) NSString *str;

@property(nonatomic,strong) PhotoViewController *photovc;

@end
