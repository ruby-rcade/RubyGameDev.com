require 'rails_helper'

describe GuideCategory do
  it { should have_many :guides }
  it { should validate_presence_of :name }
end
