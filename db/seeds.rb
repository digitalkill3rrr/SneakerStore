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

def random_brand_id
  Brand.offset(rand(Brand.count)).first.id
end

def upload_fake_image
  uploader = ImageUploader.new(Sneaker.new, :image)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/tasks/sneakers', '*')).sample))
  uploader
end

def upload_fake_logos
  uploader = LogosUploader.new(Brand.new, :logos)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/tasks/brands', '*')).sample))
  uploader
end

@brand_name = ['Nike', 'Asics', 'Reebok', 'Adidas', 'New Balance', 'Vans', 'Converse', 'Puma', 'DC', 'Fila']

Brand.create([
  {
    name: 'Nike',
    image: upload_fake_logos
  }, {
    name: 'Asics',
    image: upload_fake_logos
  }, {
    name: 'Reebok',
    image: upload_fake_logos
  }, {
    name: 'Adidas',
    image: upload_fake_logos
  }, {
    name: 'New Balance',
    image: upload_fake_logos
  }, {
    name: 'Vans',
    image: upload_fake_logos
  }, {
    name: 'Converse',
    image: upload_fake_logos
  }, {
    name: 'Puma',
    image: upload_fake_logos
  }, {
    name: 'DC',
    image: upload_fake_logos
  }, {
    name: 'FILA',
    image: upload_fake_logos
  }
])

@sneaker_models = ['Air Max', 'Free Run', 'Huarache', 'MetaRun', 'GEL-NOOSA TRI 10 PS', 'Hyper Throw 3', 'X Foot Patrol Workout', 'X Black Scale Furylite', 'Miami Palms', 'Chuck Taylor All Star']
@sneaker_sex = ['men', 'women', 'unisex']

def sneaker_price
  rand(4000..12000)
end

def create_sneaker
  Sneaker.create(
    brand_id: random_brand_id,
    model: @sneaker_model.sample,
    sex: @sneaker_sex.sample,
    price: sneaker_price,
    image: upload_fake_image
  )
end

100.times do
  create_sneaker
end
