#Elixir notes

docs:

	[
		{:ex_doc, "~> 0.12"}
	]
	mix deps.get
	mix docs

Running Elixir code on terminal:

	Go to elixir project directory
	iex -S mix

Syntax:

	for loop
		for value <- values do
			“value is #{value}”
		end
	
	Pattern matching
		[var1, var2] = [1, 2]
	
	case
		case status do
			:case1 -> 
			:case2 ->
		end

	I/O
		item = :erlang.term_to_binary(arg)
		File.write(fileName, binary)
		{status, binary} = File.read(fileName)
		:erlang.binary_to_term(binary) 

	Atom
		Atom in elixir is a :example. ex) :ok, :error
		Used for handling messages, status, control flow, etc

	Test
		assert
		refute
		MIX_ENV=test mix deps.compile


	maps
		color = %{primary: “red”, secondary: “blue”}
		color.primary
		Map.put(colors, :primary, “yellow”)
		%{color | primary: “green”}

	Enum
		Enum.map() returns new collection
		Enum.each() doesn’t return new collection


Benefits:

	Control of processes
	Better concurrency
	Asynchronous method calls
	Simplicity aka reduction of complexity
	Concurrency as primitive
	Direct control over what processes were alive
	Robustness of code and constant uptime
	Process mailboxes so no more messages queues 
	Web socket support as a first class citizen
	GenServers and all the various ways to call a method

Drawbacks:

	Not that many libraries and support for Elixir
	CPU intensive (ex. hard to execute heavy mathematical functions)
	
