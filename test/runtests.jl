#
# Tests
#

using ELM

tests = ["xor.jl"]
				
println("Running test:")

for tst in tests
	println(" * $(tst)")
	include(tst)
end
