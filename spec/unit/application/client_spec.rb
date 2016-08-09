require 'spec_helper'

describe HealthInspector::Client do
  let(:health_inspector) do
    client = described_class.new
    client.stub(:require_all)
    client
  end

  before do
    @original_argv = ARGV.dup
    ARGV.clear
  end

  after do
    ARGV.replace(@original_argv)
  end

  describe 'run' do
    it 'should call parse_options' do
      argv = []
      expect(health_inspector).to receive(:parse_options).and_return(argv)
      health_inspector.run
    end
    it 'should call load_remedies' do
      expect(health_inspector).to receive(:load_remedies).and_return(true)
      health_inspector.run
    end
    it 'should attempt to require_all on ./remedies/**/*_remedy.rb' do
      expect(health_inspector)
        .to receive(:require_all)
        .with('./remedies/**/*_remedy.rb')
      health_inspector.run
    end
  end
end
