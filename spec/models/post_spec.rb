require "rails_helper"

describe Post do
  it { should validate_presence_of :title }
end
