#import "DNArticle.h"
#import "DNSource.h"
#import "DNSubject.h"
#import "DNPerson.h"

@implementation DNArticle


- (void)setupWithRanking: (float)ranking andHashValue: (NSString *)hashValue;
{
    [self setPrimitiveRanking:[NSNumber numberWithFloat:ranking]];
    self.hashValue = hashValue;
    self.dateCreated = [NSDate date];
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

- (void)like
{
    self.favouriteValue = YES;
}

- (void)dislike
{
    [self setPrimitiveRanking:[NSNumber numberWithFloat:0.0f]]; // the actual article is not liked and should go.
    self.favouriteValue = NO;
}

- (void)resetRanking {} // no meaning for an article as it's ranking composed of it's parts

- (NSString *)getId { return self.hashValue; }

- (NSDictionary *)jsonFormat
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:@"article" forKey:@"type"];
    [dict setValue:self.type forKey:@"articleType"];
    [dict setValue:self.hashValue forKey:@"hashValue"];
    [dict setValue:self.title forKey:@"title"];
    [dict setValue:self.textValue forKey:@"textValue"];
    [dict setValue:self.primitiveRanking forKey:@"ranking"];
    [dict setValue:self.comments forKey:@"comments"];
    [dict setValue:self.favourite forKey:@"favourite"];
    [dict setValue:self.imageFilename forKey:@"imageFilename"];
    [dict setValue:self.videoUrl forKey:@"videoUrl"];
    return dict;
}


@end
