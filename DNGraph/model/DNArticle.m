#import "DNArticle.h"
#import "DNSource.h"
#import "DNSubject.h"
#import "DNPerson.h"

@implementation DNArticle

- (void)setupWithRanking:(float)ranking
{
    self.rankingValue = ranking;
}

@end
