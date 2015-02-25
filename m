Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 13D4EE003FA; Wed, 25 Feb 2015 12:04:32 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2461EE003A8
	for <meta-ti@yoctoproject.org>; Wed, 25 Feb 2015 12:04:29 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1PK4SXK024087
	for <meta-ti@yoctoproject.org>; Wed, 25 Feb 2015 14:04:28 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1PK4Rqu026840
	for <meta-ti@yoctoproject.org>; Wed, 25 Feb 2015 14:04:27 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 25 Feb 2015 14:04:27 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1PK4QZp011338;
	Wed, 25 Feb 2015 14:04:26 -0600
Date: Wed, 25 Feb 2015 15:04:26 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150225200426.GD5924@edge>
References: <1424892505-24513-1-git-send-email-j-stiffler@ti.com>
	<1424892505-24513-2-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1424892505-24513-2-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/2] ti-llvm3.3: Add LLVM 3.3 with c6x intrinsic support.
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Feb 2015 20:04:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Is this an RFC or a final patch?


On Wed, Feb 25, 2015 at 02:28:25PM -0500, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  ...e-Do-not-check-build-executable-extension.patch |   60 ++++++++++++
>  recipes-core/llvm/ti-llvm3.3_3.3.bb                |  102 ++++++++++++++++++++
>  2 files changed, 162 insertions(+)
>  create mode 100644 recipes-core/llvm/ti-llvm3.3/0001-configure-Do-not-check-build-executable-extension.patch
>  create mode 100644 recipes-core/llvm/ti-llvm3.3_3.3.bb
> 
> diff --git a/recipes-core/llvm/ti-llvm3.3/0001-configure-Do-not-check-build-executable-extension.patch b/recipes-core/llvm/ti-llvm3.3/0001-configure-Do-not-check-build-executable-extension.patch
> new file mode 100644
> index 0000000..b6e5331
> --- /dev/null
> +++ b/recipes-core/llvm/ti-llvm3.3/0001-configure-Do-not-check-build-executable-extension.patch
> @@ -0,0 +1,60 @@
> +From 60da8adc29a84796c9768a1a962eda1915c87332 Mon Sep 17 00:00:00 2001
> +From: Jake Stiffler <j-stiffler@ti.com>
> +Date: Fri, 20 Feb 2015 10:55:11 -0500
> +Subject: [PATCH] configure: Do not check build executable extension.
> +
> + * This seems to cause issues nativesdk and build sdk
> +   architectures are the same.
> +
> +Signed-off-by: Jake Stiffler <j-stiffler@ti.com>
> +---
> + configure                 |    3 +++
> + projects/sample/configure |    4 ++++
> + 2 files changed, 7 insertions(+)
> +
> +diff --git a/configure b/configure
> +index decbc40..387c4fd 100755
> +--- a/configure
> ++++ b/configure
> +@@ -4951,6 +4951,8 @@ echo "$as_me: error: no acceptable cc found in \$PATH" >&2;}
> +   rm -f conftest*
> +   echo 'int main () { return 0; }' > conftest.$ac_ext
> +   ac_cv_build_exeext=
> ++
> ++if false; then
> +   if { (eval echo "$as_me:$LINENO: \"$ac_build_link\"") >&5
> +   (eval $ac_build_link) 2>&5
> +   ac_status=$?
> +@@ -4967,6 +4969,7 @@ echo "$as_me: error: no acceptable cc found in \$PATH" >&2;}
> + echo "$as_me: error: installation or configuration problem: compiler cannot create executables." >&2;}
> +    { (exit 1); exit 1; }; }
> +   fi
> ++fi
> +   rm -f conftest*
> +   test x"${ac_cv_build_exeext}" = x && ac_cv_build_exeext=blank
> + fi
> +diff --git a/projects/sample/configure b/projects/sample/configure
> +index a2c70c6..b57f21c 100755
> +--- a/projects/sample/configure
> ++++ b/projects/sample/configure
> +@@ -4753,6 +4753,8 @@ echo "$as_me: error: no acceptable cc found in \$PATH" >&2;}
> +   rm -f conftest*
> +   echo 'int main () { return 0; }' > conftest.$ac_ext
> +   ac_cv_build_exeext=
> ++
> ++if false; then
> +   if { (eval echo "$as_me:$LINENO: \"$ac_build_link\"") >&5
> +   (eval $ac_build_link) 2>&5
> +   ac_status=$?
> +@@ -4769,6 +4771,8 @@ echo "$as_me: error: no acceptable cc found in \$PATH" >&2;}
> + echo "$as_me: error: installation or configuration problem: compiler cannot create executables." >&2;}
> +    { (exit 1); exit 1; }; }
> +   fi
> ++fi
> ++
> +   rm -f conftest*
> +   test x"${ac_cv_build_exeext}" = x && ac_cv_build_exeext=blank
> + fi
> +-- 
> +1.7.9.5
> +
> diff --git a/recipes-core/llvm/ti-llvm3.3_3.3.bb b/recipes-core/llvm/ti-llvm3.3_3.3.bb
> new file mode 100644
> index 0000000..30b8a20
> --- /dev/null
> +++ b/recipes-core/llvm/ti-llvm3.3_3.3.bb
> @@ -0,0 +1,102 @@
> +DESCRIPTION = "LLVM 3.3 with support for TI C66x intrinsics"
> +
> +do_configure_prepend_class-native() {
> +    # Fix paths in llvm-config
> +    sed -i "s|sys::path::parent_path(sys::path::parent_path(CurrentPath))).str()|sys::path::parent_path(CurrentPath))\.str()|g" ${S}/tools/llvm-config/llvm-config.cpp
> +}
> +
> +require recipes-core/llvm/llvm.inc
> +require recipes-core/llvm/llvm3.inc
> +
> +DEPENDS_append_class-native = " llvm-common-native"
> +
> +LLVM_DIR = "ti-llvm${PV}"
> +
> +BRANCH = "master"
> +
> +SRC_URI = " \
> +  git://gitorious.design.ti.com/ocl/llvm33-src.git;protocol=git;branch=${BRANCH} \
> +  file://0001-configure-Do-not-check-build-executable-extension.patch \
> +"
> +
> +
> +SRCREV = "4b61e2a944d1de76e425f4bede9d718618ebd2b7"
> +
> +S = "${WORKDIR}/git"
> +
> +do_compile_class-native() {
> +  cd ${LLVM_BUILD_DIR}
> +  oe_runmake
> +}
> +
> +do_compile_class-nativesdk() {
> +    cd ${LLVM_BUILD_DIR}
> +    oe_runmake \
> +        AR="${BUILD_AR}" \
> +        CC="${BUILD_CC}" \
> +        CFLAGS="${BUILD_CFLAGS}" \
> +        CXX="${BUILD_CXX}" \
> +        CXXFLAGS="${BUILD_CXXFLAGS}" \
> +        CPP="${BUILD_CPP}" \
> +        CPPFLAGS="${BUILD_CPPFLAGS}" \
> +        LD="${BUILD_LD}" \
> +        LDFLAGS="${BUILD_LDFLAGS}" \
> +        NM="${BUILD_NM}" \
> +        RANLIB="${BUILD_RANLIB}" \
> +        PATH="${STAGING_BINDIR_NATIVE}:$PATH" \
> +        cross-compile-build-tools
> +    oe_runmake
> +}
> +
> +do_install_append_class-target() {
> +    for b in ${D}${bindir}/${LLVM_DIR}/${HOST_SYS}-clang*; do
> +        if [ ! -L ${b} ]; then
> +            mv ${b} ${D}${bindir}/`echo "${b}" | sed -e 's|${D}${bindir}/${LLVM_DIR}/${HOST_SYS}-||g'`
> +        fi
> +    done
> +}
> +
> +do_install_class-native() {
> +    cd ${LLVM_BUILD_DIR}
> +    oe_runmake DESTDIR=${LLVM_INSTALL_DIR} install
> +
> +    mv ${LLVM_INSTALL_DIR}${bindir}/${HOST_SYS}-llvm-config ${LLVM_INSTALL_DIR}/llvm-config${PV}-ti
> +
> +    install -d ${D}${bindir}
> +    for b in ${LLVM_INSTALL_DIR}${bindir}/${HOST_SYS}-clang*; do
> +        if [ ! -L ${b} ]; then
> +            mv ${b} ${D}${bindir}/`echo "${b}" | sed -e 's|${LLVM_INSTALL_DIR}${bindir}/${HOST_SYS}-||g'`
> +        fi
> +    done
> +
> +    install -d ${D}${bindir}/${LLVM_DIR}
> +    mv ${LLVM_INSTALL_DIR}${bindir}/* ${D}${bindir}/${LLVM_DIR}/
> +
> +    install -d ${D}${includedir}/${LLVM_DIR}
> +    mv ${LLVM_INSTALL_DIR}${includedir}/* ${D}${includedir}/${LLVM_DIR}/
> +
> +    install -d ${D}${libdir}/${LLVM_DIR}
> +    mv ${LLVM_INSTALL_DIR}${libdir}/* ${D}${libdir}/${LLVM_DIR}/
> +    ln -s ${LLVM_DIR}/libLLVM-${PV}.so ${D}${libdir}/libLLVM-${PV}.so
> +
> +    install -d ${D}${docdir}/${LLVM_DIR}
> +    mv ${LLVM_INSTALL_DIR}${prefix}/docs/llvm/* ${D}${docdir}/${LLVM_DIR}
> +
> +    install -d ${D}${bindir}
> +    install -m 0755 ${LLVM_INSTALL_DIR}/llvm-config${PV}-ti ${D}${bindir}
> +}
> +
> +SYSROOT_PREPROCESS_FUNCS_class-target += "llvm_sysroot_preprocess_target"
> +SYSROOT_PREPROCESS_FUNCS_class-nativesdk += "llvm_sysroot_preprocess_target"
> +
> +llvm_sysroot_preprocess() {
> +    :
> +}
> +
> +llvm_sysroot_preprocess_target() {
> +    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
> +    mv ${LLVM_INSTALL_DIR}/llvm-config-host ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}-ti
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

