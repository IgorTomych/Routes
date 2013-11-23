//
//  MKMapView+RoutesMap.m
//  Routes
//
//  Created by Igor Tomych on 11/23/13.
//  Copyright (c) 2013 itomych studio. All rights reserved.
//

#import "MKMapView+RoutesMap.h"


@implementation MKMapView (RoutesMap)


@dynamic polylines;
static NSMutableArray * _polylines;

-(void)setPolylines:(NSMutableArray *)polylines {
    _polylines = polylines;
}

-(NSMutableArray *)polylines {
    return _polylines;
}

-(void)applyPath:(NSArray *)path {
    
    if (path) {
        
        [self removeOverlays:self.polylines];
        [self.polylines removeAllObjects];

        
        CLLocationCoordinate2D coordinates[[path count]];
        int i = 0;
        for (NSDictionary *coord in path) {
            coordinates[i++] = CLLocationCoordinate2DMake([[coord objectForKey:@"x"] floatValue], [[coord objectForKey:@"y"] floatValue]);
        }
        
        MKPolyline *polyline = [MKPolyline polylineWithCoordinates:coordinates count:[path count]];
        [self addOverlay:polyline];
        [self.polylines addObject:polyline];
        
        MKPolygon *polygon = [MKPolygon polygonWithPoints:polyline.points count:polyline.pointCount];
        [self setRegion:MKCoordinateRegionForMapRect([polygon boundingMapRect]) animated:YES];
    }
}


@end
