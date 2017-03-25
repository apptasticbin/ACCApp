//
//  ACCListingTableViewCell.h
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ACCListingRatingView;
@class ACCVenueDataModel;

@interface ACCListingTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *venueImageView;
@property (weak, nonatomic) IBOutlet UILabel *venueNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *venueDistanceLabel;
@property (weak, nonatomic) IBOutlet ACCListingRatingView *ratingView;

- (void)updateVenueData:(ACCVenueDataModel *)venueData atIndexPath:(NSIndexPath *)indexPath;

@end
