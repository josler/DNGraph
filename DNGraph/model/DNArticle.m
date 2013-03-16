#import "DNArticle.h"
#import "DNSource.h"
#import "DNSubject.h"
#import "DNPerson.h"

@implementation DNArticle

- (void)setupWithRanking:(float)ranking
{
    self.rankingValue = ranking;
}

- (UIImage *)getImage
{
    if (self.imageFilename) {
        NSArray *sysPaths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
        NSString *docDirectory = [sysPaths objectAtIndex:0];
        NSString *filePath = [NSString stringWithFormat:@"%@/%@", docDirectory, self.imageFilename];
        return [[UIImage alloc] initWithContentsOfFile:filePath];
    }
    return nil;
}

@end
