desc "deletes todos after 7 days they are created"
task :delete_items => :environment do
  Todo.where("created_at <= ?", Time.now - 7.days).destroy_all
end