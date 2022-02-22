Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.8968.1645503206489176971
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:13:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C294F40A28
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VWUyhHkQsDob for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:13:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CA4E640CA2
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:15 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B4558174771
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:13:15 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 18/19] gcc-linaro-baremetal: remove 7.2 version of GCC for baremetal Arm and Aarch64
Date: Tue, 22 Feb 2022 04:13:13 +0000
Message-Id: <20220222041314.2840028-19-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041314.2840028-1-denis@denix.org>
References: <20220222041314.2840028-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Newer versions of baremetal GCC toolchain available from meta-arm-toolcha=
in.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../gcc-linaro-baremetal-aarch64-native.bb    | 23 -------------------
 .../devtools/gcc-linaro-baremetal-native.bb   | 23 -------------------
 recipes-ti/devtools/gcc-linaro.inc            | 10 --------
 recipes-ti/includes/ti-paths.inc              |  2 --
 4 files changed, 58 deletions(-)
 delete mode 100644 recipes-ti/devtools/gcc-linaro-baremetal-aarch64-nati=
ve.bb
 delete mode 100644 recipes-ti/devtools/gcc-linaro-baremetal-native.bb
 delete mode 100644 recipes-ti/devtools/gcc-linaro.inc

diff --git a/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb b=
/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
deleted file mode 100644
index 3b40c9bd..00000000
--- a/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-include recipes-ti/devtools/gcc-linaro.inc
-
-PACKAGE_DIR =3D "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_aarch64-elf"
-S =3D "${WORKDIR}/${PACKAGE_DIR}"
-
-LIC_CHKSUM =3D "bc7fad4bba98e7a4cd5ab3042506493c"
-
-inherit native
-require recipes-ti/includes/ti-paths.inc
-
-SRC_URI =3D "https://releases.linaro.org/components/toolchain/binaries/7=
.2-${GCC_ARM_YEAR}/aarch64-elf/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_aa=
rch64-elf.tar.xz;name=3Dgcc-linaro-aarch64"
-
-SRC_URI[gcc-linaro-aarch64.md5sum] =3D "4972f8943820bdd2f577f498de78964b=
"
-SRC_URI[gcc-linaro-aarch64.sha256sum] =3D "30fb7d876bcb982c502057c593d9c=
1f11b35d5158a26d986718e2b998388c4c8"
-
-do_install() {
-    install -d ${D}${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}
-    cp -r ${S}/. ${D}${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}
-}
-
-FILES:${PN} =3D "${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}/*"
-
-INSANE_SKIP:${PN} =3D "already-stripped"
diff --git a/recipes-ti/devtools/gcc-linaro-baremetal-native.bb b/recipes=
-ti/devtools/gcc-linaro-baremetal-native.bb
deleted file mode 100644
index 6d5ec197..00000000
--- a/recipes-ti/devtools/gcc-linaro-baremetal-native.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-include recipes-ti/devtools/gcc-linaro.inc
-
-PACKAGE_DIR =3D "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_arm-eabi"
-S =3D "${WORKDIR}/${PACKAGE_DIR}"
-
-LIC_CHKSUM =3D "bc7fad4bba98e7a4cd5ab3042506493c"
-
-inherit native
-require recipes-ti/includes/ti-paths.inc
-
-SRC_URI =3D "https://releases.linaro.org/components/toolchain/binaries/7=
.2-${GCC_ARM_YEAR}/arm-eabi/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_arm-e=
abi.tar.xz;name=3Dgcc-linaro"
-
-SRC_URI[gcc-linaro.md5sum] =3D "9a4a39cfc78c84375b1160aa93587aed"
-SRC_URI[gcc-linaro.sha256sum] =3D "45fc4f90af2e2e9c3197a275f6005ef5639f7=
a1889fa3eb24c3125ccd70fcd3d"
-
-do_install() {
-    install -d ${D}${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}
-    cp -r ${S}/. ${D}${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}
-}
-
-FILES:${PN} =3D "${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}/*"
-
-INSANE_SKIP:${PN} =3D "already-stripped"
diff --git a/recipes-ti/devtools/gcc-linaro.inc b/recipes-ti/devtools/gcc=
-linaro.inc
deleted file mode 100644
index 19f5a2cf..00000000
--- a/recipes-ti/devtools/gcc-linaro.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION =3D "Linaro GCC for ARM"
-HOMEPAGE =3D "https://launchpad.net/gcc-arm-embedded"
-SECTION =3D "devel"
-LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
-LIC_FILES_CHKSUM =3D "file://share/doc/gcc/GNU-Free-Documentation-Licens=
e.html;md5=3D${LIC_CHKSUM}"
-
-PV =3D "7.2.1"
-PR =3D "r0"
-
-GCC_ARM_YEAR =3D "2017.11"
diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-pa=
ths.inc
index ea985be7..358d7dfd 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -50,8 +50,6 @@ export CG_XML_INSTALL_DIR_RECIPE     =3D "${installdir}=
/ti-cg-xml-tree"
 export OMP_INSTALL_DIR_RECIPE        =3D "${installdir}/ti-omp-tree"
 export MPM_INSTALL_DIR_RECIPE        =3D "${installdir}/ti-mpm-tree"
 export TI_CGT6X_7_INSTALL_DIR_RECIPE   =3D "${installdir}/cgt6x-7"
-export GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE          =3D "${installdir}=
/gcc-linaro-baremetal"
-export GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE  =3D "${installdir}=
/gcc-linaro-baremetal-aarch64"
 export TI_CGT7X_INSTALL_DIR_RECIPE        =3D "${installdir}/cgt-c7x"
=20
=20
--=20
2.25.1

