# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Exhibit.destroy_all
Artifact.destroy_all

# Exhibits: 
exhibit_1 = Exhibit.create!(name: "Ancient Aliens", on_display: true, price: 15.00)
exhibit_2 = Exhibit.create!(name: "Ancient Curiosities", on_display: true, price: 20.00)
exhibit_3 = Exhibit.create!(name: "Ancient Adventurers", on_display: false, price: 17.00)

# Artifacts: 
artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "ET's Home Phone", material: "plastic", year_created: "200,000 BCE", total_pieces: 4, on_loan: true)
artifact_2 = Artifact.create!(exhibit: exhibit_1, name: "'Mayan' Anti-Gravitational Whistle", material: "bone", year_created: "250 CE", total_pieces: 1, on_loan: false)
artifact_3 = Artifact.create!(exhibit: exhibit_1, name: "Roswell UFO Crash Pieces", material: "unidentified metal alloy", year_created: "1947 CE", total_pieces: 12, on_loan: true)

artifact_4 = Artifact.create!(exhibit: exhibit_2, name: "Piri Reis Map's with Middle and Eastern Pages", material: "papyrus", year_created: "1513 CE", total_pieces: 3, on_loan: true)
artifact_5 = Artifact.create!(exhibit: exhibit_2, name: "Translation of Voynich Manuscript", material: "vellum", year_created: "1404 CE", total_pieces: 240, on_loan: false)
artifact_8 = Artifact.create!(exhibit: exhibit_3, name: "Sword of Magellan", material: "steel", year_created: "1495 CE", total_pieces: 2, on_loan: true)

artifact_7 = Artifact.create!(exhibit: exhibit_3, name: "Hat of Lemuel Gulliver", material: "beaver-har felt", year_created: "1726 CE", total_pieces: 1, on_loan: true)
artifact_8 = Artifact.create!(exhibit: exhibit_3, name: "Waldo's Binoculars", material: "gutta-percha", year_created: "1987 CE", total_pieces: 1, on_loan: true)
artifact_9 = Artifact.create!(exhibit: exhibit_3, name: "Locker of Davy Jones", material: "sycamore fig wood", year_created: "23,000 BCE", total_pieces: 3, on_loan: false)
artifact_10 = Artifact.create!(exhibit: exhibit_3, name: "Big Foot's Big Shoes", material: "merino wool", year_created: "1 BCE", total_pieces: 2, on_loan: true)

# This is another way to write this: 
# artifact_2 = exhibit_1.artifacts.create!(name: "shard", on_loan: false, year_created: 700)

# This file will only seed the development environment (not the test env)

