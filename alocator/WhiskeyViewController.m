//
//  WhiskeyViewController.m
//  alocator
//
//  Created by Alexandar on 5/24/16.
//  Copyright © 2016 Alexandar. All rights reserved.
//

#import "WhiskeyViewController.h"

@interface WhiskeyViewController ()

@end

@implementation WhiskeyViewController

-(void)buttonPressed:(UIButton *)sender;
{
    [self.beerPercentTextField resignFirstResponder];
    
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12;
    float alcoholPercetageofBeer = [self.beerPercentTextField.text floatValue]/100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercetageofBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    float ouncesInOneWhiskeyGlass = 1;
    float alcoholPercentageOfWhiskey= 0.4;
    float ouncesOfAlcoholPerWhiskeyGlass = ouncesInOneWhiskeyGlass * alcoholPercentageOfWhiskey;
    int numberOfWhiskeyGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal/ouncesOfAlcoholPerWhiskeyGlass;
    
    NSString *beerText;
    if(numberOfBeers == 1){
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    NSString *whiskeytext;
    if(numberOfWhiskeyGlassesForEquivalentAlcoholAmount == 1){
        whiskeytext = NSLocalizedString(@"shot", @"singular glass");
    } else {
        whiskeytext = NSLocalizedString(@"shots", @"plural of glass");
    }
    
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@ of whiskey.",nil), numberOfBeers, beerText, [self.beerPercentTextField.text floatValue], numberOfWhiskeyGlassesForEquivalentAlcoholAmount, whiskeytext];
    self.resultLabel.text = resultText;
    
    self.navigationItem.title = [NSString stringWithFormat:NSLocalizedString(@"Whiskey (%.1f %@)", nil), numberOfWhiskeyGlassesForEquivalentAlcoholAmount, whiskeytext];

}


@end
