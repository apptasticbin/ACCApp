//
//  ACCListingRatingView.h
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACCListingRatingView : UIView

@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (strong, nonatomic) IBOutlet UIView *view;

- (void)updateRating:(NSNumber *)rating withColorString:(NSString *)colorString;

@end
