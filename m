Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDB2C4332F
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 17:59:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.601.1652119191388427671
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 May 2022 10:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4BACC40C83
	for <meta-ti@lists.yoctoproject.org>; Mon,  9 May 2022 17:59:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5GD9QCqgivJy for <meta-ti@lists.yoctoproject.org>;
	Mon,  9 May 2022 17:59:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3B108407DA
	for <meta-ti@lists.yoctoproject.org>; Mon,  9 May 2022 17:59:50 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id EB5A0174924
	for <meta-ti@lists.yoctoproject.org>; Mon,  9 May 2022 13:59:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 03/10] recipes-bsp: tifs-lpm-stub: Introduce new
 recipe
Date: Mon,  9 May 2022 17:59:40 +0000
Message-Id: <20220509175947.1994132-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509175947.1994132-1-denis@denix.org>
References: <20220509175947.1994132-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 May 2022 17:59:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14717

From: Ryan Eatmon <reatmon@ti.com>

This firmware stub is required by the TI foundational security
software while transitioning to low power mode.

Add a recipe for this compatible with am62xx-evm

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
 .../tifs-lpm-stub/tifs-lpm-stub_git.bb        | 23 +++++++++++++++++++
 .../recipes-kernel/linux/kernel-rdepends.inc  |  4 ++++
 3 files changed, 28 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_g=
it.bb

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-t=
i-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 3ebdae30..47e76347 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -18,6 +18,7 @@ GOODIX_FW_VERSION =3D "1.0.0.0"
 CADENCE_MHDP_FW_VERSION =3D "1.2.17"
 IMG_DEC_FW_VERSION =3D "1.0"
 CNM_WAVE521_FW_VERSION =3D "1.0.00"
+TIFS_LPM_STUB_FW_VERSION =3D "08.03.02"
=20
 TI_LINUX_FW_SRCREV ?=3D "917625c2721eef8677df9e47d919005b0d4f93aa"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
diff --git a/meta-ti-bsp/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb b=
/meta-ti-bsp/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
new file mode 100644
index 00000000..90af55f1
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
@@ -0,0 +1,23 @@
+SUMMARY =3D "TI Foundational security Low Power Management Stub"
+
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+
+PV =3D "${TIFS_LPM_STUB_FW_VERSION}"
+PR =3D "${INC_PR}.0"
+
+CLEANBROKEN =3D "1"
+
+COMPATIBLE_MACHINE =3D "am62xx-evm"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+S =3D "${WORKDIR}/git"
+
+TARGET =3D "ti-fs-stub-firmware-am62x-gp-signed.bin"
+
+do_install() {
+	install -d ${D}${nonarch_base_libdir}/firmware/ti-sysfw/
+	install -m 0644 ${S}/ti-sysfw/${TARGET} ${D}${nonarch_base_libdir}/firm=
ware/ti-sysfw/${TARGET}
+}
+
+FILES:${PN} =3D "${nonarch_base_libdir}/firmware"
diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-=
ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
index 8ceae8a1..bb2c1a00 100644
--- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
@@ -28,3 +28,7 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j7 =3D " vx=
d-dec-fw"
=20
 # Add run-time dependency for Chips&Media Wave521 firmware to the rootfs
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2-evm =3D " cnm-wave-fw=
"
+
+# Add run-time dependency for TIFS Low Power Module stub
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am62xx-evm =3D " tifs-lpm-st=
ub"
+
--=20
2.25.1


