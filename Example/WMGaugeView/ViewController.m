//
//  ViewController.m
//  WMGaugeView
//
//  Created by William Markezana on 28/01/14.
//  Copyright (c) 2014 Will™. All rights reserved.
//

#import "ViewController.h"
#import "WMGaugeView.h"

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

@interface ViewController ()

@property (strong, nonatomic) IBOutlet WMGaugeView *gaugeView;
@property (strong, nonatomic) IBOutlet WMGaugeView *gaugeView2;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _gaugeView.style = [WMGaugeViewStyle3D2 new];
    _gaugeView.minValue = 0;
    _gaugeView.maxValue = 25;
    _gaugeView.showRangeLabels = YES;
    _gaugeView.rangeValues = @[ @1,                            @24,               @25              ];
    _gaugeView.rangeColors = @[ RGB(232, 111, 33),     RGB(27, 202, 33),   RGB(231, 32, 43)    ];
    _gaugeView.rangeLabels = @[ @"",                      @"",              @""        ];
    _gaugeView.rangeLabelsWidth = 50;
    _gaugeView.unitOfMeasurement = @"psi";
    _gaugeView.showUnitOfMeasurement = YES;
    _gaugeView.scaleDivisionsWidth = 0.000;
    _gaugeView.scaleSubdivisionsWidth = 0.000;
    _gaugeView.showScale = NO;
    _gaugeView.rangeLabelsFontColor = [UIColor blackColor];
    _gaugeView.rangeLabelsWidth = 0.04;
    _gaugeView.rangeLabelsFont = [UIFont fontWithName:@"Helvetica" size:0.04];
    _gaugeView.scaleStartAngle = 90;
    _gaugeView.scaleEndAngle = 270;
    _gaugeView.showInnerBackground = NO;
    
    [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:self
                                   selector:@selector(gaugeUpdateTimer:)
                                   userInfo:nil
                                    repeats:YES];
}

-(void)gaugeUpdateTimer:(NSTimer *)timer
{
    _gaugeView.value = rand()%(int)_gaugeView.maxValue;
    [_gaugeView2 setValue:rand()%(int)_gaugeView2.maxValue animated:YES duration:1.6 completion:^(BOOL finished) {
        NSLog(@"gaugeView2 animation complete");
    }];
}

@end
