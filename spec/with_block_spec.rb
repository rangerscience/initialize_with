RSpec.describe InitializeWith do
  let(:klass) do
    Class.new() do
      include InitializeWith

      attr_reader :faz, :boo

      initialize_with :foo, :bar, baz: 42 do
        @faz = 99
      end

      initialize_with do
        @boo = 7
      end
    end
  end

  it 'runs the blocks' do
    instance = klass.new(1, 2, 3)
    expect(instance.faz).to eq 99
    expect(instance.boo).to eq 7
  end
end
