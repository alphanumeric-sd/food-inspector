require 'spec_helper'

describe HealthInspector::Client do
  let(:health_inspector) do
    client = described_class.new
    client
  end

  describe 'run' do
    it 'should call load_remedies' do
      expect(health_inspector).to receive(:load_remedies).and_return(true)
      health_inspector.run
    end
  end
end
