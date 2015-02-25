Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C0D2DE003AB; Wed, 25 Feb 2015 12:53:11 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66D1BE002F9
	for <meta-ti@yoctoproject.org>; Wed, 25 Feb 2015 12:53:07 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1PKr6fR009682
	for <meta-ti@yoctoproject.org>; Wed, 25 Feb 2015 14:53:06 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1PKr5cm011118
	for <meta-ti@yoctoproject.org>; Wed, 25 Feb 2015 14:53:05 -0600
Received: from DLEE09.ent.ti.com ([fe80::d03e:3cf4:73ad:d589]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Wed, 25 Feb 2015 14:53:05 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 2/2] ti-llvm3.3: Add LLVM 3.3 with c6x
	intrinsic support.
Thread-Index: AQHQUTE+C4ZqMeKPJ0y2DEgymrCTu50CLrUA//+o0yA=
Date: Wed, 25 Feb 2015 20:53:04 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958140F5694@DLEE09.ent.ti.com>
References: <1424892505-24513-1-git-send-email-j-stiffler@ti.com>
	<1424892505-24513-2-git-send-email-j-stiffler@ti.com>
	<20150225200426.GD5924@edge>
In-Reply-To: <20150225200426.GD5924@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Wed, 25 Feb 2015 20:53:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This is an RFC.

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Wednesday, February 25, 2015 3:04 PM
To: Stiffler, Jacob
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH 2/2] ti-llvm3.3: Add LLVM 3.3 with c6x intrin=
sic support.

Is this an RFC or a final patch?


