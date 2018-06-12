user_names = ['Terry', 'Muho']
bodies = [
  "oh, sorry",
  "thanks"
]

0.upto(1) do |idx|
  Advise.create(
    note_id: 1 + idx,
    user_name:  "#{user_names[idx % 2]}",
    body: "#{bodies[idx % 2]}",
  )
end
