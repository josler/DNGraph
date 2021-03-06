//
//  DNGraphTests.h
//  DNGraphTests
//
//  Created by James Osler on 15/02/2013.
//  Copyright (c) 2013 James Osler. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@class DNGraph;

@interface DNGraphTests : SenTestCase

@property (nonatomic, strong) DNGraph *graph;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
