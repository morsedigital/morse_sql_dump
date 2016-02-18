module MorseSqlDump
  class Engine < ::Rails::Engine
    isolate_namespace MorseSqlDump

    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.assets false
      g.helper false
    end

  end
end