On Wed, Feb 25, 2015 at 02:28:25PM -0500, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  ...e-Do-not-check-build-executable-extension.patch |   60 ++++++++++++
>  recipes-core/llvm/ti-llvm3.3_3.3.bb                |  102 ++++++++++++++=
++++++
>  2 files changed, 162 insertions(+)
>  create mode 100644=20
> recipes-core/llvm/ti-llvm3.3/0001-configure-Do-not-check-build-executa
> ble-extension.patch  create mode 100644=20
> recipes-core/llvm/ti-llvm3.3_3.3.bb
>=20
> diff --git=20
> a/recipes-core/llvm/ti-llvm3.3/0001-configure-Do-not-check-build-execu
> table-extension.patch=20
> b/recipes-core/llvm/ti-llvm3.3/0001-configure-Do-not-check-build-execu
> table-extension.patch
> new file mode 100644
> index 0000000..b6e5331
> --- /dev/null
> +++ b/recipes-core/llvm/ti-llvm3.3/0001-configure-Do-not-check-build-e
> +++ xecutable-extension.patch
> @@ -0,0 +1,60 @@
> +From 60da8adc29a84796c9768a1a962eda1915c87332 Mon Sep 17 00:00:00=20
> +2001
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
> +@@ -4951,6 +4951,8 @@ echo "$as_me: error: no acceptable cc found in \$P=
ATH" >&2;}
> +   rm -f conftest*
> +   echo 'int main () { return 0; }' > conftest.$ac_ext
> +   ac_cv_build_exeext=3D
> ++
> ++if false; then
> +   if { (eval echo "$as_me:$LINENO: \"$ac_build_link\"") >&5
> +   (eval $ac_build_link) 2>&5
> +   ac_status=3D$?
> +@@ -4967,6 +4969,7 @@ echo "$as_me: error: no acceptable cc found in=20
> +\$PATH" >&2;}  echo "$as_me: error: installation or configuration proble=
m: compiler cannot create executables." >&2;}
> +    { (exit 1); exit 1; }; }
> +   fi
> ++fi
> +   rm -f conftest*
> +   test x"${ac_cv_build_exeext}" =3D x && ac_cv_build_exeext=3Dblank  fi=
=20
> +diff --git a/projects/sample/configure b/projects/sample/configure=20
> +index a2c70c6..b57f21c 100755
> +--- a/projects/sample/configure
> ++++ b/projects/sample/configure
> +@@ -4753,6 +4753,8 @@ echo "$as_me: error: no acceptable cc found in \$P=
ATH" >&2;}
> +   rm -f conftest*
> +   echo 'int main () { return 0; }' > conftest.$ac_ext
> +   ac_cv_build_exeext=3D
> ++
> ++if false; then
> +   if { (eval echo "$as_me:$LINENO: \"$ac_build_link\"") >&5
> +   (eval $ac_build_link) 2>&5
> +   ac_status=3D$?
> +@@ -4769,6 +4771,8 @@ echo "$as_me: error: no acceptable cc found in=20
> +\$PATH" >&2;}  echo "$as_me: error: installation or configuration proble=
m: compiler cannot create executables." >&2;}
> +    { (exit 1); exit 1; }; }
> +   fi
> ++fi
> ++
> +   rm -f conftest*
> +   test x"${ac_cv_build_exeext}" =3D x && ac_cv_build_exeext=3Dblank  fi
> +--
> +1.7.9.5
> +
> diff --git a/recipes-core/llvm/ti-llvm3.3_3.3.bb=20
> b/recipes-core/llvm/ti-llvm3.3_3.3.bb
> new file mode 100644
> index 0000000..30b8a20
> --- /dev/null
> +++ b/recipes-core/llvm/ti-llvm3.3_3.3.bb
> @@ -0,0 +1,102 @@
> +DESCRIPTION =3D "LLVM 3.3 with support for TI C66x intrinsics"
> +
> +do_configure_prepend_class-native() {
> +    # Fix paths in llvm-config
> +    sed -i=20
> +"s|sys::path::parent_path(sys::path::parent_path(CurrentPath))).str()
> +|sys::path::parent_path(CurrentPath))\.str()|g"=20
> +${S}/tools/llvm-config/llvm-config.cpp
> +}
> +
> +require recipes-core/llvm/llvm.inc
> +require recipes-core/llvm/llvm3.inc
> +
> +DEPENDS_append_class-native =3D " llvm-common-native"
> +
> +LLVM_DIR =3D "ti-llvm${PV}"
> +
> +BRANCH =3D "master"
> +
> +SRC_URI =3D " \
> + =20
> +git://gitorious.design.ti.com/ocl/llvm33-src.git;protocol=3Dgit;branch=
=3D
> +${BRANCH} \
> +  file://0001-configure-Do-not-check-build-executable-extension.patch=20
> +\ "
> +
> +
> +SRCREV =3D "4b61e2a944d1de76e425f4bede9d718618ebd2b7"
> +
> +S =3D "${WORKDIR}/git"
> +
> +do_compile_class-native() {
> +  cd ${LLVM_BUILD_DIR}
> +  oe_runmake
> +}
> +
> +do_compile_class-nativesdk() {
> +    cd ${LLVM_BUILD_DIR}
> +    oe_runmake \
> +        AR=3D"${BUILD_AR}" \
> +        CC=3D"${BUILD_CC}" \
> +        CFLAGS=3D"${BUILD_CFLAGS}" \
> +        CXX=3D"${BUILD_CXX}" \
> +        CXXFLAGS=3D"${BUILD_CXXFLAGS}" \
> +        CPP=3D"${BUILD_CPP}" \
> +        CPPFLAGS=3D"${BUILD_CPPFLAGS}" \
> +        LD=3D"${BUILD_LD}" \
> +        LDFLAGS=3D"${BUILD_LDFLAGS}" \
> +        NM=3D"${BUILD_NM}" \
> +        RANLIB=3D"${BUILD_RANLIB}" \
> +        PATH=3D"${STAGING_BINDIR_NATIVE}:$PATH" \
> +        cross-compile-build-tools
> +    oe_runmake
> +}
> +
> +do_install_append_class-target() {
> +    for b in ${D}${bindir}/${LLVM_DIR}/${HOST_SYS}-clang*; do
> +        if [ ! -L ${b} ]; then
> +            mv ${b} ${D}${bindir}/`echo "${b}" | sed -e 's|${D}${bindir}=
/${LLVM_DIR}/${HOST_SYS}-||g'`
> +        fi
> +    done
> +}
> +
> +do_install_class-native() {
> +    cd ${LLVM_BUILD_DIR}
> +    oe_runmake DESTDIR=3D${LLVM_INSTALL_DIR} install
> +
> +    mv ${LLVM_INSTALL_DIR}${bindir}/${HOST_SYS}-llvm-config=20
> + ${LLVM_INSTALL_DIR}/llvm-config${PV}-ti
> +
> +    install -d ${D}${bindir}
> +    for b in ${LLVM_INSTALL_DIR}${bindir}/${HOST_SYS}-clang*; do
> +        if [ ! -L ${b} ]; then
> +            mv ${b} ${D}${bindir}/`echo "${b}" | sed -e 's|${LLVM_INSTAL=
L_DIR}${bindir}/${HOST_SYS}-||g'`
> +        fi
> +    done
> +
> +    install -d ${D}${bindir}/${LLVM_DIR}
> +    mv ${LLVM_INSTALL_DIR}${bindir}/* ${D}${bindir}/${LLVM_DIR}/
> +
> +    install -d ${D}${includedir}/${LLVM_DIR}
> +    mv ${LLVM_INSTALL_DIR}${includedir}/*=20
> + ${D}${includedir}/${LLVM_DIR}/
> +
> +    install -d ${D}${libdir}/${LLVM_DIR}
> +    mv ${LLVM_INSTALL_DIR}${libdir}/* ${D}${libdir}/${LLVM_DIR}/
> +    ln -s ${LLVM_DIR}/libLLVM-${PV}.so ${D}${libdir}/libLLVM-${PV}.so
> +
> +    install -d ${D}${docdir}/${LLVM_DIR}
> +    mv ${LLVM_INSTALL_DIR}${prefix}/docs/llvm/*=20
> + ${D}${docdir}/${LLVM_DIR}
> +
> +    install -d ${D}${bindir}
> +    install -m 0755 ${LLVM_INSTALL_DIR}/llvm-config${PV}-ti=20
> +${D}${bindir} }
> +
> +SYSROOT_PREPROCESS_FUNCS_class-target +=3D "llvm_sysroot_preprocess_targ=
et"
> +SYSROOT_PREPROCESS_FUNCS_class-nativesdk +=3D "llvm_sysroot_preprocess_t=
arget"
> +
> +llvm_sysroot_preprocess() {
> +    :
> +}
> +
> +llvm_sysroot_preprocess_target() {
> +    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
> +    mv ${LLVM_INSTALL_DIR}/llvm-config-host=20
> +${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}-ti
> +}
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

