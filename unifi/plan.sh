pkg_name=unifi
pkg_origin=cerny-cc
pkg_version="5.5.24"
pkg_maintainer="Nathan Cerny <ncerny@gmail.com>"
pkg_license=('Apache-2.0')
pkg_source="http://dl.ubnt.com/${pkg_name}/${pkg_version}/unifi_sysvinit_all.deb"
pkg_shasum="2a3ea4acd0a9ca01eec5398e2cfd9c582b0b389237f55aa8cd2cccfcd42ee128"
pkg_deps=(core/jre8 cerny-cc/commons-daemon)
pkg_build_deps=(cerny-cc/dpkg cerny-cc/debconf core/diffutils core/procps-ng core/perl)
pkg_lib_dirs=(lib)
# pkg_include_dirs=(include)
pkg_bin_dirs=(bin)
# pkg_pconfig_dirs=(lib/pconfig)
# pkg_svc_run="usr/lib/unifi/bin/unifi.init start"
# Export Volumes:
# /usr/lib/unifi/conf
# /usr/lib/unifi/dl
# pkg_exports=(
#   [host]=srv.address
#   [port]=srv.port
#   [ssl-port]=srv.ssl.port
# )
# pkg_exposes=(port ssl-port)s
pkg_binds=(
  [database]="port"
)
# pkg_binds_optional=(
#   [storage]="port host"
# )
# pkg_interpreters=(bin/bash)
# pkg_svc_user="hab"
# pkg_svc_group="$pkg_svc_user"
# pkg_description="Some description."
# pkg_upstream_url="http://example.com/project-name"

do_unpack() {
  return 0
}

do_build() {
  return 0
}

do_install() {
  # Make dpkg think we're always doing a fresh install - beacuse we should be.
  cat /dev/null > "$(pkg_path_for cerny-cc/dpkg)/var/lib/dpkg/status"
  ln -fs "$(pkg_path_for cerny-cc/debconf)/usr/share/debconf" /usr/share/
  ln -fs "$(pkg_path_for core/perl)/bin/perl" /usr/bin/perl
  export PERL5LIB="$(pkg_path_for cerny-cc/debconf)/usr/share/perl5"
  export DEBIAN_FRONTEND=noninteractive
  dpkg --force-depends --unpack $HAB_CACHE_SRC_PATH/$pkg_filename
  mv /usr/lib/unifi/* $pkg_prefix
  rm /usr/share/debconf
  rm /usr/bin/perl
}

do_strip() {
  return 0
}
