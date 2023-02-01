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
exhibit_1 = Exhibit.create!(name: "Ancient Aliens", start_date: "2022-11-15", end_date: "2023-02-14", on_display: true, price: 15.00)
exhibit_2 = Exhibit.create!(name: "Ancient Curiosities", start_date: "2023-02-01", end_date: "2023-04-30", on_display: true, price: 20.00)
exhibit_3 = Exhibit.create!(name: "Ancient Adventurers", start_date: "2023-04-14", end_date: "2023-06-20", on_display: false, price: 17.00)

# Artifacts: 
artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "ET's Home Phone", material: "plastic", year_created: "200,000 BCE", on_loan: false, total_pieces: 4)
artifact_2 = Artifact.create!(exhibit: exhibit_1, name: "'Mayan' Anti-Gravitational Whistle", material: "bone", year_created: "250 CE", on_loan: true, total_pieces: 1)
artifact_3 = Artifact.create!(exhibit: exhibit_1, name: "Roswell UFO Crash Pieces", material: "unidentified metal alloy", year_created: "1947 CE", on_loan: true, total_pieces: 12)

artifact_4 = Artifact.create!(exhibit: exhibit_2, name: "Piri Reis Map & Missing Corner", material: "papyrus", year_created: "1513 CE", on_loan: true, total_pieces: 2)
artifact_5 = Artifact.create!(exhibit: exhibit_2, name: "Translation of Voynich Manuscript", material: "vellum", year_created: "1404 CE", on_loan: false, total_pieces: 240)
artifact_8 = Artifact.create!(exhibit: exhibit_3, name: "Sword of Magellan", material: "steel", year_created: "1495 CE", on_loan: true, total_pieces: 2)

artifact_7 = Artifact.create!(exhibit: exhibit_3, name: "Hat of Lemuel Gulliver", material: "beaver-har felt", year_created: "1726 CE", on_loan: true, total_pieces: 1)
artifact_8 = Artifact.create!(exhibit: exhibit_3, name: "Waldo's Binoculars", material: "gutta-percha", year_created: "1987 CE", on_loan: true, total_pieces: 1)
artifact_9 = Artifact.create!(exhibit: exhibit_3, name: "Locker of Davy Jones", material: "sycamore fig wood", year_created: "23,000 BCE", on_loan: true, total_pieces: 2)
artifact_10 = Artifact.create!(exhibit: exhibit_3, name: "Big Foot's Big Shoes", material: "merino wool", year_created: "1 BCE", on_loan: false, total_pieces: 2)

# This is another way to write this: 
# artifact_2 = exhibit_1.artifacts.create!(name: "shard", on_loan: false, year_created: 700)

# This file will only seed the development environment (not the test env)

