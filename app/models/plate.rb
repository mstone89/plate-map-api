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

    def self.find id
        results = DB.exec_params(<<-SQL, [id.to_i])
            SELECT *
            FROM plates
            WHERE plates.id = $1;
        SQL

        return {error: 'No results found'} if !results.first

        {
            'id' => results.first['id'].to_i,
            'name' => results.first['name'],
            'samples' => results.first['samples'].to_i,
            'replicates' => results.first['replicates'].to_i,
            'dilutions' => results.first['dilutions'].to_i
        }
    end

    def self.create opts
        results = DB.exec_params(<<-SQL, [opts['name'], opts['samples'], opts['replicates'], opts['dilutions']])
            INSERT INTO plates (name, samples, replicates, dilutions)
            VALUES ($1, $2, $3, $4)
            RETURNING id, name, samples, replicates, dilutions;
        SQL

        {
            'id' => results.first['id'].to_i,
            'name' => results.first['name'],
            'samples' => results.first['samples'].to_i,
            'replicates' => results.first['replicates'].to_i,
            'dilutions' => results.first['dilutions'].to_i
        }
    end

    def self.delete id
        results = DB.exec_params('DELETE FROM plates WHERE id = $1', [id.to_i])
        {'deleted' => true}
    end
    
end
