describe ValueType do
  let(:value) { SecureRandom.hex }

  subject { described_class.new(value) }

  shared_examples :to_value do |input, output|
    let(:value) { input }

    it "parses #{input} as #{output}" do
      expect(subject.to_value).to eq(output)
    end
  end

  it_behaves_like :to_value, 'true', true
  it_behaves_like :to_value, 'on', true
  it_behaves_like :to_value, 'yes', true

  it_behaves_like :to_value, 'false', false
  it_behaves_like :to_value, 'off', false
  it_behaves_like :to_value, 'no', false
end
