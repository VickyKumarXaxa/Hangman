#!/usr/local/bin/perl

$matchContinue = 1;   #Variable as key to continue to next match or end program

while($matchContinue == 1){
	$wordIndex = int(rand(100));	#random integer generation to be used as index in word list to select the word

	#word list and word selection
	$word = ("computer", "radio", "calculator", "teacher", "bureau", "police", "geometry", "president", "subject", "country", "enviroment", "classroom", "animals", "province", "month", "politics", "puzzle", "instrument", "kitchen", "language", "vampire", "ghost", "solution", "service", "software", "virus", "security", "phonenumber", "expert", "website", "agreement", "support", "compatibility", "advanced", "search", "triathlon", "immediately", "encyclopedia", "endurance", "distance", "nature", "history", "organization", "international", "championship", "government", "popularity", "thousand", "feature", "wetsuit", "fitness", "legendary", "variation", "equal", "approximately", "segment", "priority", "physics", "branche", "science", "mathematics", "lightning", "dispersion", "accelerator", "detector", "terminology", "design", "operation", "foundation", "application", "prediction", "reference", "measurement", "concept", "perspective", "overview", "position", "airplane", "symmetry", "dimension", "toxic", "algebra", "illustration", "classic", "verification", "citation", "unusual", "resource", "analysis", "license", "comedy", "screenplay", "production", "release", "emphasis", "director", "trademark", "vehicle", "aircraft", "experiment")[$wordIndex];
	$wordLength = length($word);

	$life = 6;	#Variable to store the total no. of player's life

	#array to work as output display of word.
	#If correct letters are guessed, "_" will be replaced by them at their respective index
	for(my $i = 0; $i < $wordLength; $i++){
		$wordDisplay[$i] = "_";
	}

	$matchWin = 0;	#Variable to check if match has been won or not
	@inputWord = ();	#array to store the input letters entered as Guesses

	while(($life > 0) && ($matchWin == 0)){
		$flag = 0;	#Variable to act as flag if input letter is present in the word

		print "Word : ";
		print join(" ", @wordDisplay);
		print "\n";

		print "Guesses : @inputWord";
		print "\nLife : $life\n";

		graphicOutput();	#Subroutine to print the graphic hangman

		print "\nMake a Guess : ";
		$letterInput = <STDIN>;
		$letterInput = substr( $letterInput, 0, 1 );	#Triming of input to accept only the first letter
		#chomp $letterInput;
		push @inputWord, $letterInput;

		$offset = 0;

		#loop to check if letter is present in word or not.
		#If present, they are placed in correct politics in "wordDisplay" array

		$result = index($word, $letterInput, $offset);

	 	while ($result != -1) {
	    	$wordDisplay[$result] = $letterInput;

	    	$flag = 1;
	    	$offset = $result + 1;
	    	$result = index($word, $letterInput, $offset);
	    }

	    #Matching of strings, If matched value of $matchWin changes to end the game

		if(join("", @wordDisplay) eq $word){
			$matchWin = 1;
		}

		if($flag == 0){
			$life--;
		}
		print "\n";
	}

	if($matchWin == 1){
		print "The word Was : $word\n";
		print "Nice Play\nYou Win\n";
		print "\nDo You Wish to Continue : Y/N ?\n";
		print "Enter : ";
		$matchInput = <STDIN>;
		$matchInput = substr( $matchInput, 0, 1 );
	}
	else{
		graphicOutput();
		print "You Lose\nThe word was $word\n";
		print "\nDo You Wish to Continue : Y/N ?\n";
		print "Enter : ";
		$matchInput = <STDIN>;
		$matchInput = substr( $matchInput, 0, 1 );
	}

	if(($matchInput eq "N") || ($matchInput eq "n")){
		$matchContinue = 0;
		print "Thank You for Playing\n";
	}
}

sub graphicOutput{
		if($life == 6){
			print "	  __\n";
			print "	 |  |\n";
			print "	    |\n";
			print "	    |\n";
			print "	    |\n";
			print "	   _|_\n";
		}
		elsif($life == 5){
			print "	  __\n";
			print "	 |  |\n";
			print "	 o  |\n";
			print "	    |\n";
			print "	    |\n";
			print "	   _|_\n";
		}
		elsif($life == 4){
			print "	  __\n";
			print "	 |  |\n";
			print "	 o  |\n";
			print "	 |  |\n";
			print "	    |\n";
			print "	   _|_\n";
		}
		elsif($life == 3){
			print "	  __\n";
			print "	 |  |\n";
			print "	\\o  |\n";
			print "	 |  |\n";
			print "	    |\n";
			print "	   _|_\n";
		}
		elsif($life == 2){
			print "	  __\n";
			print "	 |  |\n";
			print "	\\o/ |\n";
			print "	 |  |\n";
			print "	    |\n";
			print "	   _|_\n";
		}
		elsif($life == 1){
			print "	  __\n";
			print "	 |  |\n";
			print "	\\o/ |\n";
			print "	 |  |\n";
			print "	/   |\n";
			print "	   _|_\n";
		}
		else{
			print "	  __\n";
			print "	 |  |\n";
			print "	\\o/ |\n";
			print "	 |  |\n";
			print "	/ \\ |\n";
			print "	   _|_\n";
		}
}

