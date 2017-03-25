//
//  ACCListingViewController.m
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ACCListingViewController.h"
#import "ACCListingTableViewCell.h"
#import "ACCVenueDataModel.h"
#import "IACCListingPresenter.h"
#import "IACCListingView.h"


static NSString *ACCListingViewControllerCellId = @"ACCListingViewControllerCellId";

@interface ACCListingViewController ()<IACCListingView>

@property (nonatomic, strong) id<IACCListingPresenter> presenter;
@property (nonatomic, strong) NSArray<ACCVenueDataModel *> *venues;

@end

@implementation ACCListingViewController

- (void)viewDidLoad {
    [self p_setupTableView];
    [self p_loadNearbyVenues];
}

#pragma mark - IACCListingView

- (void)nearbyVenuesLoaded:(NSArray *)venues {
    [self p_stopRefreshing];
    [self setVenues:venues];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.venues.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ACCListingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ACCListingViewControllerCellId];
    if (!cell) {
        cell = [[ACCListingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                              reuseIdentifier:ACCListingViewControllerCellId];
    }
    [cell updateVenueData:self.venues[indexPath.row] atIndexPath:indexPath];
    return cell;
}

#pragma mark - Private

- (void)p_setupTableView {
    self.refreshControl = [UIRefreshControl new];
    [self.refreshControl addTarget:self
                            action:@selector(p_pullToRefresh)
                  forControlEvents:UIControlEventValueChanged];
    self.title = @"ACCApp";
}

- (void)p_loadNearbyVenues {
    [self p_startRefreshing];
    [self.presenter loadNearbyVenues];
}

- (void)p_pullToRefresh {
    [self p_loadNearbyVenues];
}

- (void)p_startRefreshing {
    [self.tableView setContentOffset:CGPointMake(0.0f, -1.0f * CGRectGetHeight(self.refreshControl.frame))
                            animated:YES];
    [self.refreshControl beginRefreshing];
}

- (void)p_stopRefreshing {
    [self.refreshControl endRefreshing];
}

@end
