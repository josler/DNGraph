//
//  DNSourceTests.h
//  DNGraph
//
//  Created by James Osler on 16/02/2013.
//  Copyright (c) 2013 James Osler. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@class DNSource;

@interface DNSourceTests : SenTestCase

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) DNSource *testSource;

@end
