//
//  WhiskeyViewController.m
//  alocator
//
//  Created by Alexandar on 5/24/16.
//  Copyright © 2016 Alexandar. All rights reserved.
//

#import "WhiskeyViewController.h"

@interface WhiskeyViewController ()
@property(weak, nonatomic) NSNumber *whiskeyAmount;
@property(weak, nonatomic) NSString *whiskeyText;
@property(weak, nonatomic) NSNumber *wholeNumber;
@end

@implementation WhiskeyViewController

- (IBAction)sliderValueDidChange:(UISlider *)sender {
    
    
    if (_wholeNumber <= 0) {
        [self.navigationItem setTitle:[NSString stringWithFormat:@"Wine"]];
    } else {
        [self alkieAmount:1 andOunces:0.4];
        [self.navigationItem setTitle:[NSString stringWithFormat:@"Whiskey (%@ %@)", self.wholeNumber, self.whiskeyText]];
    }
    
//    NSLog(@"Slider value changed to %f", sender.value);
    
}

-(void)buttonPressed:(UIButton *)sender;
{
    [self.beerPercentTextField resignFirstResponder];
    [self alkieAmount:1 andOunces:0.4];
}

- (void) alkieAmount:(float)ouncesInOneWhiskeyGlass andOunces:(float)alcoholPercentageOfWhiskey {
    
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12;
    float alcoholPercetageofBeer = [self.beerPercentTextField.text floatValue]/100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercetageofBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;

    float ouncesOfAlcoholPerWhiskeyGlass = ouncesInOneWhiskeyGlass * alcoholPercentageOfWhiskey;
    float numberOfWhiskeyGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal/ouncesOfAlcoholPerWhiskeyGlass;

    
    NSString *beerText;
    if(numberOfBeers == 1){
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }

    if(numberOfWhiskeyGlassesForEquivalentAlcoholAmount == 1){
        self.whiskeyText = NSLocalizedString(@"shot", @"singular glass");
    } else {
        self.whiskeyText = NSLocalizedString(@"shots", @"plural of glass");
    }
    
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@ of whiskey.",nil), numberOfBeers, beerText, [self.beerPercentTextField.text floatValue], numberOfWhiskeyGlassesForEquivalentAlcoholAmount, self.whiskeyText];
    self.resultLabel.text = resultText;
    
    
    self.wholeNumber = [NSNumber numberWithInt:ceilf(numberOfWhiskeyGlassesForEquivalentAlcoholAmount)];
    self.whiskeyAmount = [NSNumber numberWithDouble:numberOfWhiskeyGlassesForEquivalentAlcoholAmount];
    
}

@end
