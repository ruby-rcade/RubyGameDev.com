require 'spec_helper'

describe Post do
  it { should belong_to :user }
  it { should have_and_belong_to_many :tags }
  it { should have_many :comments }

  # TODO
  # it { should have_field(:title) }
  # it { should have_field(:body_markdown) }
  # it { should have_field(:body_html) }

  it { should validate_presence_of :user }
  it { should validate_presence_of :title }
end
