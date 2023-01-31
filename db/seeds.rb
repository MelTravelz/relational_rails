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
exhibit_1 = Exhibit.create!(name: "Ancient Rome", start_date: "2022-11-15", end_date: "2023-02-14", on_display: true, price: 15.00)
exhibit_2 = Exhibit.create!(name: "Ancient Egypt", start_date: "2023-02-01", end_date: "2023-04-30", on_display: true, price: 20.00)
exhibit_3 = Exhibit.create!(name: "Ancient Korea", start_date: "2023-04-14", end_date: "2023-06-20", on_display: false, price: 17.00)

# Artifacts: 
artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "marble", year_created: "45 BCE", on_loan: false, total_pieces: 5)
artifact_2 = Artifact.create!(exhibit: exhibit_1, name: "Nummus Aureus Coin", material: "gold", year_created: "312 CE", on_loan: true, total_pieces: 12)
artifact_3 = Artifact.create!(exhibit: exhibit_1, name: "Galdiator Cup", material: "glass", year_created: "75 BCE", on_loan: true, total_pieces: 1)

artifact_4 = Artifact.create!(exhibit: exhibit_2, name: "Oxyrhynchus Papyri", material: "papyrus", year_created: "640 CE", on_loan: true, total_pieces: 35)
artifact_5 = Artifact.create!(exhibit: exhibit_2, name: "Ramses II Bust", material: "granite", year_created: "1270 BCE", on_loan: false, total_pieces: 1)
artifact_6 = Artifact.create!(exhibit: exhibit_2, name: "Coffin Lid of Hemet-Mer", material: "sycamore fig wood", year_created: "1075 BCE", on_loan: true, total_pieces: 1)

artifact_7 = Artifact.create!(exhibit: exhibit_3, name: "Divine Bell of King Seongdeok", material: "metal", year_created: "771 BCE", on_loan: true, total_pieces: 2)
artifact_8 = Artifact.create!(exhibit: exhibit_3, name: "Roof-end Tile with Face Design", material: "tile", year_created: "800 BCE", on_loan: true, total_pieces: 1)
artifact_9 = Artifact.create!(exhibit: exhibit_3, name: "Silla Golden Crown", material: "gold", year_created: "400 BCE", on_loan: true, total_pieces: 1)
artifact_10 = Artifact.create!(exhibit: exhibit_3, name: "Pensive Bodhisattva", material: "gilt bronze", year_created: "610 BCE", on_loan: true, total_pieces: 1)



# This is another way to write this: 
# artifact_2 = exhibit_1.artifacts.create!(name: "shard", on_loan: false, year_created: 700)

# This file will only seed the development environment (not the test env)

