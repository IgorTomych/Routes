//
//  MKMapView+RoutesMap.h
//  Routes
//
//  Created by Igor Tomych on 11/23/13.
//  Copyright (c) 2013 itomych studio. All rights reserved.
//


#import <MapKit/MapKit.h>

@interface MKMapView (RoutesMap) 

@property (strong, nonatomic) NSMutableArray *polylines;

-(void)applyPath:(NSArray *)path;
@end
