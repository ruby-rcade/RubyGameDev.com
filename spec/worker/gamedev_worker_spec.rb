require 'rails_helper'

describe '#perform' do  

  it 'should get external questions' do
    VCR.use_cassette('questions') do

    	#assert_equal 0,GamedevWorker.jobs.size

        response = GamedevWorker.perform_async
  
	    #it { is_expected.to validate_uniqueness_of(:external_id) }	
		#expect {
        #GamedevWorker.perform_async(1, 2)
        #}.to change(GamedevWorker.jobs, :size).by(1)		
		#response = GamedevWorker.perform_async
		#expect(response.data).to eq(ExternalPost.count)
        #assert_equal 0, HardWorker.jobs.size
        #assert_equal ExternalPost.count,response.count        
        #expect(response.data.last.respond_to?(:answer_count)).to be_truthy
    end
  end

end