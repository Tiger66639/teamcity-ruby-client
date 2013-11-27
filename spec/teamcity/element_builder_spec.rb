require File.expand_path('../../spec_helper', __FILE__)

describe TeamCity::ElementBuilder do
  it 'outputs xml following TeamCity convention for elements and properties' do
    builder = TeamCity::ElementBuilder.new(:attr1 => 'x') do |properties|
      properties['property1'] = 'z'
    end

    builder.to_request_body.should == {
      :attr1 => 'x',
      :properties => {
        :property => [
          {
            :name => 'property1',
            :value => 'z'
          }
        ]
      }
    }.to_json
  end

  it 'outputs xml following TeamCity convention for elements even if no properties are defined' do
    builder = TeamCity::ElementBuilder.new(:attr1 => 'x')

    builder.to_request_body.should == {
      :attr1 => 'x'
    }.to_json
  end
end
