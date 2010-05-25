require 'test/unit'
require 'rchardet'

class CharDet::TestBase < Test::Unit::TestCase
  TESTS_PATH = File.dirname(__FILE__)

  ["utf-8"].each do |encoding|
    define_method "test_recognise_#{encoding}" do
      data = File.read("#{TESTS_PATH}/data/#{encoding}")

      cd = CharDet.detect(data)
      assert_equal encoding, cd['encoding']
      assert_in_delta 1, cd['confidence'], 0.1
    end
  end
end
