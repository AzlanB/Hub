import lustre
import lustre/element.{type Element}
import lustre/element/html as h
import lustre/attribute as a
import lustre/event
import lustre/effect

pub fn main() -> Nil {
  let app = lustre.application(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)
  Nil
}

type Model { Model(
  page: Page
)}

type Page {
  Home
}

fn init(_flags) -> #(Model, effect.Effect(Message)) {
  #(Model(Home), effect.none())
}

type Message {

}

fn update(model: Model, message: Message) -> #(Model, effect.Effect(Message)) {
  case message {
    _ -> #(model, effect.none())
  }
}

fn view(model: Model) -> Element(Message) {

}