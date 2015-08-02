module AdvertsHelper

	def select_for_countries_helper
		["Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", 
		"Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", 
		"Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", 
		"Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegovina", "Botswana", "Brazil", "Bulgaria", 
		"Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", 
		"Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Colombia", 
		"Comoros", "Congo", "D. R. Congo", "Costa Rica", "Cote d'Ivoire", "Croatia", "Cuba", 
		"Cyprus", "Czech Republic","Denmark", "Dominica", "Dominican Republic", "Ecuador", "Egypt", 
		"El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Finland", "France", 
		"Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", 
		"Grenada", "Guadeloupe", "Guam", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", 
		"Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", 
		"Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", 
		"South Korea", " North Korea", "Kuwait", "Kyrgyzstan", "Latvia", "Lebanon", "Lesotho", 
		"Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macao", "Macedonia", 
		"Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Martinique", "Mauritania", 
		"Mauritius", "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Morocco", 
		"Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "New Zealand", "Nicaragua", 
		"Niger", "Nigeria", "Norway", "Oman", "Pakistan", "Panama", "Papua New Guinea", "Paraguay", 
		"Peru", "Philippines", "Poland", "Portugal", "Puerto Rico", "Qatar", "Romania", "Russia", 
		"Rwanda", "Samoa", "San Marino", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", 
		"Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Somalia", "South Africa", "Spain", 
		"Sri Lanka", "Sudan", "Suriname", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", 
		"Tajikistan", "Tanzania", "Thailand", "Togo", "Tonga", "Trinidad and Tobago", "Tunisia", 
		"Turkey", "Turkmenistan", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", 
		"United States", "Uruguay", "Uzbekistan", "Venezuela", "Vietnam", "Virgin Islands, British", 
		"Virgin Islands, U.S.", "Yemen", "Zambia","Zimbabwe"]
	end

	def select_for_currencies_helper
		["EUR - Euro",'USD - U.S. dollar', "AUD - Australian dollar", "CAD - Canadian dollar", 
		 "CHF - Swiss franc", "CNY - Chinese yuan", "GBP - Pound sterling", "HKD - Hong Kong dollar", 
		 "INR - Indian rupee", "JPY - Japanese yen", "KRW - South Korean won", "PLN - Polish złoty", 
		 "RUB - Russian ruble", "SEK - Swedish krona", "SGD - Singapore dollar", "TRY - Turkish lira", 
		 "TWD - New Taiwan dollar", "ZAR - South African rand"]
	end

	def currency_to_symbol_helper(currency)
		case currency
		when "USD - U.S. dollar"
			"$"
		when "EUR - Euro"
			"€"
		when "AUD - Australian dollar"
			"AUD"
		when "CAD - Canadian dollar"
			"CAD"
		when "CHF - Swiss franc"
			"CHF"
		when "CNY - Chinese yuan"
			"CNY"
		when "GBP - Pound sterling"
			"£"
		when "HKD - Hong Kong dollar"
			"HKD"
		when "INR - Indian rupee"
			"INR"
		when "JPY - Japanese yen"
			"JPY"
		when "KRW - South Korean won"
			"KRW"
		when "PLN - Polish złoty"
			"PLN"
		when "RUB - Russian ruble"
			"RUB"
		when "SEK - Swedish krona"
			"SEK"
		when "SGD - Singapore dollar"
			"SGD"
		when "TRY - Turkish lira"
			"TRY"
		when "TWD - New Taiwan dollar"
			"TWD"
		when "ZAR - South African rand"
			"ZAR"
		end
	end

end
