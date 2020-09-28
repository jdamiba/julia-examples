using Plots
using Interact
gr()
I_0 = 1 # initial number of infected
c = 0.01 # avg number of people each infected person infects each day
λ = 1 + c
I_1 = λ * I_0
β(I, S) = p * α * (N - I)
p = 0.1
α = 0.01
N = 1000

function run_infection(T = 20)
    I = zeros(T)
    I[1] = I_0
    for n = 1:T-1
        I[n+1] = λ * I[n]
    end
    return I
end

end_T = 50

#=
exponential growth model assumes there is an infinite population
@manipulate for T in slider(1:end_T, value = 1)
    result = run_infection(T)
    Plots.plot(log10.(result), m = :o,
               label = "I[n]",
               legend = :topleft) # vector is y, x is len(y)
    xlims!(0, end_T)
end
=#


#=
logistic growth is more realistic

assume each individual is in contact with a fractin α
of the population

each contact has probabiliity p of being
infected through contact with already infected person

assume that infected people can only infect people who are
not currently infected (susceptible)
=#


function run_infection_logistic(T = 20)
    I = zeros(T)
    I[1] = I_0
    for n = 1:T-1
        I[n+1] = I[n] + β(I[n], N - I[n]) * I[n]
    end
    return I
end

#=
@manipulate for T in slider(1:end_T, value = 1)
    result = run_infection_logistic(T)
    Plots.plot((result), m = :o,
               label = "I[n]",
               legend = :topleft) # vector is y, x is len(y)
    xlims!(0, end_T)
end
=#

#=
we want to model the fact that different people/groups
are more or less susceptible to becoming infected
and to infecting others
Indivudial Based Models
Patch model- local patches where population
is well mixed
network model - links between nodes
(each node is person/patch, each link is a contact)
=#

function run_infection_hetero(T = 20, c_average=1.1)
    I = zeros(T)
    I[1] = I_0
    for n = 1:T-1
        c = c_average + 0.1 * randn()
        I[n+1] = I[n] + c * I[n]
    end
    return I
end
