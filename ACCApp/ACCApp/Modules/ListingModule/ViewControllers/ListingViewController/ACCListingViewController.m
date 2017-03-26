//
//  ACCListingViewController.m
//  ACCApp
//
//  Created by Bin Yu on 25/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ACCListingViewController.h"
#import "ACCListingTableViewCell.h"
#import "ACCSettingsPresenter.h"
#import "ACCSettingsViewController.h"
#import "ACCUserCacheService.h"
#import "ACCVenueDataModel.h"
#import "IACCListingPresenter.h"
#import "IACCListingView.h"
#import "UIStoryboard+Helper.h"

static NSString *ACCListingViewControllerCellId = @"ACCListingViewControllerCellId";

@interface ACCListingViewController ()<IACCListingView>

@property (nonatomic, strong) id<IACCListingPresenter> presenter;
@property (nonatomic, strong) NSArray<ACCVenueDataModel *> *venues;

@end

@implementation ACCListingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_setupTableView];
    [self p_setupNotification];
    [self p_loadNearbyVenues];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:ACCSettingsValueChangedNotification
                                                  object:nil];
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
    [self setTitle:@"ACCApp"];
    [self setRefreshControl:[UIRefreshControl new]];
    [self.refreshControl addTarget:self
                            action:@selector(p_pullToRefresh)
                  forControlEvents:UIControlEventValueChanged];
    UIBarButtonItem *settingsButton =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                  target:self
                                                  action:@selector(p_presentSettingsViewController)];
    self.navigationItem.rightBarButtonItem = settingsButton;
}

- (void)p_setupNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(p_loadNearbyVenues)
                                                 name:ACCSettingsValueChangedNotification
                                               object:nil];
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

// TODO: move these codes into router
- (void)p_presentSettingsViewController {
    ACCSettingsViewController *settingsViewController =
    [UIStoryboard instantiateViewControllerWithId:@"ACCSettingsViewController"
                                     inStoryboard:@"Main"];
    ACCSettingsPresenter *settingsPresenter = [ACCSettingsPresenter new];
    
    [settingsViewController setPresenter:(id)settingsPresenter];
    [settingsPresenter setView:(id)settingsViewController];
    [settingsPresenter setUserCacheService:[ACCUserCacheService new]];
    
    [self.navigationController pushViewController:settingsViewController animated:YES];
}

@end
