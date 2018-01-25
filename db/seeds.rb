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
                     name: 'wordnetlemmatizer',
                     description: 'Implementation of the wordnet lemmatizer in NLTK 3 python package',
                     DOI: ''})
Algorithm.create({
                     name: 'original',
                     description: 'Original text from corpus',
                     DOI: ''})
Algorithm.create({
                     name: 'porter',
                     description: 'The Porter stemming algorithm (or ‘Porter stemmer’) is a process for removing the
commoner morphological and inflexional endings from words in English. Its main use is as part of a term normalisation
process that is usually done when setting up Information Retrieval systems.',
                     DOI: 'https://doi.org/10.1108/eb046814'})
Algorithm.create({
                     name: 'lancaster',
                     description: 'In natural language processing, conflation is the process of merging or lumping
together nonidentical words which refer to the same principal concept. This can relate both to words which are entirely
different in form (e.g., "group" and "collection"), and to words which share some common root (e.g., "group",
"grouping", "subgroups"). In the former case the words can only be mapped by referring to a dictionary or thesaurus,
but in the latter case use can be made of the orthographic similarities between the forms. One popular approach is to
remove affixes from the input words, thus reducing them to a stem; if this could be done correctly, all the variant
forms of a word would be converted to the same standard form. Since the process is aimed at mapping for retrieval
purposes, the stem need not be a linguistically correct lemma or root (see also Frakes 1982)',
                     DOI: 'https://doi.org/10.1145/101306.101310'})
Algorithm.create({
                     name: 'snowball_english',
                     description: 'The english version is the same of porter algorithm',
                     DOI: 'https://doi.org/10.1108/eb046814'})
Algorithm.create({
                     name: 'HLDA',
                     description: 'Remove stopwords from the stopwords corpus in NLTK 3 python package',
                     DOI: ''})