//
//  ACCListingRatingView.m
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ACCListingRatingView.h"
#import "UIColor+Helper.h"

@implementation ACCListingRatingView

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self p_setupView];
    }
    return self;
}

#pragma mark - Public

- (void)updateRating:(NSNumber *)rating withColorString:(NSString *)colorString {
    if (rating && colorString) {
        self.ratingLabel.text = [NSString stringWithFormat:@"%.1f",rating.doubleValue];
        self.view.backgroundColor = [UIColor colorFromHexString:colorString];
    } else {
        self.ratingLabel.text = nil;
        self.view.backgroundColor = [UIColor clearColor];
    }
}

#pragma mark - Private

- (void)p_setupView {
    [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    [self addSubview:_view];
    
    self.backgroundColor = [UIColor clearColor];
}

@end
