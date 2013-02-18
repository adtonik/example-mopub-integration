//
//  ViewController.m
//  MoPubExample
//
//  Created by Marshall A. Beddoe on 2/14/13.
//  Copyright (c) 2013 Marshall A. Beddoe. All rights reserved.
//

#import "ViewController.h"
#import "MPAdView.h"
#import "ADTClient.h"
#import "ADTClientDelegate.h"

@interface ViewController () <ADTClientDelegate, MPAdViewDelegate>

@property (nonatomic, retain) ADTClient* adtonik;
@property (nonatomic, strong) MPAdView* mpAdView;

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
    
  self.mpAdView = [[MPAdView alloc] initWithAdUnitId:@"8ebd24ea76ef11e281c11231392559e4" size:MOPUB_BANNER_SIZE];
  self.mpAdView.delegate = self;
  
  self.view.backgroundColor = [UIColor grayColor];

  [self.mpAdView loadAd];

  [self.view addSubview:self.mpAdView];
  
  self.adtonik = [[ADTClient alloc] initWithDelegate:self
                                           doRefresh:YES
                                               appID:@"ADTDemoApp"
                                           appSecret:@"ADTDemoApp"];
  
  [self.adtonik showSpinner:CGPointMake(275, 60) rootViewController:self];
  
  [self.adtonik start];  
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark ADTClient Delegate Methods

- (void)ADTClientDidReceiveAd:(ADTClient *)adtonik
{
  NSLog(@"AdTonik ad is available");
}

- (void)ADTClientDidReceiveMatch:(NSDictionary *)results
{
  NSLog(@"Debug match results: %@", results);
}

- (void)ADTClientErrorDidOccur:(NSError *)error
{
  NSLog(@"AdTonik error occurred: %@", [error localizedDescription]);
}

#pragma mark -
#pragma mark MPAdView Delegate Methods

- (UIViewController *)viewControllerForPresentingModalView
{
  return self;
}

@end
