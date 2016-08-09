require 'mixlib/cli'
class HealthInspector
  # top level documentation
  class Client
    include Mixlib::CLI

    option(
      :remedy_directory,
      short: '-r PATH',
      long: '--remedy_directory PATH',
      description: 'Set the location to search for remedies',
      required: false,
      default: './remedies'
    )

    def run
      parse_options
      load_remedies
    end

    def load_remedies
      puts config[:remedy_directory]
    end
  end
end
