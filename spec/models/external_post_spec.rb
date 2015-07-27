require 'rails_helper'

describe ExternalPost do 
	
	it { is_expected.to validate_uniqueness_of(:external_id) }	
	
end