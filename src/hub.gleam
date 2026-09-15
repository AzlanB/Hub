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
  UserClickedHome
}

fn update(model: Model, message: Message) -> #(Model, effect.Effect(Message)) {
  case message {
    _ -> #(model, effect.none())
  }
}

fn view(model: Model) -> Element(Message) {
  h.html([], [
    h.head([], [h.title([], "Hub")]),
    h.body([], [
      h.header([a.style("margin-bottom", "15px")], [h.div([a.styles([#("margin-left", "5px"), #("margin-bottom", "5px")])], [
        h.h1([a.styles([#("display", "inline-grid"), #("margin-right", "50px")])],
          [h.text("Selkie Bokhari")]),
        h.button([event.on_click(UserClickedHome), a.style("margin-right", "35px")],
          [h.h2([], [h.text("Home")])]),
        h.a([a.href("https://github.com/AzlanB"), a.styles([#("margin-right", "35px"), #("display", "inline-grid")])],
          [h.h2([], [h.text("GitHub")])]),
        h.a([a.href("https://kselkie.github.io/Roir"), a.styles([#("margin-right", "35px"), #("display", "inline-grid")])],
          [h.h2([], [h.text("Roir Resources")])])
      ])]),

      case model.page {
        Home -> h.div([a.style("margin-left", "5px")], [
          h.h2([], [h.text("Placeholder Text")]),
          h.p([], [h.text("Test")])
        ])
      }
    ])
  ])
}