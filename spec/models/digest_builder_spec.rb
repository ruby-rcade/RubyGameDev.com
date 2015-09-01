require "rails_helper"

describe DigestBuilder do
  
  describe "#daily_email" do
  let(:history) { DigestHistory.create_new!("Daily") }
  
  it "History has the last daily frequency " do  	 

  end
      let(:digest_history) { DigestBuilder.send_daily_digest }
      
    end

  end

  describe "#weekly_email" do


  end

  describe "#monthly_email" do

  end

end