np = 4
rng = MersenneTwister(1)
tempDir = joinpath(@__DIR__, "../results/test")
problemTest = setup_problem(np)

# Prediction experiment
ego_basetype = MAPController
ego_controller = ego_basetype{nothing}()
eval_controller = FixedSeedController{@S(1:n_controls(nominal_game(problemTest.d_eval)))}()

# Planning experiment
# uids = uindex(nominal_game(problemTest.d_eval))
# uid_ego = first(uids)
# uid_eval = vcat(uids[2:end]...)
# ego_controller = MAPController{uid_ego}()
# eval_controller = FixedSeedController{uid_eval}()

traj_cl, ego_prediction, true_game = run_simulation(problemTest..., eval_controller, ego_controller, rng; n_particles=30, 
infer_only=true, visualize=true, save_fig_path=nothing)

global out_traj_cl = traj_cl
global out_ego_prediction = ego_prediction
global out_true_game = true_game