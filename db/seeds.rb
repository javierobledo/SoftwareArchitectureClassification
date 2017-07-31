# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Algorithm.create({
                     name: 'stopword',
                     description: 'Remove stopwords from the stopwords corpus in NLTK 3 python package',
                     DOI: ''})
Algorithm.create({
                     name: 'WordNetLemmatizer',
                     description: 'Implementation of the wordnet lemmatizer in NLTK 3 python package',
                     DOI: ''})
Algorithm.create({
                     name: 'Original',
                     description: 'Original text from corpus',
                     DOI: ''})