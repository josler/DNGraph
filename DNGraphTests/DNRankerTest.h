//
//  DNRankerTest.h
//  DNGraph
//
//  Created by James Osler on 20/02/2013.
//  Copyright (c) 2013 James Osler. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@class DNRanker;

@interface DNRankerTest : SenTestCase

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) DNRanker *testRanker;


@end
