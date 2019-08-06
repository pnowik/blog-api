require 'rails_helper'

RSpec.describe Post, type: :model do
  # Association test
  # ensure Post model has a 1:m relationship with the Comment model
  it { should have_many(:comments).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:subtitle) }
  it { should validate_presence_of(:body) }
  it { should belong_to(:user) }
end
