class ReviewController < ApplicationController
    def index
        render template: 'review/index'
    end
end
