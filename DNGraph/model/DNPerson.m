#import "DNPerson.h"
#import "DNRanker.h"

@implementation DNPerson

@synthesize ranker;


- (void)setupWithId:(NSString *)facebookId andName:(NSString *)name
{
    self.facebookId = facebookId;
    self.name = name;
    self.ranking = 0.5f;
    self.ranker = [[DNRanker alloc] initWithDelgate:self];
}


#pragma mark - DNNode Delegate

- (NSString *)getId {return self.facebookId;}
- (void)like {[ranker like];}
- (void)dislike {[ranker dislike];}
- (void)resetRanking {[ranker resetRanking];}

@end
