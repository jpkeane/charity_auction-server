namespace :seed do
  task :bid_types => :environment do
    %w(live silent teacup).each do |name|
      BidType.find_or_create_by!(name: name)
    end
  end

  task :donation_categories => :environment do
    YAML.load_file(Rails.root.join('db', 'seeds', 'donation_categories.yml')).each do |attr|
      DonationCategory.find_or_create_by!(attr)
    end
  end
end