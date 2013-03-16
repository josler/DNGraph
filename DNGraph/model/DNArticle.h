//
//  DNArticle.h
//  DNGraph
//
//  Created by James Osler on 4 Mar 2013
//  Copyright (c) 2013 James Osler. All rights reserved.
//


#import "_DNArticle.h"

@class DNSubject, DNSource, DNPerson;

/**
 Defines an article composed from nodes, and content added to it.
 */
@interface DNArticle : _DNArticle {}

/**
 Sets up the DNArticle with a given DNSubject, DNSource and DNPerson.
 
 @param ranking The ranking for the article.
 */
- (void)setupWithRanking:(float)ranking;

/** 
 Gets The UIImage for the article.
 
 @return UIImage, nil if no imageFilename set.
 */
- (UIImage *)getImage;

@end
