//
//  ViewController.h
//  alocator
//
//  Created by Alexandar on 5/23/16.
//  Copyright © 2016 Alexandar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *beerPercentTextField;
@property (weak, nonatomic) IBOutlet UISlider *beerCountSlider;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

- (void) alkieAmount:(float)ouncesInOneGlass andOunces:(float)percentOfAlcoholPerGlass;

@end

