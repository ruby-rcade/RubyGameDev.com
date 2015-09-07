require "rails_helper"

describe Guide do
  it { should belong_to :user }
  it { should belong_to :category }
  it { should have_many :comments }
  it { should validate_presence_of :user }
  it { should validate_presence_of :title }
  it { should validate_presence_of :body_markdown }
  it { should validate_presence_of :category }
end
