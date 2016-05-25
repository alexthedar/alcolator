//
//  ViewController.m
//  alocator
//
//  Created by Alexandar on 5/23/16.
//  Copyright © 2016 Alexandar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(weak, nonatomic) NSNumber *wineAmount;
@property(weak, nonatomic) NSString *wineText;
@property(weak, nonatomic) NSNumber *wholeNumber;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)textFieldDidChange:(UITextField *)sender {
    NSString *enteredText = sender.text;
    float enteredNumber = [enteredText floatValue];
    if (enteredNumber == 0) {
        sender.text = nil;
    }
}
- (IBAction)sliderValueDidChange:(UISlider *)sender {
    

    if (_wholeNumber <= 0) {
        [self.navigationItem setTitle:[NSString stringWithFormat:@"Wine"]];
    } else {
        int numberOfBeers = self.beerCountSlider.value;
        int ouncesInOneBeerGlass = 12;
        float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue]/100;
        float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
        float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
        float ouncesInOneWineGlass = 5;
        float alcoholoPercentageOfWine = 0.13;
        float ouncesOfAlcoholPerWineGlass = ouncesInOneWineGlass * alcoholoPercentageOfWine;
        [self alkieAmount:ouncesOfAlcoholTotal andOunces:ouncesOfAlcoholPerWineGlass];
        float numberOfWineGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal/ouncesOfAlcoholPerWineGlass;
        self.wholeNumber = [NSNumber numberWithInt:ceilf(numberOfWineGlassesForEquivalentAlcoholAmount)];
        
        
        
        NSString *beerText;
        if(numberOfBeers == 1){
            beerText = NSLocalizedString(@"beer", @"singular beer");
        } else {
            beerText = NSLocalizedString(@"beers", @"plural of beer");
        }
        if(numberOfWineGlassesForEquivalentAlcoholAmount == 1){
            self.wineText = NSLocalizedString(@"glass", @"singular glass");
        } else {
            self.wineText = NSLocalizedString(@"glasses", @"plural of glass");
        }
        
        NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@ of wine.",nil), numberOfBeers, beerText, [self.beerPercentTextField.text floatValue], numberOfWineGlassesForEquivalentAlcoholAmount, _wineText];
        self.resultLabel.text = resultText;
        [self.navigationItem setTitle:[NSString stringWithFormat:@"Wine (%@ %@)", self.wholeNumber, self.wineText]];
        
    }
    
    NSLog(@"Slider value changed to %f", sender.value);

}
- (IBAction)buttonPressed:(UIButton *)sender {
    [self.beerPercentTextField resignFirstResponder];
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12;
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue]/100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    float ouncesInOneWineGlass = 5;
    float alcoholoPercentageOfWine = 0.13;
    float ouncesOfAlcoholPerWineGlass = ouncesInOneWineGlass * alcoholoPercentageOfWine;
    [self alkieAmount:ouncesOfAlcoholTotal andOunces:ouncesOfAlcoholPerWineGlass];
    float numberOfWineGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal/ouncesOfAlcoholPerWineGlass;



    
    NSString *beerText;
    if(numberOfBeers == 1){
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    if(numberOfWineGlassesForEquivalentAlcoholAmount == 1){
        self.wineText = NSLocalizedString(@"glass", @"singular glass");
    } else {
        self.wineText = NSLocalizedString(@"glasses", @"plural of glass");
    }
    
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@ of wine.",nil), numberOfBeers, beerText, [self.beerPercentTextField.text floatValue], numberOfWineGlassesForEquivalentAlcoholAmount, self.wineText];
    self.resultLabel.text = resultText;
    
    

    
}
- (IBAction)tapGestureDidFire:(UITapGestureRecognizer *)sender {
    [self.beerPercentTextField resignFirstResponder];
}

- (void) alkieAmount:(float)ouncesOfAlcoholTotal andOunces:(float)ouncesOfAlcoholPerWineGlass {
    float numberOfWineGlassesForEquivalentAlcoholAmount;
    numberOfWineGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal/ouncesOfAlcoholPerWineGlass;
    self.wholeNumber = [NSNumber numberWithInt:ceilf(numberOfWineGlassesForEquivalentAlcoholAmount)];
    self.wineAmount = [NSNumber numberWithDouble:numberOfWineGlassesForEquivalentAlcoholAmount];

}

@end
