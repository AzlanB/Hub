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
          h.h2([], [h.text("Personal Projects")]),
          h.a([a.href("https://kselkie.github.io/Roir")], [h.h3([a.style("text-decoration", "underline")], [h.text("Roir Resources")])]),
          h.p([], [h.text("A website made in Gleam using the Lustre framework featuring many useful tools and references for the Constructed Language (Conlang) Roir. Due to featuring a separate system of time and measurement,
            there is a real time clock synced to the user's local time, as well as a page for unit conversion. The website also features the use of a custom font for the language's alphabet,
            base 10 to base 6 conversion, and serves as a central hub for all resources for the language.")]),
          h.br([]),
          h.h2([], [h.text("Academic Projects")]),
          h.a([a.href("https://github.com/AzlanB/Undergods")], [h.h3([a.style("text-decoration", "underline")], [h.text("Undergods")])]),
          h.p([], [h.text("An isometric video game made in the Microsoft XNA engine. Originally made for a Video Game Programming class by a team of three including myself, although has been since updated by myself.
            It features a single fight against a boss, with few chances to make mistakes. The isometric gameplay created in a 2D game engine was a challenge to implement. More fights were planned but had to be scaled back for time.
            Installable as a windows application, but does not work on Windows 11.")]),
          h.br([]),
          h.a([a.href("https://github.com/AzlanB/UTD-Gym-Tracker")], [h.h3([a.style("text-decoration", "underline")], [h.text("UTD Gym Tracker")])]),
          h.p([], [h.text("A simple application using Java Swing, with a Server and Client, hashed password storage for accounts, and a global leaderboard. Intended to encourage students to participate and compete for gym
            records, keeping track of what exercises are done when, allowing for video verification, and providing records for all users. Does not have an available download, but does function within an IDE.")]),
          h.br([]),
          h.a([a.href("https://github.com/AzlanB/Crystal-RPG")], [h.h3([a.style("text-decoration", "underline")], [h.text("Crystal RPG")])]),
          h.p([], [h.text("A text-based randomly generated RPG game running on Java. Replicates an open world, storing towns and characters within them, generating useful items and quests, and simulating random encounters.
          Different towns can be revisited and characters will occasionally restock on items. Can be downloaded and can be run through a .jar and .bat file.")])
        ])
      }
    ])
  ])
}