Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5E2C4167D
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 22:46:58 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.932.1667602017074933160
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 15:46:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7E1C840D86
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hlUp_d_OdNeC for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 22:46:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6AEB340D7C
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:56 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id DC9A716367B
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 18:46:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 02/50] ti-sci-fw: Use new SOC_TYPE and SYSFW_DIR to simplify recipe
Date: Fri,  4 Nov 2022 22:46:04 +0000
Message-Id: <20221104224653.1223044-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104224653.1223044-1-denis@denix.org>
References: <20221104224653.1223044-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 22:46:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15276

From: Andrew Davis <afd@ti.com>

The k3-image-gen now has two new helper flags SOC_TYPE and SYSFW_DIR
that we can use to simplify this recipe. With these we do not need to do
anything different here for HS builds, the SOC_TYPE selects this now.

DL_URL also do not need cleared anymore, the k3-image-gen will no longer
download missing files when not needed for the current build type.

do_install and do_deploy can also check for the existence of either
sysfw.itb or tiboot3.bin and install/deploy as needed. k3-image-gen only
gerneates the right one now depending on the SoC. Merge all these
steps for all SoCs.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |   2 +-
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    | 147 ++++--------------
 2 files changed, 28 insertions(+), 121 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-t=
i-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 6f451439..be714b36 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -25,7 +25,7 @@ SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
=20
-K3_IMAGE_GEN_SRCREV ?=3D "85a70059fc24242ea03653a5014b98100e4da2d6"
+K3_IMAGE_GEN_SRCREV ?=3D "91a75b17c616a5cc41b3345905dccba5c29aca66"
 SRCREV_imggen =3D "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT =3D "imggen"
=20
diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 6a381447..64c71292 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -54,13 +54,9 @@ LD[unexport] =3D "1"
 do_configure[noexec] =3D "1"
=20
 EXTRA_OEMAKE =3D "\
-    CROSS_COMPILE=3D${TARGET_PREFIX} SYSFW_DL_URL=3D'' SYSFW_HS_DL_URL=3D=
'' SYSFW_HS_INNER_CERT_DL_URL=3D'' \
-    SYSFW_PATH=3D"${SYSFW_TISCI}" SOC=3D${SYSFW_SOC} CONFIG=3D${SYSFW_CO=
NFIG} \
+    CROSS_COMPILE=3D${TARGET_PREFIX} SOC=3D${SYSFW_SOC} SOC_TYPE=3D${SYS=
FW_SUFFIX} \
+    CONFIG=3D${SYSFW_CONFIG} SYSFW_DIR=3D"${S}/ti-sysfw" \
 "
-EXTRA_OEMAKE_HS =3D " \
-    HS=3D1 SW_REV=3D1 SYSFW_HS_PATH=3D"${S}/ti-sysfw/${SYSFW_BASE}-enc.b=
in" SYSFW_HS_INNER_CERT_PATH=3D"${S}/ti-sysfw/${SYSFW_BASE}-cert.bin" \
-"
-EXTRA_OEMAKE:append =3D "${@['',' ${EXTRA_OEMAKE_HS}']['${SYSFW_SUFFIX}'=
 =3D=3D 'hs']}"
=20
 EXTRA_OEMAKE:append:j7200-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/boot=
/u-boot-spl.bin""
 EXTRA_OEMAKE:append:j7200-hs-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/b=
oot/u-boot-spl.bin""
@@ -77,10 +73,19 @@ do_compile() {
=20
 do_install() {
 	install -d ${D}/boot
-	install -m 644 ${WORKDIR}/imggen/${SYSFW_BINARY} ${D}/boot/${SYSFW_VBIN=
ARY}
-	ln -sf ${SYSFW_VBINARY} ${D}/boot/${SYSFW_IMAGE}
-	if [ ! -z "${SYSFW_SYMLINK}" ]; then
-		ln -sf ${SYSFW_VBINARY} ${D}/boot/${SYSFW_SYMLINK}
+
+	if [ -f "${WORKDIR}/imggen/${SYSFW_BINARY}" ]; then
+		install -m 644 ${WORKDIR}/imggen/${SYSFW_BINARY} ${D}/boot/${SYSFW_VBI=
NARY}
+		ln -sf ${SYSFW_VBINARY} ${D}/boot/${SYSFW_IMAGE}
+		if [ ! -z "${SYSFW_SYMLINK}" ]; then
+			ln -sf ${SYSFW_VBINARY} ${D}/boot/${SYSFW_SYMLINK}
+		fi
+	fi
+
+	if [ -f "${WORKDIR}/imggen/${UBOOT_BINARY}" ]; then
+		install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMA=
GE}
+		ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
+		ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
 	fi
 }
