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
  Projects
}

fn init(_flags) -> #(Model, effect.Effect(Message)) {
  #(Model(Home), effect.none())
}

type Message {
  UserClickedHome
  UserClickedProjects
}

fn update(model: Model, message: Message) -> #(Model, effect.Effect(Message)) {
  case message {
    UserClickedHome -> #(Model(Home), effect.none())
    UserClickedProjects -> #(Model(Projects), effect.none())
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
          [h.h2([case model.page {
            Home -> a.style("color", "#3c3551")
            _ -> a.none()
          }], [h.text("Home")])]),
        h.button([event.on_click(UserClickedProjects), a.style("margin-right", "35px")],
          [h.h2([case model.page {
            Projects -> a.style("color", "#3c3551")
            _ -> a.none()
        }], [h.text("Projects")])]),
        h.a([a.href("https://github.com/AzlanB"), a.styles([#("margin-right", "35px"), #("display", "inline-grid")])],
          [h.h2([], [h.text("GitHub")])]),
        h.a([a.href("https://drive.google.com/file/d/1S06Om_5iJ1cwy4inC6YkUXRi-sXQJ8Ay/view?usp=sharing"), a.styles([#("margin-right", "35px"), #("display", "inline-grid")])],
          [h.h2([], [h.text("Resume")])])
      ])]),

      case model.page {
        Home -> h.div([a.style("margin-left", "5px")], [
          h.h2([], [h.text("About Me")]),
          h.p([], [h.text("Unfinished")])
        ])

        Projects -> h.div([a.style("margin-left", "5px")], [
          h.h2([], [h.text("Projects")]),
          h.p([], [h.text("Unfinished")])
        ])
      }
    ])
  ])
}