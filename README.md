Setup:
make clean --directory db/make/ && make --directory db/make/
rake db:populate_test_data:create_fixture_data
