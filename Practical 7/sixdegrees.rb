class Sixdegrees
  attr_accessor :origin, :target, :base_actor,
                :film_stack,:curr_film,:curr_actors,
                :this_level_actors,:next_level_actors,:degree
  def initialize(base, target)
    @origin = base
    @target = target.add_full_uri
    @base_actor = base.add_full_uri
    @film_stack = load_web_page(@base_actor, :actor)
    @curr_film = @film_stack.pop
    @curr_actors = load_web_page(@curr_film, :film)
    @this_level_actors = [@base_actor]
    @next_level_actors = []
    @degree = 0
  end
end