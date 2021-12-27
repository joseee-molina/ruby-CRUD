class ArticleCategory < ApplicationRecord
    belongs_to :article
    belongs_to :category
    #bridge between 2 tables here
end