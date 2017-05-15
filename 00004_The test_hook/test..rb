describe '' do 
  it("you should declare a FoobarTestHook class") do 
    expect { FoobarTestHook }.to_not raise_error
  end
  it("FoobarTestHook should inherit from Mumukit::Templates::FileHook") do 
    expect(FoobarTestHook.superclass).to eq Mumukit::Templates::FileHook
  end
  it("FoobarTestHook should declare tempfile_extension and return .foobar") do 
    expect(FoobarTestHook.new.tempfile_extension).to eq '.foobar'
  end
  it("FoobarTestHook should declare command_line ") do 
    expect(FoobarTestHook.new.command_line('tmp212.foobar')).to eq 'runfoobar -T tmp212.foobar'
  end
end