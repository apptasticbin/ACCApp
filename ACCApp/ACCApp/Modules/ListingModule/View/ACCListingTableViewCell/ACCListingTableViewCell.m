//
//  ACCListingTableViewCell.m
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ACCListingTableViewCell.h"
#import "ACCVenueDataModel.h"
#import <UIImageView+AFNetworking.h>

@implementation ACCListingTableViewCell

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self p_setupCell];
    }
    return self;
}

- (void)updateVenueData:(ACCVenueDataModel *)venueData atIndexPath:(NSIndexPath *)indexPath{
    [self p_updateVenueName:venueData.name atIndexPath:indexPath];
    [self p_updateVenueDistance:venueData.distance];
    [self p_updateVenueImage:[venueData venuePhotoURLString]];
    [self p_updateRating:venueData.rating withColorString:venueData.ratingColor];
}

#pragma mark - Private

- (void)p_setupCell {
    
}

- (void)p_updateVenueImage:(NSString *)URLString {
    self.venueImageView.image = nil;
    [self.venueImageView setImageWithURL:[NSURL URLWithString:URLString]];
}

- (void)p_updateVenueName:(NSString *)name atIndexPath:(NSIndexPath *)indexPath {
    self.venueNameLabel.text = [NSString stringWithFormat:@"%@. %@", @(indexPath.row+1), name];
}

- (void)p_updateVenueDistance:(NSNumber *)distance {
    self.venueDistanceLabel.text = [NSString stringWithFormat:@"%@ m", distance];
}

- (void)p_updateRating:(NSNumber *)rating withColorString:(NSString *)colorString {
    
}

@end
