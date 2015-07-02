require 'rails_helper'

describe Tag do
  it { should belong_to :user }
  it { should have_and_belong_to_many :posts }

  # TODO
  # it { should have_field(:title) }
  # it { should have_field(:approved).of_type(:boolean) }

  it { should validate_presence_of :title }
end
