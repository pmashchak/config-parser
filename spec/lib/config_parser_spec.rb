describe ConfigParser do
  let(:config_path) { './spec/files/valid_config.cfg' }
  let(:configuration) { subject.configure }

  subject { described_class.new(config_path) }

  it { is_expected.to respond_to(:configure) }

  context 'linux config file' do
    it 'creates configurable object' do
      expect(configuration.host).to eq('test.com')
      expect(configuration.log_file_path).to eq('/tmp/logfile.log')
      expect(configuration.server_id).to eq(55331)
      expect(configuration.server_load_alarm).to eq(2.5)
      expect(configuration.verbose).to eq(true)
      expect(configuration.silent).to eq(false)
      expect(configuration.test_mode).to eq(true)
      expect(configuration.debug_mode).to eq(false)
      expect(configuration.staging_mode).to eq(true)
      expect(configuration.production).to eq(false)
    end
  end

  context 'when file not found' do
    let(:config_path) { './spec/files/no_file' }

    it 'raises file not found exception' do
      expect { configuration }.to raise_error(ArgumentError, "file #{config_path} does not exist")
    end
  end

  context 'when extension not supported' do
    let(:config_path) { './spec/files/non_config.ini' }

    it 'raises wrong extension exception' do
      expect { configuration }.to raise_error(ArgumentError, "extension .ini is not supported")
    end
  end
end
