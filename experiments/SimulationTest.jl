np = 3
rng = MersenneTwister(1)
problemTest = setup_problem(np)

ego_basetype = FixedSeedController
ego_controller = ego_basetype{nothing}()
eval_controller = FixedSeedController{@S(1:n_controls(nominal_game(problemTest.d_eval)))}()

traj_cl, ego_prediction, true_game = run_simulation(problemTest..., eval_controller, ego_controller, rng; n_particles=50, infer_only=false, visualize=true)

global out_traj_cl = traj_cl
global out_ego_prediction = ego_prediction
global out_true_game = true_game
1