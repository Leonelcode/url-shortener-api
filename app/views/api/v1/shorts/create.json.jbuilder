json.ignore_nil!
@short.valid? ? (json.shortcode @object) : (json.errors @object)