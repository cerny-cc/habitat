pkg_name=commons-daemon
pkg_origin=cerny-cc
pkg_version="1.0.15"
pkg_maintainer="Nathan Cerny <ncerny@gmail.com>"
pkg_license=('Apache-2.0')
pkg_source="http://mirrors.gigenet.com/apache/${pkg_name/-/\/}/source/${pkg_name}-${pkg_version}-src.tar.gz"
pkg_shasum="11ee57d2c6b281589c1497b2f88180553f06d5ac1560ce1841e05f89f0342432"
pkg_source_bin="http://mirrors.gigenet.com/apache/${pkg_name/-/\/}/binaries/${pkg_name}-${pkg_version}-bin.tar.gz"
pkg_shasum_bin="0dab09bd0d2028000367a6d5c1592b92c71b561a3f98838f6162ae1623e139d8"
pkg_deps=(core/glibc core/jdk8/8u131)
pkg_build_deps=(core/gcc core/make core/coreutils)
# pkg_lib_dirs=(lib)
# pkg_include_dirs=(include)
pkg_bin_dirs=(bin)
# pkg_pconfig_dirs=(lib/pconfig)
# pkg_svc_run=""
# pkg_exports=(
#   [host]=srv.address
#   [port]=srv.port
#   [ssl-port]=srv.ssl.port
# )
# pkg_exposes=(port ssl-port)
# pkg_interpreters=(bin/bash)
# pkg_svc_user="hab"
# pkg_svc_group="$pkg_svc_user"
# pkg_description="Some description."
# pkg_upstream_url="http://example.com/project-name"

do_download() {
  do_default_download
  download_file $pkg_source_bin ${pkg_filename/src/bin} $pkg_shasum_bin
}
do_unpack() {
  do_default_unpack
  mv $HAB_CACHE_SRC_PATH/$pkg_dirname-src/src/native/unix $HAB_CACHE_SRC_PATH/$pkg_dirname
  unpack_file ${pkg_filename/src/bin}
}
do_build() {
  export JAVA_HOME=$(pkg_path_for core/jdk8)
  do_default_build
}
do_install() {
  mkdir -p $pkg_prefix/bin
  mkdir -p $pkg_prefix/java
  mv $HAB_CACHE_SRC_PATH/$pkg_dirname/NOTICE.txt $pkg_prefix
  mv $HAB_CACHE_SRC_PATH/$pkg_dirname/jsvc $pkg_prefix/bin
  mv $HAB_CACHE_SRC_PATH/$pkg_dirname/*.jar $pkg_prefix/java
}
