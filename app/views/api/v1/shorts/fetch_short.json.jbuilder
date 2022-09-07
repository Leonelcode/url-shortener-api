json.ignore_nil!
@short ? (json.shortcode @object) : (json.errors @object)
