User.delete_all
Question.delete_all
Answer.delete_all

users = User.create([
  { email: "admin@learningcurvelabs.com", name: "Admin", password: "Admin123", password_confirmation: "Admin123", admin: true },
  { email: "exampleguy@gmail.com",    name: "Example Guy",    password: "examplepassword", password_confirmation: "examplepassword", admin: false },
  { email: "exampleperson@gmail.com", name: "Example Person", password: "examplepassword", password_confirmation: "examplepassword", admin: false },
  { email: "newdude@gmail.com",       name: "New Dude",       password: "newpassword",     password_confirmation: "newpassword", admin: false     }
                    ])

questions = Question.create([
  { title: "Is this the first test question?",  description: "Let me know if this works.",        user: users[0] },
  { title: "Is this the second test question?", description: "Let me know if this doesn't work.", user: users[1] },
  { title: "Is this the third test question?",  description: "Let me know if this is a thing.",   user: users[2] },
  { title: "Is this the forth test question?",  description: "Let me know if this awesome.",      user: users[2] }
                            ])

Answer.create([
  { question: questions[0], user: users[2], video: "uKs1tn5J28E", caption: "No caption here."       },
  { question: questions[1], user: users[1], video: "zXExt1b-WJc", caption: "Non-empty caption."     },
  { question: questions[1], user: users[0], video: "bRoIo-NPS8k", caption: "Not a thing, basically" },
  { question: questions[2], user: users[2], video: "sAKSRlI1XUA", caption: "Technically an answer." },
  { question: questions[2], user: users[2], video: "y0cCXKKwtfE", caption: "Fake answer."           },
  { question: questions[3], user: users[0], video: "mk2xgeRCQtU", caption: "Different caption."     },
  { question: questions[3], user: users[1], video: "-4rVkusODNQ", caption: "Example caption."       }
                ])