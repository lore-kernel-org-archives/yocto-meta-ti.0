Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.8803.1645503272779828206
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 774E740C52
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id StxZ5gaFmCgr for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6E3C840A28
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:31 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 2A785174773
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:31 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 08/29] recipes-bsp: Add cnm-wave-fw firmware recipe
Date: Tue, 22 Feb 2022 04:14:09 +0000
Message-Id: <20220222041430.2840289-9-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041430.2840289-1-denis@denix.org>
References: <20220222041430.2840289-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Nishanth Menon <nm@ti.com>

Add firmware recipe to add the Wave521cl firmware pieces in for j7
platform.

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../cnm-wave-fw/cnm-wave-fw_git.bb            | 41 +++++++++++++++++++
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
 .../recipes-kernel/linux/kernel-rdepends.inc  |  3 ++
 3 files changed, 45 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.b=
b

diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/met=
a-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
new file mode 100644
index 00000000..af77b394
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -0,0 +1,41 @@
+SUMMARY =3D "Chips&Media codec firmware files"
+
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+
+inherit deploy
+inherit update-alternatives
+
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENCE.cnm;md5=3D93b67e6bac7f8fec22b96b8ad=
0a1a9d0"
+
+PV =3D "${CNM_WAVE521_FW_VERSION}"
+PR =3D "${INC_PR}.0"
+
+CLEANBROKEN =3D "1"
+
+COMPATIBLE_MACHINE =3D "j7"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+S =3D "${WORKDIR}/git"
+TARGET_WAVE215C =3D "wave521c_codec_fw.bin"
+
+ALTERNATIVE_LINK_NAME[wave521c_codec_fw.bin] =3D "${nonarch_base_libdir}=
/firmware/${TARGET_WAVE215C}"
+ALTERNATIVE_TARGET[wave521c_codec_fw.bin] =3D "${nonarch_base_libdir}/fi=
rmware/cnm/${TARGET_WAVE215C}"
+ALTERNATIVE_PRIORITY =3D "10"
+
+# Set up names for the firmwares
+ALTERNATIVE_${PN}:j7 =3D "\
+                    wave521c_codec_fw.bin"
+
+do_install() {
+	install -d ${D}${nonarch_base_libdir}/firmware/cnm
+	install -m 0644 ${S}/cnm/${TARGET_WAVE215C} ${D}${nonarch_base_libdir}/=
firmware/cnm/${TARGET_WAVE215C}
+}
+
+# make sure that lib/firmware, and all its contents are part of the pack=
age
+FILES:${PN} =3D "${nonarch_base_libdir}/firmware"
+
+# we don't want to configure and build the source code
+do_compile[noexec] =3D "1"
+do_configure[noexec] =3D "1"
diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-t=
i-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index f1607686..9bd2d0a8 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -17,6 +17,7 @@ PRUETH_FW_AM65X_SR2_VERSION =3D "02.02.09.07"
 GOODIX_FW_VERSION =3D "1.0.0.0"
 CADENCE_MHDP_FW_VERSION =3D "1.2.17"
 IMG_DEC_FW_VERSION =3D "1.0"
+CNM_WAVE521_FW_VERSION =3D "1.0.00"
=20
 TI_LINUX_FW_SRCREV ?=3D "c96a734a059889e571dcf30c0638157c690a6e6e"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-=
ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
index 0425c789..1d98edcf 100644
--- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
@@ -25,3 +25,6 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j7 =3D " ca=
dence-mhdp-fw"
=20
 # Add run-time dependency for Video Decoding firmware to the rootfs
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j7 =3D " vxd-dec-fw"
+
+# Add run-time dependency for Chips&Media Wave521 firmware to the rootfs
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j7 =3D " cnm-wave-fw"
--=20
2.25.1

