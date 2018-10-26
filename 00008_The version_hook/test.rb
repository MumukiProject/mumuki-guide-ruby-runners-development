describe '' do 
  it("you should declare a FoobarVersionHook class") do 
    expect { FoobarVersionHook }.to_not raise_error
  end
  it("FoobarVersionHook should declare VERSION") do 
    expect(FoobarVersionHook::VERSION).to eq '1.2.2'
  end
end