=20
@@ -90,119 +95,21 @@ inherit deploy
=20
 do_deploy () {
 	install -d ${DEPLOYDIR}
-	install -m 644 ${WORKDIR}/imggen/${SYSFW_BINARY} ${DEPLOYDIR}/${SYSFW_V=
BINARY}
-	rm -f ${DEPLOYDIR}/${SYSFW_IMAGE}
-	ln -sf ${SYSFW_VBINARY} ${DEPLOYDIR}/${SYSFW_IMAGE}
-	if [ ! -z "${SYSFW_SYMLINK}" ]; then
-		rm -f ${DEPLOYDIR}/${SYSFW_SYMLINK}
-		ln -sf ${SYSFW_VBINARY} ${DEPLOYDIR}/${SYSFW_SYMLINK}
-	fi
-
-	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
-}
-
-do_install:j7200-evm-k3r5() {
-	install -d ${D}/boot
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAG=
E}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
-}
-
-do_deploy:j7200-evm-k3r5() {
-	install -d ${DEPLOYDIR}
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_I=
MAGE}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
-	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
-}
-
-do_install:j7200-hs-evm-k3r5() {
-	install -d ${D}/boot
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAG=
E}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
-}
-
-do_deploy:j7200-hs-evm-k3r5() {
-	install -d ${DEPLOYDIR}
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_I=
MAGE}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
-	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
-}
-
-do_install:j721s2-evm-k3r5() {
-	install -d ${D}/boot
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAG=
E}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
-}
-
-do_deploy:j721s2-evm-k3r5() {
-	install -d ${DEPLOYDIR}
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_I=
MAGE}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
-	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
-}
-
-do_install:j721s2-hs-evm-k3r5() {
-	install -d ${D}/boot
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAG=
E}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
-}
-
-do_deploy:j721s2-hs-evm-k3r5() {
-	install -d ${DEPLOYDIR}
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_I=
MAGE}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
-	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
-}
=20
-do_install:am64xx-evm-k3r5() {
-	install -d ${D}/boot
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAG=
E}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
-}
-
-do_deploy:am64xx-evm-k3r5() {
-	install -d ${DEPLOYDIR}
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_I=
MAGE}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
-	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
-}
-
-do_install:am64xx-hs-evm-k3r5() {
-	install -d ${D}/boot
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAG=
E}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
-}
-
-do_deploy:am64xx-hs-evm-k3r5() {
-	install -d ${DEPLOYDIR}
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_I=
MAGE}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
-	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
-}
+	if [ -f "${WORKDIR}/imggen/${SYSFW_BINARY}" ]; then
+		install -m 644 ${WORKDIR}/imggen/${SYSFW_BINARY} ${DEPLOYDIR}/${SYSFW_=
VBINARY}
+		ln -sf ${SYSFW_VBINARY} ${DEPLOYDIR}/${SYSFW_IMAGE}
+		if [ ! -z "${SYSFW_SYMLINK}" ]; then
+			ln -sf ${SYSFW_VBINARY} ${DEPLOYDIR}/${SYSFW_SYMLINK}
+		fi
+	fi
=20
-do_install:am62xx-evm-k3r5() {
-	install -d ${D}/boot
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAG=
E}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
-}
+	if [ -f "${WORKDIR}/imggen/${UBOOT_BINARY}" ]; then
+		install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_=
IMAGE}
+		ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
+		ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
+	fi
=20
-do_deploy:am62xx-evm-k3r5() {
-	install -d ${DEPLOYDIR}
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_I=
MAGE}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
 	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
=20
--=20
2.25.1


