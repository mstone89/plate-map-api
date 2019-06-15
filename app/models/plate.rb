class Plate

    if (ENV['DATABASE_URL'])
       uri = URI.parse(ENV['DATABASE_URL'])
       DB = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
    else
       DB = PG.connect(host: "localhost", port: 5432, dbname: 'plate-map-api_development')
    end

    def self.all
        results = DB.exec('SELECT * FROM plates;')

        results.map do |result|
            {
                'id' => result['id'].to_i,
                'name' => result['name'],
                'samples' => result['samples'].to_i,
                'replicates' => result['replicates'].to_i,
                'dilutions' => result['dilutions'].to_i
            }
        end
    end
end
