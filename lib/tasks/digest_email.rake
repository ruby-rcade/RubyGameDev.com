namespace :digest_email do

  desc "Send daily digest email"
  task daily_digest: :environment do
    DailyDigestWorker.new.perform
  end

  desc "Send weekly digest email"
  task weekly_digest: :environment do
    WeeklyDigestWorker.new.perform
  end

  desc "Send monthly digest email"
  task monthly_digest: :environment do
    MonthlyDigestWorker.new.perform
  end
end
