class FirebaseWorker
  include Sidekiq::Worker

  def perform(payor, payee, cool)
    options = { body: { payor: payor, payee: payee, cool: cool }.to_json }
    HTTParty.put("https://atm-cache-machine.firebaseio.com/fake-transactions/#{URI.encode(Time.now.in_time_zone('Pacific Time (US & Canada)').to_s)}.json", options)
  end

end