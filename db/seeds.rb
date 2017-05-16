# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rake::Task['db:drop'].invoke
Rake::Task['db:create'].invoke
Rake::Task['db:migrate'].invoke

def upload_fake_logos
  uploader = LogosUploader.new(Sneaker.new, :logos)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/tasks/brands', '*')).sample))
  uploader
end

Brand.create([
  {
    name: 'Nike',
    logos: upload_fake_logos
  }, {
    name: 'Asics',
    logos: upload_fake_logos
  }, {
    name: 'Reebok',
    logos: upload_fake_logos
  }, {
    name: 'Adidas',
    logos: upload_fake_logos
  }, {
    name: 'New Balance',
    logos: upload_fake_logos
  }, {
    name: 'Vans',
    logos: upload_fake_logos
  }, {
    name: 'Converse',
    logos: upload_fake_logos
  }, {
    name: 'Puma',
    logos: upload_fake_logos
  }, {
    name: 'DC',
    logos: upload_fake_logos
  }, {
    name: 'FILA',
    logos: upload_fake_logos
  }
])

def random_brand_id
  Brand.offset(rand(Brand.count)).first.id
end

def upload_fake_image
  uploader = ImageUploader.new(Brand.new, :image)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/tasks/sneakers', '*')).sample))
  uploader
end

@sneaker_models = ['Air Max', 'Free Run', 'Huarache', 'MetaRun', 'GEL-NOOSA TRI 10 PS', 'Hyper Throw 3', 'X Foot Patrol Workout', 'X Black Scale Furylite', 'Miami Palms', 'Chuck Taylor All Star']
@sneaker_sex = ['men', 'women', 'unisex']

def sneaker_price
  rand(6000..12000)
end


def create_sneaker
  Sneaker.create(
  brand_id: random_brand_id,
  model: @sneaker_models.sample,
  sex: @sneaker_sex.sample,
  price: sneaker_price,
  image: upload_fake_image
  )
end

15.times do
  create_sneaker
  puts 'Sneaker created'
end
