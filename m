Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 392C9C63709
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 22:47:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.849.1667602019492337622
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 15:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A775F40D96
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WXCyMd_s-qBX for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 22:46:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9DF7440D9D
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:56 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 415F4163687
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 18:46:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 14/50] recipies-ti: Add TI K3 Security Development Package
Date: Fri,  4 Nov 2022 22:46:16 +0000
Message-Id: <20221104224653.1223044-15-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104224653.1223044-1-denis@denix.org>
References: <20221104224653.1223044-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 22:47:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15294

From: Andrew Davis <afd@ti.com>

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-ti/includes/ti-paths.inc          |  2 ++
 .../recipes-ti/secdev/ti-k3-secdev_git.bb     | 36 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta-ti-extras/recipes-ti/secdev/ti-k3-secdev_git.bb

diff --git a/meta-ti-extras/recipes-ti/includes/ti-paths.inc b/meta-ti-ex=
tras/recipes-ti/includes/ti-paths.inc
index 358d7dfd..5994ff0a 100644
--- a/meta-ti-extras/recipes-ti/includes/ti-paths.inc
+++ b/meta-ti-extras/recipes-ti/includes/ti-paths.inc
@@ -51,6 +51,7 @@ export OMP_INSTALL_DIR_RECIPE        =3D "${installdir}=
/ti-omp-tree"
 export MPM_INSTALL_DIR_RECIPE        =3D "${installdir}/ti-mpm-tree"
 export TI_CGT6X_7_INSTALL_DIR_RECIPE   =3D "${installdir}/cgt6x-7"
 export TI_CGT7X_INSTALL_DIR_RECIPE        =3D "${installdir}/cgt-c7x"
+export TI_K3_SECDEV_INSTALL_DIR_RECIPE =3D "${installdir}/ti-k3-secdev"
=20
=20
 # This is where the tools will end up in sysroot
@@ -100,6 +101,7 @@ export TI_CGT6X_7_INSTALL_DIR   =3D "${STAGING_DIR_NA=
TIVE}${TI_CGT6X_7_INSTALL_DIR
 export GCC_LINARO_BAREMETAL_TOOLCHAIN         =3D  "${STAGING_DIR_NATIVE=
}${GCC_LINARO_BAREMETAL_TOOLCHAIN_RECIPE}"
 export GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN =3D  "${STAGING_DIR_NATIVE=
}${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN_RECIPE}"
 export TI_CGT7X_INSTALL_DIR        =3D "${STAGING_DIR_NATIVE}${TI_CGT7X_=
INSTALL_DIR_RECIPE}"
+export TI_K3_SECDEV_INSTALL_DIR =3D "${STAGING_DIR_NATIVE}${TI_K3_SECDEV=
_INSTALL_DIR_RECIPE}"
=20
=20
 DSPSUFFIX:omapl137 =3D "x674"
diff --git a/meta-ti-extras/recipes-ti/secdev/ti-k3-secdev_git.bb b/meta-=
ti-extras/recipes-ti/secdev/ti-k3-secdev_git.bb
new file mode 100644
index 00000000..7a5dd573
--- /dev/null
+++ b/meta-ti-extras/recipes-ti/secdev/ti-k3-secdev_git.bb
@@ -0,0 +1,36 @@
+DESCRIPTION =3D "Security development tools for High-Security(HS) TI K3 =
processors."
+HOMEPAGE =3D "https://git.ti.com/cgit/security-development-tools/core-se=
cdev-k3"
+SECTION =3D "devel"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://manifest/k3-secdev-0.2-manifest.html;md5=3D=
f632a78870cc64550078d7b3cbac0892"
+
+# Native host tool only
+COMPATIBLE_MACHINE =3D "null"
+COMPATIBLE_MACHINE:class-native =3D "(.*)"
+COMPATIBLE_MACHINE:class-nativesdk =3D "(.*)"
+
+GIT_URI =3D "git://git.ti.com/git/security-development-tools/core-secdev=
-k3.git"
+GIT_PROTOCOL =3D "https"
+GIT_BRANCH =3D "master"
+GIT_SRCREV =3D "eb2c4d734487e5095b94cef3fd7213ee71d9e016"
+
+SRC_URI =3D "${GIT_URI};protocol=3D${GIT_PROTOCOL};branch=3D${GIT_BRANCH=
}"
+SRCREV =3D "${GIT_SRCREV}"
+
+S =3D "${WORKDIR}/git"
+
+do_install() {
+    CP_ARGS=3D"-Prf --preserve=3Dmode,links,timestamps --no-preserve=3Do=
wnership"
+    install -d ${D}${TI_K3_SECDEV_INSTALL_DIR_RECIPE}
+    cp ${CP_ARGS} ${S}/* ${D}${TI_K3_SECDEV_INSTALL_DIR_RECIPE}
+}
+
+FILES:${PN} +=3D "${TI_K3_SECDEV_INSTALL_DIR_RECIPE}"
+
+INSANE_SKIP:${PN} =3D "arch ldflags file-rdeps"
+
+INHIBIT_PACKAGE_STRIP =3D "1"
+INHIBIT_SYSROOT_STRIP =3D "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


