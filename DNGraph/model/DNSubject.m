#import "DNSubject.h"
#import "DNRanker.h"

@implementation DNSubject

@synthesize ranker;

- (void)setupWithId: (NSString *)facebookId andName: (NSString *)name andCategory: (NSString *)category
{
    self.facebookId = facebookId;
    self.name = name;
    self.category = category;
    self.ranking = 0.5f;
    self.ranker = [[DNRanker alloc] initWithDelgate:self];
}

#pragma mark - DNNode Delegate

- (NSString *)getId {return self.facebookId;}
- (void)like {[ranker like];}
- (void)dislike {[ranker dislike];}
- (void)resetRanking {[ranker resetRanking];}

@end
