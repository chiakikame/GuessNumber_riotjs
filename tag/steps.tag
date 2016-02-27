<steps>

  <ol>
    <li each={ items }>Your guess: { guessed }, { status }</li>
  </ol>

  <script>
    this.items = []

    add(guessed, status) {
      this.items.push({guessed: guessed, status: status})
    }

    clear() {
      this.items = []
    }
  </script>

</steps>
