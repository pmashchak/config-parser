describe LinuxParser do
  let(:config_path) { './spec/files/valid_config.cfg' }
  let(:file) { File.open(config_path, 'r') }

  subject { described_class.new(file) }

  it 'creates configurable object' do
    expect(subject.host).to eq('test.com')
    expect(subject.log_file_path).to eq('/tmp/logfile.log')
    expect(subject.server_id).to eq(55331)
    expect(subject.server_load_alarm).to eq(2.5)
    expect(subject.verbose).to eq(true)
    expect(subject.silent).to eq(false)
    expect(subject.test_mode).to eq(true)
    expect(subject.debug_mode).to eq(false)
    expect(subject.staging_mode).to eq(true)
    expect(subject.production).to eq(false)
  end

  context 'when config is not valid' do
    let(:config_path) { './spec/files/not_valid_config.cfg' }

    it 'raises invalid string exception' do
      expect { subject }.to raise_error(ArgumentError, "invalid string format: = test.com")
    end
  end

  context 'when config not found' do
    it 'raises method not found exception' do
      expect { subject.some_method }.to raise_error(NoMethodError, "config some_method not found")
    end
  end
end
