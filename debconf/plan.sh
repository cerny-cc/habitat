pkg_name=debconf
pkg_origin=cerny-cc
pkg_version="1.5.61"
pkg_maintainer="Nathan Cerny <ncerny@gmail.com>"
pkg_license=('Apache-2.0')
pkg_source="http://http.debian.net/debian/pool/main/d/${pkg_name}/${pkg_name}_${pkg_version}.tar.xz"
pkg_shasum="7622a3fe231b46e6255a83b3d153159c10be6bc17b2152ab3937b8928bf87e10"
pkg_deps=(core/glibc core/perl)
pkg_build_deps=(core/make core/gcc)
pkg_lib_dirs=(usr/lib)
pkg_include_dirs=(usr/share)
pkg_bin_dirs=(usr/bin usr/sbin)
# pkg_pconfig_dirs=(lib/pconfig)
# pkg_svc_run="bin/haproxy -f $pkg_svc_config_path/haproxy.conf"
# pkg_exports=(
#   [host]=srv.address
#   [port]=srv.port
#   [ssl-port]=srv.ssl.port
# )
# pkg_exposes=(port ssl-port)
# pkg_binds=(
#   [database]="port host"
# )
# pkg_binds_optional=(
#   [storage]="port host"
# )
# pkg_interpreters=(bin/bash)
# pkg_svc_user="hab"
# pkg_svc_group="$pkg_svc_user"
# pkg_description="Some description."
# pkg_upstream_url="http://example.com/project-name"
do_unpack() {
  do_default_unpack
  mv $HAB_CACHE_SRC_PATH/${pkg_name} $HAB_CACHE_SRC_PATH/${pkg_name}-${pkg_version}
}

do_build() {
  return 0
}

do_install() {
  prefix=$pkg_prefix make install
  fix_interpreter usr/share/debconf/frontend core/perl bin/perl
  fix_interpreter usr/share/debconf/fix_db.p core/perl bin/perl
  fix_interpreter usr/share/debconf/transition_db.pl core/perl bin/perl
}
