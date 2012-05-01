( ->
  Emberpusher = (channel, store, model) ->
    @channel = channel
    @store = store
    @model = model

    @channel.bind "created", (pushed_model) =>
      console?.log('created' + JSON.stringify(pushed_model))
      foo = @store.find(@model,pushed_model.id)
      if foo.get('id')
        foo.setProperties(pushed_model)
      else
        @store.load(@model, pushed_model)

    @channel.bind "updated", (pushed_model) =>
      console?.log('updated' + JSON.stringify(pushed_model))
      foo = @store.find(@model,pushed_model.id)
      if foo.get('id')
        foo.setProperties(pushed_model)
      else
        @store.load(@model, pushed_model)

    @channel.bind "destroyed", (pushed_model) =>
      console?.log('destroyed' + JSON.stringify(pushed_model))
      foo = @store.find(@model,pushed_model.id)
      if foo.get('id')
        foo.deleteRecord()

  @Emberpusher = Emberpusher
).call this
