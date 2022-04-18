begin
  if (Partner.present? and not Partner.exists?)
    Partner.create!( 
      name:   'BFactor', 
      code:    'bf',
      title:   'Индивидуальный предприниматель Губаева Диана Дамировна',
      kind:   'individual',
      role:   'supplier'
    )
    Partner.create!( 
      name:   'КОНОПЕЛЬ',
      code:   'knpl',
      title:  'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ПРОИЗВОДСТВЕННАЯ КОМПАНИЯ "КОНОПЕЛЬ"',
      kind:   'ooo',
      role:   'supplier'
    )
    puts "===== #{Partner.count} 'Partner' record(s) created"
  else
    puts "===== 'Partner' seeding skipped"
  end
rescue
  puts "----- Achtung! Something went wrong..."
end