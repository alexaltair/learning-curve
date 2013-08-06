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
  { title: "Is this the first test question?",  description: "Let me know if this works.",        user_id: users[0].id },
  { title: "Is this the second test question?", description: "Let me know if this doesn't work.", user_id: users[1].id },
  { title: "Is this the third test question?",  description: "Let me know if this is a thing.",   user_id: users[2].id },
  { title: "Is this the forth test question?",  description: "Let me know if this awesome.",      user_id: users[2].id }
                            ])

Answer.create([
  { question_id: questions[0].id, user_id:users[2].id , video: "uKs1tn5J28E", caption: "No caption here."       },
  { question_id: questions[1].id, user_id:users[1].id , video: "zXExt1b-WJc", caption: "Non-empty caption."     },
  { question_id: questions[1].id, user_id:users[0].id , video: "bRoIo-NPS8k", caption: "Not a thing, basically" },
  { question_id: questions[2].id, user_id:users[2].id , video: "sAKSRlI1XUA", caption: "Technically an answer." },
  { question_id: questions[2].id, user_id:users[2].id , video: "y0cCXKKwtfE", caption: "Fake answer."           },
  { question_id: questions[3].id, user_id:users[0].id , video: "mk2xgeRCQtU", caption: "Different caption."     },
  { question_id: questions[3].id, user_id:users[1].id , video: "-4rVkusODNQ", caption: "Example caption."       }
                ])