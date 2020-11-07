class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private

  def add_reactions
    self.reactions = {
      thumbsUp: 0,
      hooray: 0,
      heart: 0,
      rocket: 0,
      eyes: 0,
    }
  end
  
end
