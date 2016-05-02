unless Rails.env.production?
  namespace :spec do
    desc "Run all specs in the spec directory (excluding integration specs)"
    RSpec::Core::RakeTask.new(:unit) do |task|
      task.pattern = FileList["spec/**/*_spec.rb"].exclude("spec/integration/**/*_spec.rb")
    end
  end

  Rake::Task[:default].prerequisites.clear
  task :default => "spec:unit"
end
