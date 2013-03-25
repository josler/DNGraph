//
//  DNArticle.h
//  DNGraph
//
//  Created by James Osler on 4 Mar 2013
//  Copyright (c) 2013 James Osler. All rights reserved.
//


#import "_DNArticle.h"
#import "DNNode.h"

@class DNSubject, DNSource, DNPerson;

/**
 Defines an article composed from nodes, and content added to it.
 */
@interface DNArticle : _DNArticle <DNNode>

/**
 Sets up the DNArticle with a given DNSubject, DNSource and DNPerson.

 @param person The DNPerson (author) related to the article.
 @param source The DNSource related to the article.
 @param subject The DNSubject related to the article.
 @param ranking The overall article ranking.
*/
- (void)setupWithPerson:(DNPerson *)person Source:(DNSource *)source Subject:(DNSubject *)subject andRanking: (float)ranking;


/** 
 Gets The UIImage for the article.
 
 @return UIImage, nil if no imageFilename set.
 */
- (UIImage *)getImage;

@end
