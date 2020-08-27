using TextAnalysis
using TextAnalysis: NaiveBayesClassifier, fit!, predict

m = NaiveBayesClassifier([:legal, :financial])
