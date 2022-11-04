Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F8BC43219
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 22:47:08 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.844.1667602018352131661
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 15:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B26E340D87
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ji_XR12xtYVz for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 22:46:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A735C40D82
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:56 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 13772163682
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 18:46:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 09/50] conf: machine: am64xx-hs-evm: Add extra machine to build GP SYSFW
Date: Fri,  4 Nov 2022 22:46:11 +0000
Message-Id: <20221104224653.1223044-10-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104224653.1223044-1-denis@denix.org>
References: <20221104224653.1223044-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 22:47:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15279

From: Andrew Davis <afd@ti.com>

Use multiconfig to generate a GP SYSFW image. This allows the HS SDK
to be used on GP boards by simply switching out the SYSFW image:

$ cd /mnt/sd-card/boot
$ mv tiboot3-am64x-gp-evm.bin tiboot3.bin

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../conf/machine/am64xx-hs-evm-k3r5-gp.conf      | 16 ++++++++++++++++
 meta-ti-bsp/conf/machine/am64xx-hs-evm.conf      |  6 ++++++
 meta-ti-bsp/conf/multiconfig/k3r5-gp.conf        |  3 +++
 3 files changed, 25 insertions(+)
 create mode 100644 meta-ti-bsp/conf/machine/am64xx-hs-evm-k3r5-gp.conf
 create mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-gp.conf

diff --git a/meta-ti-bsp/conf/machine/am64xx-hs-evm-k3r5-gp.conf b/meta-t=
i-bsp/conf/machine/am64xx-hs-evm-k3r5-gp.conf
new file mode 100644
index 00000000..41c7027f
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am64xx-hs-evm-k3r5-gp.conf
@@ -0,0 +1,16 @@
+#@TYPE: Machine
+#@NAME: AM64xx GP EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM64xx GP EVM (R5F core)
+
+# Booting GP requires different SYSFW, the rest is handled at runtime
+
+require conf/machine/am64xx-hs-evm-k3r5.conf
+SOC_FAMILY:append =3D ":k3r5-gp"
+
+SYSFW_SUFFIX =3D "gp"
+SYSFW_TIBOOT3_SYMLINK =3D ""
+
+SPL_BINARY =3D ""
+UBOOT_BINARY =3D "u-boot-spl.${UBOOT_SUFFIX}"
+UBOOT_IMAGE =3D "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFF=
IX}"
+UBOOT_SYMLINK =3D "u-boot-r5spl-gp.${UBOOT_SUFFIX}"
diff --git a/meta-ti-bsp/conf/machine/am64xx-hs-evm.conf b/meta-ti-bsp/co=
nf/machine/am64xx-hs-evm.conf
index 3ab9a49e..9f076099 100644
--- a/meta-ti-bsp/conf/machine/am64xx-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/am64xx-hs-evm.conf
@@ -17,3 +17,9 @@ UBOOT_DTBO_OFFSET =3D      "0x00010000"
 SPL_BINARY =3D "tispl.bin_HS"
 UBOOT_BINARY =3D "u-boot.img_HS"
 UBOOT_SYMLINK =3D "u-boot.img"
+
+# Since default tiboot3.bin on AM64x is for HS, add a version for GP
+BBMULTICONFIG +=3D "k3r5-gp"
+IMAGE_BOOT_FILES +=3D " tiboot3-am64x-gp-evm.bin"
+do_image_wic[mcdepends] +=3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] +=3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/multiconfig/k3r5-gp.conf b/meta-ti-bsp/conf=
/multiconfig/k3r5-gp.conf
new file mode 100644
index 00000000..80491e35
--- /dev/null
+++ b/meta-ti-bsp/conf/multiconfig/k3r5-gp.conf
@@ -0,0 +1,3 @@
+require k3r5.conf
+
+MACHINE:append =3D "-gp"
--=20
2.25.1


