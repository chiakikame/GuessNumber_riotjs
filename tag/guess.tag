<guess>

  <h1>Guess number!</h1>
  <input name='input_num'/>
  <button onclick={ makeGuess } disabled={ this.game_ended }>Go!</button>
  <p if={ !this.game_ended }></p>
  <p if={ this.game_ended }>You win !!</p>
  <button onclick={ restart }>Restart</button>
  <hr/>
  <steps></steps>
  <hr/>
  <p if={ this.game_ended }>You win !!</p>

  <script>
    this.number = "0123"
    this.debug = opts.debug
    this.game_ended = false

    this.on('mount', function(){
      this.restart()
    })

    makeGuess() {
      if (this.game_ended) return

      var correct = this.number.toString()
      var guessed = this.input_num.value
      var guessStatus = this.get_guess_status(correct, guessed)
      this.tags.steps.add(guessed, guessStatus)
      if (guessStatus == "4A0B") {
        this.game_ended = true
      }
    }

    restart() {
      this.tags.steps.clear()

      var numbers = []
      for(i = 0; i < 10; i++) {numbers.push(i.toString())}

      this.number = ""
      for(i = 0; i < 4; i++) {
        var idx = Math.floor(Math.random() * numbers.length)
	this.number += numbers[idx]
	numbers.splice(idx, 1)
      }
      this.game_ended = false
      console.log("Game reset")
      if (this.debug) console.log("DEBUG: number is " + this.number)
      
      this.input_num.value = ""
    }

    get_guess_status(correct, guessed) {
      var correctInCharAndIdx = 0
      var correctInCharOnly = 0
      for(i = 0; i < correct.length; i++) {
        for(j = 0; j < guessed.length; j++) {
	  if (correct.charAt(i) == guessed.charAt(j)) {
	    if (i == j) {
	      correctInCharAndIdx += 1
	    } else {
	      correctInCharOnly += 1
	    }
	    break
	  }
	} // for j
      } // for i
      return correctInCharAndIdx + "A" + correctInCharOnly + "B"
    }
  </script>

</guess>
