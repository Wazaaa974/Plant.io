require "test_helper"

class PlantTest < ActiveSupport::TestCase
  test "species label falls back when species name is missing" do
    plant = plants(:one)
    plant.species_name = ""
    plant.common_name = "Monstera"

    assert_equal "Monstera", plant.species_label
  end

  test "species label uses placeholder when no species info is present" do
    plant = plants(:one)
    plant.species_name = ""
    plant.common_name = ""

    assert_equal "Espece a confirmer", plant.species_label
  end
end
