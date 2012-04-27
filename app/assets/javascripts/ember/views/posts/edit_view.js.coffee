EmberRailsDemo.EditPostView = Ember.View.extend(
  tagName: "form"
  templateName: "ember/templates/posts/edit"
  didInsertElement: ->
    @transaction = EmberRailsDemo.store.transaction()
    @transaction.add @get("post")
    @_super()
    @$("input:first").focus()

  cancelForm: ->
    @transaction.rollback()
    @get("parentView").hideEdit()

  submit: (event) ->
    post = @get("post")
    validationErrors = post.validate()
    event.preventDefault()
    if validationErrors isnt `undefined`
      EmberRailsDemo.displayError validationErrors
    else
      @transaction.commit()
      @get("parentView").hideEdit()
)