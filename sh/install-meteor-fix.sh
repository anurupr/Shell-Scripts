

INSTALL_TMPDIR="$HOME/.meteor-install-tmp"
rm -rf "$INSTALL_TMPDIR"
mkdir "$INSTALL_TMPDIR"
echo "Downloading Meteor distribution"
tar -xzf "/home/anurup/Downloads/meteor-bootstrap-os.linux.x86_64.tar.gz" -C "$INSTALL_TMPDIR" -o
# bomb out if it didn't work, eg no net
test -x "${INSTALL_TMPDIR}/.meteor/meteor"
mv "${INSTALL_TMPDIR}/.meteor" "$HOME"
rm -rf "${INSTALL_TMPDIR}"
# just double-checking :)
test -x "$HOME/.meteor/meteor"



echo
echo "Meteor ${RELEASE} has been installed in your home directory (~/.meteor)."

METEOR_SYMLINK_TARGET="$(readlink "$HOME/.meteor/meteor")"
METEOR_TOOL_DIRECTORY="$(dirname "$METEOR_SYMLINK_TARGET")"
LAUNCHER="$HOME/.meteor/$METEOR_TOOL_DIRECTORY/scripts/admin/launch-meteor"




if cp "$LAUNCHER" "$PREFIX/bin/meteor" >/dev/null 2>&1; then
  echo "Writing a launcher script to $PREFIX/bin/meteor for your convenience."
  cat <<"EOF"

To get started fast:

  $ meteor create ~/my_cool_app
  $ cd ~/my_cool_app
  $ meteor

Or see the docs at:

  docs.meteor.com

EOF
elif type sudo >/dev/null 2>&1; then
  echo "Writing a launcher script to $PREFIX/bin/meteor for your convenience."
  echo "This may prompt for your password."

  # New macs (10.9+) don't ship with /usr/local, however it is still in
  # the default PATH. We still install there, we just need to create the
  # directory first.
  # XXX this means that we can run sudo too many times. we should never
  #     run it more than once if it fails the first time
  if [ ! -d "$PREFIX/bin" ] ; then
      sudo mkdir -m 755 "$PREFIX" || true
      sudo mkdir -m 755 "$PREFIX/bin" || true
  fi

  if sudo cp "$LAUNCHER" "$PREFIX/bin/meteor"; then
    cat <<"EOF"

To get started fast:

  $ meteor create ~/my_cool_app
  $ cd ~/my_cool_app
  $ meteor

Or see the docs at:

  docs.meteor.com

EOF
  else
    cat <<EOF

Couldn't write the launcher script. Please either:

  (1) Run the following as root:
        cp "$LAUNCHER" /usr/bin/meteor
  (2) Add "\$HOME/.meteor" to your path, or
  (3) Rerun this command to try again.

Then to get started, take a look at 'meteor --help' or see the docs at
docs.meteor.com.
EOF
  fi
else
  cat <<EOF

Now you need to do one of the following:

  (1) Add "\$HOME/.meteor" to your path, or
  (2) Run this command as root:
        cp "$LAUNCHER" /usr/bin/meteor

Then to get started, take a look at 'meteor --help' or see the docs at
docs.meteor.com.
EOF
fi

