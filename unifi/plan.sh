pkg_name=unifi
pkg_origin=cerny-cc
pkg_version="5.5.24"
pkg_maintainer="Nathan Cerny <ncerny@gmail.com>"
pkg_license=('Apache-2.0')
pkg_source="http://dl.ubnt.com/${pkg_name}/${pkg_version}/unifi_sysvinit_all.deb"
pkg_shasum="2a3ea4acd0a9ca01eec5398e2cfd9c582b0b389237f55aa8cd2cccfcd42ee128"
pkg_deps=(core/glibc core/jdk8/8u131 core/perl)
pkg_build_deps=(cerny-cc/dpkg cerny-cc/debconf core/diffutils)
# pkg_lib_dirs=(lib)
# pkg_include_dirs=(include)
# pkg_bin_dirs=(bin)
# pkg_pconfig_dirs=(lib/pconfig)
pkg_svc_run="usr/lib/unifi/bin/unifi.init start"
# pkg_exports=(
#   [host]=srv.address
#   [port]=srv.port
#   [ssl-port]=srv.ssl.port
# )
# pkg_exposes=(port ssl-port)s
pkg_binds=(
  [database]="port host"
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
  touch "$(pkg_path_for cerny-cc/dpkg)/var/lib/dpkg/status"
  export DEBIAN_FRONTEND=noninteractive
  prefix=$pkg_prefix dpkg --force-depends -i $HAB_CACHE_SRC_PATH/$pkg_filename
}
