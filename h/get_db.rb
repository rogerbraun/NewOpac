require "rubygems"
require "mysql"
require "yaml"
client = Mysql::new("rokuhara.japanologie.kultur.uni-tuebingen.de", "root", "turedurenarumamani", "ajsinfo")

client.query("SET NAMES 'utf8' ")
result = client.query("select * from buch where id > 10000 LIMIT 3000")

f= open("output","w")
a = []
result.each_hash do |row|
 a << row
end
YAML.dump(a,f)
