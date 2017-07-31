from nltk.corpus import stopwords
from nltk.tokenize import wordpunct_tokenize
import re, csv

class Preprocessing:

    algorithms = ["stopword","stemming"]
    stop_words = set(stopwords.words('english'))


    def __init__(self, file, algorithm):
        self.file = file
        if algorithm in self.algorithms:
            self.algorithm = algorithm
        else:
            raise ForbiddenAlgorithmException

    def run_algorithm(self):
        if self.algorithm == 'stopword':
            return self.run_stopwords()
        elif self.algorithm == 'stemming':
            print("Running stemming ...")

    def run_stopwords(self):
        self.stop_words.update(['.', ',', '"', "'", '?', '!', ':', ';', '(', ')', '[', ']', '{', '}'])
        with open(self.file+"new", 'w') as csvoutfile:
            with open(self.file, newline='') as csvfile:
                reader = csv.DictReader(csvfile)
                writer = csv.DictWriter(csvoutfile, fieldnames=reader.fieldnames, quotechar='"', quoting=csv.QUOTE_NONNUMERIC)
                writer.writeheader()
                for row in reader:
                    row['title'] = " ".join(
                        [word for word in wordpunct_tokenize(row['title']) if word.lower() not in self.stop_words])
                    row['content'] = " ".join(
                        [word for word in wordpunct_tokenize(row['content']) if word.lower() not in self.stop_words])
                    writer.writerow(row)
        return self.file+"new"





class ForbiddenAlgorithmException(Exception):
    pass