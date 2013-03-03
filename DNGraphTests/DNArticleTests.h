//
//  DNArticleTests.h
//  DNGraph
//
//  Created by James Osler on 03/03/2013.
//  Copyright (c) 2013 James Osler. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@class DNArticle;

@interface DNArticleTests : SenTestCase

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) DNArticle *testArticle;

@end
