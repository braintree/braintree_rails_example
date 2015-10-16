require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "#alert_string" do
    context "when given a string" do
      it "returns the string" do
        expect(alert_string("a string")).to eq("a string")
      end
    end

    context "when given an Array" do
      it "returns a string of the array elements joined with break tags" do
        expect(alert_string(["item1", "item2"])).to eq("item1<br />item2")
      end
    end
  end
end

