require_relative 'Bank.rb'
require_relative 'Developers.rb'

class Nama #< Bank
  # To change this template use File | Settings | File Templates.

  ############# DECLARING BANK INSTANCES #####################

  #(no_of_employees, amount_of_deposits, amount_of_loans, nama_status)
  aib = Bank.new('Allied Irish Banks','13000','102718000000','75886000000','true') # AIB has transferred €20 Billion to NAMA
  anglo = Bank.new('Anglo', '850','59000000000','58000000000','true') # About €32 Billion to NAMA (employees based on IRBC)
  boi = Bank.new('Bank of Ireland','12000','104000000000','103000000000','true')  # About €15 Billion to Nama
  rbs = Bank.new('Royal Bank of Scotland','141000','580000000000','610000000000','false')   #
  ulster = Bank.new('Ulster Bank','3250','27000000000','39000000000','false') #

  ############# DECLARING DEVELOPER INSTANCES ####################
  johnny_ronan = Developers.new('Johnny Ronan','25000000','50000000','Anglo','')
  richard_barrett = Developers.new('Richard Barrett','15000000','10000000','AIB','')
  sean_mulryan = Developers.new('Sean Mulryan','12000000','14000000','BOI','')
  bernard_mcnamara = Developers.new('Bernard McNamara','30000000','40000000','RBS','')
  liam_carroll = Developers.new('Liam Carroll','22000000','35000000','ULSTER','')

  ############# CREATING AN ARRAY OF BANKS ########################################
  banks = []

  banks << aib << anglo << boi << rbs << ulster

  ############# CREATING AN ARRAY OF DEVELOPERS ########################################
  developers = []

  developers << johnny_ronan << richard_barrett << sean_mulryan << bernard_mcnamara << liam_carroll

  repeat = ''

  while repeat != 0

    puts "\nWhat do you want to do?"
    puts "\n"
    puts "Check Bank Details                           | 0"
    puts "Check Developer Details                      | 1"
    puts "Check if a Bank is Solvent                   | 2"
    puts "  **Please Note - If the value of a banks loans is greater than 20% higher than it`s deposits"
    puts "    20% of it`s loans will be moved to NAMA and NAMA status will be set to true"
    puts "Check if a Developer is Solvent              | 3"
    puts "Check how much a Developer owes (altogether) | 4"
    puts "Check how much a Developer owes bank         | 5"
    puts "Perform bankruptcy tests and consequences    | 6"
    puts "Exit                                         | 7"

    userchoice = gets.chomp
    choice = userchoice.to_i

    case

      ################## CHECKING BANK DETAILS ###################
      when choice == 0 then

        puts "\n" + '-------------------- BANK DETAILS ------------------------'
        puts "\n"

        #setting the format for display
        format = '%-22s %-19s %-18s %-15s %-11s'
        puts format % ['Bank Name', 'Number of Employees', 'Amount of Deposits', 'Amount of Loans', 'Nama Status']

        #writing the information to file
        File.open("bank_details.txt", "w") do |file|
          file.puts format % ['Bank Name', 'Number of Employees', 'Amount of Deposits', 'Amount of Loans', 'Nama Status']
          banks.each { |member|
            file.puts format % [member.name, member.no_of_employees, member.amount_of_deposits, member.amount_of_loans, member.nama_status]
          }
        end

        banks.each { |member|
          puts format % [member.name, member.no_of_employees, member.amount_of_deposits, member.amount_of_loans, member.nama_status]
        }

        puts "\n" + 'The above information has been written to bank_details.txt in the directory'


      ################## CHECKING DEVELOPER DETAILS ###################
      when choice == 1 then

        puts "\n" + '-------------------- DEVELOPER DETAILS ------------------------'
        puts "\n"
        format2 = '%-16s %-9s %-8s %-6s %-8s'
        puts format2 % ['Developers Name', 'Net Worth', 'Loans', 'Bank', 'Bankrupt']

        #writing the information to file
        File.open("developer_details.txt", "w") do |file|
          file.puts format2 % ['Developers Name', 'Net Worth', 'Loans', 'Bank', 'Bankrupt']
          developers.each { |member|
            file.puts format2 % [member.name, member.net_worth, member.loans,member.banks_loaned_from, member.bankrupt]
          }
        end

        developers.each do   |member|
          puts format2 % [member.name, member.net_worth, member.loans,member.banks_loaned_from, member.bankrupt]
        end

      ################## CHECKING BANK SOLVENCY ###################
      when choice == 2 then
        puts "\nCHECKING BANK SOLVENCY"
        puts "\nWhich Bank do you want to Check?"
        puts "\n"
        puts "Check All Banks                      | 0"
        puts "AIB                                  | 1"
        puts "ANGLO                                | 2"
        puts "BOI                                  | 3"
        puts "RBS                                  | 4"
        puts "ULSTER                               | 5"

        userchoice = gets.chomp
        choice = userchoice.to_i
        #methods used below defined in Banks.rb
        banks[0].bank_is_solvent
        banks[1].bank_is_solvent
        banks[2].bank_is_solvent
        banks[3].bank_is_solvent
        banks[4].bank_is_solvent
        #methods used below defined in Banks.rb
        aib.moves_loans_to_nama
        anglo.moves_loans_to_nama
        boi.moves_loans_to_nama
        rbs.moves_loans_to_nama
        ulster.moves_loans_to_nama

        # Nested case statement to check bank solvency
        case
          when choice == 0 then       #Checking all Banks
            banks.each { |member|
              #member.bank_is_solvent

              if member.bank_is_solvent == true then
                puts "#{member.name} is solvent"

              else
                puts "#{member.name} is not solvent"
              end
            }

            #writing the information to file
            File.open("bank_solvency_status.txt", "w") do |file|
              banks.each { |member|
                if member.bank_is_solvent == true then
                  file.puts "#{member.name} is solvent"

                else
                  file.puts "#{member.name} is not solvent"
                end
              }
            end

            puts "\nBank solvency details have been written to bank_solvency_status.txt"

          when choice == 1 then       #Checking AIB
            #bank_is_solvent defined in Banks.rb
            if banks[0].bank_is_solvent == true then
              puts "#{banks[0].name} is solvent"
              #banks[0].moves_loans_to_nama
            else
              puts "#{banks[0].name} is not solvent"
            end
          when choice == 2 then       #Checking ANGLO
            #banks[1].bank_is_solvent
            if banks[1].bank_is_solvent == true then
              puts "#{banks[1].name} is solvent"
              #banks[1].moves_loans_to_nama
            else
              puts "#{banks[1].name} is not solvent"
            end
          when choice == 3 then       #Checking BOI
            #banks[2].bank_is_solvent
            if banks[2].bank_is_solvent == true then
              puts "#{banks[2].name} is solvent"
              #banks[2].moves_loans_to_nama
            else
              puts "#{banks[2].name} is not solvent"
            end
          when choice == 4 then       #Checking RBS
            #banks[3].bank_is_solvent
            if banks[3].bank_is_solvent == true then
              puts "#{banks[3].name} is solvent"
              #banks[1].moves_loans_to_nama
            else
              puts "#{banks[3].name} is not solvent"
            end
          when choice == 5 then       #Checking Ulster
            #banks[4].bank_is_solvent
            if banks[4].bank_is_solvent == true then
              puts "#{banks[4].name} is solvent"
              #ulster.moves_loans_to_nama
            else
              puts "#{banks[4].name} is not solvent"
            end
        end

      ################## CHECKING DEVELOPER SOLVENCY ###################
      when choice == 3 then

        puts "\nCHECKING DEVELOPER SOLVENCY"
        puts "\nWhich Developer do you want to Check?"
        puts "\n"
        puts "Check All Developers                 | 0"
        puts "Johnny Ronan                         | 1"
        puts "Richard Barrett                      | 2"
        puts "Sean Mulryan                         | 3"
        puts "Bernard McNamara                     | 4"
        puts "Liam Carroll                         | 5"

        userchoice = gets.chomp
        choice = userchoice.to_i
        # Nested case statement to check bank solvency
        case
          when choice == 0 then       #Checking all Developers
            developers.each { |member|
              member.is_developer_solvent? #is_developer_solvent? defined in Developers.rb
              if member.is_developer_solvent? == true then
                puts "#{member.name} is solvent"
              else
                puts "#{member.name} is not solvent"
              end
            }

            #writing the information to file
            File.open("developer_solvency_status.txt", "w") do |file|
              developers.each { |member|
                if member.is_developer_solvent? == true then
                  file.puts "#{member.name} is solvent"

                else
                  file.puts "#{member.name} is not solvent"
                end
              }
            end

            puts "\nDeveloper solvency details have been written to developer_solvency_status.txt"

          when choice == 1 then       #Checking Johnny Ronan
            developers[0].is_developer_solvent?
            if developers[0].is_developer_solvent? == true then
              puts "#{developers[0].name} is solvent"
            else
              puts "#{developers[0].name} is not solvent"
            end
          when choice == 2 then       #Checking Richard Barrett
            developers[1].is_developer_solvent?
            if developers[1].is_developer_solvent? == true then
              puts "#{developers[1].name} is solvent"
            else
              puts "#{developers[1].name} is not solvent"
            end
          when choice == 3 then       #Checking Sean Mulryan
            developers[2].is_developer_solvent?
            if developers[2].is_developer_solvent? == true then
              puts "#{developers[2].name} is solvent"
            else
              puts "#{developers[2].name} is not solvent"
            end
          when choice == 4 then       #Checking Bernard McNamara
            developers[3].is_developer_solvent?
            if developers[3].is_developer_solvent? == true then
              puts "#{developers[3].name} is solvent"
            else
              puts "#{developers[3].name} is not solvent"
            end
          when choice == 5 then       #Checking Liam Carroll
            developers[4].is_developer_solvent?
            if developers[4].is_developer_solvent? == true then
              puts "#{developers[4].name} is solvent"
            else
              puts "#{developers[4].name} is not solvent"
            end
        end

      ########## CHECKING HOW MUCH DEVELOPER OWES (ALTOGETHER)################

      when choice == 4 then

        puts "\nCHECKING HOW MUCH DEVELOPER OWES (ALTOGETHER)"
        puts "\nWhich Developer do you want to Check?"
        puts "\n"
        puts "Check All Developers                 | 0"
        puts "Johnny Ronan                         | 1"
        puts "Richard Barrett                      | 2"
        puts "Sean Mulryan                         | 3"
        puts "Bernard McNamara                     | 4"
        puts "Liam Carroll                         | 5"


        userchoice = gets.chomp
        choice = userchoice.to_i
        # Nested case statement to check how much developer owes (altogether)
        case
          when choice == 0 then       #Checking all Developers
            developers.each { |member|
              puts "#{member.name} owes €#{member.owes_amount} altogether"
            }

            #writing the information to file
            File.open("developer_owes_money.txt", "w") do |file|
              developers.each { |member|
                file.puts "#{member.name} owes €#{member.owes_amount} altogether"
              }
            end

            puts "\nThe above details have been written to developer_owes_money.txt"

          when choice == 1 then       #Checking Johnny Ronan
            puts "#{developers[0].name} owes €#{developers[0].owes_amount}"

          when choice == 2 then       #Checking Richard Barrett
            puts "#{developers[1].name} owes €#{developers[1].owes_amount}"

          when choice == 3 then       #Checking Sean Mulryan
            puts "#{developers[2].name} owes €#{developers[2].owes_amount}"

          when choice == 4 then       #Checking Bernard McNamara
            puts "#{developers[3].name} owes €#{developers[3].owes_amount}"

          when choice == 5 then       #Checking Liam Carroll
            puts "#{developers[4].name} owes €#{developers[4].owes_amount}"

        end

      ########## CHECKING HOW MUCH DEVELOPER OWES BANKS ################

      when choice == 5 then

        puts "\nCHECKING HOW MUCH DEVELOPER OWES BANKS"
        puts "\nWhich Developer do you want to Check?"
        puts "\n"
        puts "Check All Developers                 | 0"
        puts "Johnny Ronan                         | 1"
        puts "Richard Barrett                      | 2"
        puts "Sean Mulryan                         | 3"
        puts "Bernard McNamara                     | 4"
        puts "Liam Carroll                         | 5"

        userchoice = gets.chomp
        choice = userchoice.to_i
        # Nested case statement to check how much developer owes banks
        case
          when choice == 0 then       #Checking all Developers
            developers.each { |member|
              puts "#{member.name} owes the banks €#{member.owes_banks} altogether"
            }

            #writing the information to file
            File.open("developer_owes_banks.txt", "w") do |file|
              developers.each { |member|
                file.puts "#{member.name} owes the banks €#{member.owes_banks} altogether"
              }
            end

            puts "\nThe above details have been written to developer_owes_banks.txt"
          when choice == 1 then       #Checking Johnny Ronan
            puts "#{developers[0].name} owes the banks €#{developers[0].owes_banks}"

          when choice == 2 then       #Checking Richard Barrett
            puts "#{developers[1].name} owes the banks €#{developers[1].owes_banks}"

          when choice == 3 then       #Checking Sean Mulryan
            puts "#{developers[2].name} owes the banks €#{developers[2].owes_banks}"

          when choice == 4 then       #Checking Bernard McNamara
            puts "#{developers[3].name} owes the banks €#{developers[3].owes_banks}"

          when choice == 5 then       #Checking Liam Carroll
            puts "#{developers[4].name} owes the banks €#{developers[4].owes_banks}"

        end

      # Performing Bankruptcy tests (has major consequences)
      when choice == 6 then

        puts "\nPERFORMING BANKRUPTCY TEST (HAS MAJOR CONSEQUENCES"
        puts "\nPlease note that this action has major consequences:"
        puts " # The developer will be declared bankrupt if his loans are more than 25% higher than his net worth"
        puts " # If the developer is declared bankrupt:"
        puts "   - This will reduce the amount of money they owe - which may make them solvent"
        puts "   - The relevant bank`s loan book will be reduced by the relevant amount, and NAMA status will be set to true"
        puts "\nAre you sure that you wish to perform this task?"

        puts "\n"
        puts "Yes - perform bankruptcy test and implement consequences | 0"
        puts "No                                                       | 1"

        userchoice = gets.chomp
        choice = userchoice.to_i
        # Nested case statement either perform bankruptcy consequences or exit
        case
          when choice == 0 then
            #bankrupt_test defined in Developers.rb
            johnny_ronan.bankrupt_test
            richard_barrett.bankrupt_test
            sean_mulryan.bankrupt_test
            bernard_mcnamara.bankrupt_test
            liam_carroll.bankrupt_test
            #Below if statements reduce developer & bank loans if developer bankrupt
            #This affects solvency and nama-status attributes
            if johnny_ronan.bankrupt == true then
              banks_loans = anglo.amount_of_loans.to_i
              johnnys_loans = johnny_ronan.loans.to_i
              reduce_loans = johnnys_loans * 0.70
              new_banks_loans = ( banks_loans -= (johnnys_loans * 0.70))
              anglo.amount_of_loans = new_banks_loans.to_i
              new_loan_figure = johnnys_loans * 0.30
              johnny_ronan.loans = new_loan_figure.to_i
              anglo.nama_status = true
            end

            if richard_barrett.bankrupt == true then
              banks_loans = aib.amount_of_loans.to_i
              richards_loans = richard_barrett.loans.to_i
              reduce_loans = richards_loans * 0.80
              new_banks_loans = ( banks_loans -= (richards_loans * 0.80))
              aib.amount_of_loans = new_banks_loans.to_i
              new_loan_figure = richards_loans * 0.20
              richard_barrett.loans = new_loan_figure.to_i
              aib.nama_status = true
            end

            if sean_mulryan.bankrupt == true then
              banks_loans = boi.amount_of_loans.to_i
              seans_loans = sean_mulryan.loans.to_i
              reduce_loans = seans_loans * 0.65
              new_banks_loans = ( banks_loans -= (seans_loans * 0.65))
              boi.amount_of_loans = new_banks_loans.to_i
              new_loan_figure = seans_loans * 0.35
              sean_mulryan.loans = new_loan_figure.to_i
              boi.nama_status = true
            end

            if bernard_mcnamara.bankrupt == true then
              banks_loans = rbs.amount_of_loans.to_i
              bernards_loans = bernard_mcnamara.loans.to_i
              reduce_loans = bernards_loans * 0.90
              new_banks_loans = ( banks_loans -= (bernards_loans * 0.90))
              rbs.amount_of_loans = new_banks_loans.to_i
              new_loan_figure = bernards_loans * 0.10
              bernard_mcnamara.loans = new_loan_figure.to_i
              rbs.nama_status = true
            end

            if liam_carroll.bankrupt == true then
              banks_loans = ulster.amount_of_loans.to_i
              liams_loans = liam_carroll.loans.to_i
              reduce_loans = liams_loans * 0.95
              new_banks_loans = ( banks_loans -= (liams_loans * 0.95))
              ulster.amount_of_loans = new_banks_loans.to_i
              new_loan_figure = liams_loans * 0.05
              liam_carroll.loans = new_loan_figure.to_i
              ulster.nama_status = true
            end
          #abandon bankruptcy chances and have the option to continue or exit
          when choice == 1 then
            SystemExit

        end

      # LET THE USER EXIT THE PROGRAM
      when choice == 7 then
        puts "\nThanks..Have a great day!"
        exit + 2

    end
    puts "\nDo you want to check information again?"
    puts "Exit          | 0"
    puts "Check Again   | 1"
    repeat = gets.chomp
    repeat = repeat.to_i #users choice on whether to repeat program - this is the condition for the loop
  end

end

