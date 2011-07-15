spec = Gem::Specification.new do |s|
    s.name = 'workout'
    s.version = '0.0.1'
    s.summary = 'Web API for accessing workout database.'
    s.description = %{Web based API for storing workout information}
    s.files = Dir['lib/**/*.rb'] + Dir['test/**/*.rb']
    s.require_path = 'lib'
    #s.autorequire = ''
    s.has_rdoc = false
    #s.extra_rdoc_files = Dir['[A-Z]']
    #s.rdoc_options << '--title' << ''
    s.author = 'Heath Lilley'
    s.email = 'heath.lilley@gmail.com'
    #s.homepage = 'http://'
end
    
