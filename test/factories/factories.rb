FactoryBot.define do
  factory(:intake) do
    kcal_per_100 { 100 }
  end

  factory(:serving) do
    intake
    consumed_at { "Mon, 19 Sep 2022 23:49:45 +0300" }
    kcal {200}
    amount {200}
  end
end
