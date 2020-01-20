class PlaceUserCreator
  include Interactor::Organizer
  organize UserValidator, UserCreator
end
