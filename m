Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0C1C282EC
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 01:47:35 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2521.1742003250188348839
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Mar 2025 18:47:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A165F40023;
	Sat, 15 Mar 2025 01:47:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bnvFm1DUb7WY; Sat, 15 Mar 2025 01:47:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7BA7040021;
	Sat, 15 Mar 2025 01:47:27 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 479AE164371;
	Fri, 14 Mar 2025 21:47:27 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Paresh Bhagat <p-bhagat@ti.com>
Subject: [master/scarthgap][PATCH] jailhouse: revert changes for am62lxx
Date: Fri, 14 Mar 2025 21:47:26 -0400
Message-Id: <20250315014726.2806459-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 15 Mar 2025 01:47:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18387

From: Denys Dmytriyenko <denys@konsulko.com>

This reverts commit 31b423275aa2bc685a1348218bda16894a35ad8b.

This uses an unpublished/uncommitten change - more details:
https://lists.yoctoproject.org/g/meta-ti/topic/111318869

Cc: Paresh Bhagat <p-bhagat@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/am62lxx-evm.conf            |  1 -
 meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc         | 10 +++++-----
 meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc    | 10 +++++-----
 meta-ti-bsp/recipes-kernel/linux/ti-extras.inc       | 10 +++++-----
 meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb |  4 ----
 meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc |  5 ++---
 6 files changed, 17 insertions(+), 23 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf=
/machine/am62lxx-evm.conf
index 8d1e1fe2..fc348c9b 100644
--- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Machine configuration for the TI AM62L EVM
=20
 require conf/machine/include/am62lxx.inc
-require conf/machine/include/ti-extras.inc
=20
 IMAGE_FSTYPES +=3D "ubifs ubi"
=20
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc b/meta-ti-bsp/r=
ecipes-bsp/u-boot/ti-extras.inc
index e334ada0..0252e2c3 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
@@ -1,12 +1,12 @@
=20
 # This will have priority over generic uboot path
=20
-COMPATIBLE_MACHINE =3D "am62xx|am62pxx|am62lxx"
+COMPATIBLE_MACHINE =3D "am62xx|am62pxx"
=20
-BRANCH =3D "ti-u-boot-2025.01"
-BRANCH:tie-jailhouse =3D "ti-u-boot-2025.01-jailhouse"
+BRANCH =3D "ti-u-boot-2024.04"
+BRANCH:tie-jailhouse =3D "ti-u-boot-2024.04-jailhouse"
=20
-SRCREV =3D "e718bbcec3ebf663c021839753034a224be4cc53"
-SRCREV:tie-jailhouse =3D "e718bbcec3ebf663c021839753034a224be4cc53"
+SRCREV =3D "b3c10f333acccef49ebaf4abc575616ea7326d50"
+SRCREV:tie-jailhouse =3D "b3c10f333acccef49ebaf4abc575616ea7326d50"
=20
 UBOOT_GIT_URI =3D "git://git.ti.com/git/processor-sdk/u-boot.git"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc b/meta-ti-=
bsp/recipes-kernel/linux/ti-extras-rt.inc
index dba9ef38..df10d594 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
@@ -2,10 +2,10 @@
 # Use different commit, repo and branch for TI extras build
 # This will have priority over generic rt path
=20
-COMPATIBLE_MACHINE =3D "am62xx|am62pxx|am62lxx"
+COMPATIBLE_MACHINE =3D "am62xx|am62pxx"
=20
-BRANCH =3D "ti-linux-6.12.y"
-BRANCH:tie-jailhouse =3D "ti-linux-6.12.y-jailhouse"
+BRANCH =3D "ti-rt-linux-6.6.y"
+BRANCH:tie-jailhouse =3D "ti-rt-linux-6.6.y-jailhouse"
=20
-SRCREV =3D "c9e21a1ebd757f2b4487035382bbf65299cf8170"
-SRCREV:tie-jailhouse =3D "229a48602ad1557612a4ffabec6a3cbcdd745f87"
+SRCREV =3D "fb89cd4d622ce6cc1b7b254ae21298570d437a08"
+SRCREV:tie-jailhouse =3D "ea592a872ebdb974f26f6f839596e0a79e9d408b"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc b/meta-ti-bsp=
/recipes-kernel/linux/ti-extras.inc
index 4b7a9f20..880d5d87 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
@@ -2,13 +2,13 @@
 # Use different commit, repo and branch for TI extras build
 # This will have priority over generic rt path
=20
-COMPATIBLE_MACHINE =3D "am62xx|am62pxx|am62lxx"
+COMPATIBLE_MACHINE =3D "am62xx|am62pxx"
=20
-BRANCH =3D "ti-linux-6.12.y"
-BRANCH:tie-jailhouse =3D "ti-linux-6.12.y-jailhouse"
+BRANCH =3D "ti-linux-6.6.y"
+BRANCH:tie-jailhouse =3D "ti-linux-6.6.y-jailhouse"
=20
-SRCREV =3D "c9e21a1ebd757f2b4487035382bbf65299cf8170"
-SRCREV:tie-jailhouse =3D "229a48602ad1557612a4ffabec6a3cbcdd745f87"
+SRCREV =3D "e298dab666632b6f62ed61eac35813331341c3aa"
+SRCREV:tie-jailhouse =3D "b45ba5ae4b724d4a09c0c7125ffb49e9d58c04f7"
=20
 KERNEL_GIT_URI =3D "git://git.ti.com/git/processor-sdk/linux.git"
=20
diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb b/meta-=
ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
index 0113a916..38281615 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
+++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
@@ -10,13 +10,11 @@ JH_CELL_FILES ?=3D "*.cell"
 JH_CELL_FILES:k3 ?=3D "k3-*.cell"
 JH_CELL_FILES:am62xx ?=3D "k3-am625-*.cell"
 JH_CELL_FILES:am62pxx ?=3D "k3-am62p5-*.cell"
-JH_CELL_FILES:am62lxx ?=3D "k3-am62l*.cell"
=20
 JH_INMATE_DTB ?=3D ""
 JH_INMATE_DTB:am62xx ?=3D "inmate-k3-am625-sk.dtb"
 JH_INMATE_DTB:am65xx ?=3D "inmate-k3-am654-idk.dtb"
 JH_INMATE_DTB:am62pxx ?=3D "inmate-k3-am62p5-sk.dtb"
-JH_INMATE_DTB:am62lxx ?=3D "inmate-k3-am62l3-evm.dtb"
 JH_INMATE_DTB:j7 ?=3D "inmate-k3-j721e-evm.dtb"
 JH_INMATE_DTB:j7200-evm ?=3D "inmate-k3-j7200-evm.dtb"
=20
@@ -24,7 +22,6 @@ JH_LINUX_DEMO_CELL ?=3D ""
 JH_LINUX_DEMO_CELL:am62xx ?=3D "k3-am625-sk-linux-demo.cell"
 JH_LINUX_DEMO_CELL:am65xx ?=3D "k3-am654-idk-linux-demo.cell"
 JH_LINUX_DEMO_CELL:am62pxx ?=3D "k3-am62p5-sk-linux-demo.cell"
-JH_LINUX_DEMO_CELL:am62lxx ?=3D "k3-am62l3-evm-linux-demo.cell"
 JH_LINUX_DEMO_CELL:j7 ?=3D "k3-j721e-evm-linux-demo.cell"
 JH_LINUX_DEMO_CELL:j7200-evm ?=3D "k3-j7200-evm-linux-demo.cell"
=20
@@ -34,7 +31,6 @@ JH_RAMFS_IMAGE ?=3D "${INITRAMFS_IMAGE}"
 JH_CMDLINE ?=3D ""
 JH_CMDLINE:am62xx ?=3D "console=3DttyS3,115200n8 earlycon=3Dns16550a,mmi=
o32,0x02810000"
 JH_CMDLINE:am62pxx ?=3D "console=3DttyS1,115200n8"
-JH_CMDLINE:am62lxx ?=3D "console=3DttyS3,115200n8"
 JH_CMDLINE:am65xx ?=3D "console=3DttyS1,115200n8"
 JH_CMDLINE:j7 ?=3D "console=3DttyS3,115200n8"
 JH_CMDLINE:j7200-evm ?=3D "console=3DttyS3,115200n8"
diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc b/meta-=
ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
index 62a97df6..2831e560 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
+++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
@@ -11,10 +11,10 @@ LIC_FILES_CHKSUM =3D " \
     file://COPYING;md5=3D9fa7f895f96bde2d47fd5b7d95b6ba4d \
 "
=20
-COMPATIBLE_MACHINE =3D "am62xx|am62pxx|am62lxx"
+COMPATIBLE_MACHINE =3D "am62xx|am62pxx"
 TARGET_CC_ARCH +=3D "${LDFLAGS}"
 PV =3D "0.12+git"
-SRCREV =3D "dc77c05460bc3df8f2ddc9cc3a9990ca31cb9f9d"
+SRCREV =3D "9b494ddf4bd8845a2c1063352d08a274ef61777b"
 BRANCH =3D "master"
 SRC_URI =3D " \
     git://git.ti.com/git/jailhouse/ti-jailhouse.git;protocol=3Dhttps;bra=
nch=3D${BRANCH} \
@@ -63,7 +63,6 @@ JH_SYSCONFIG_CELL ?=3D ""
 JH_SYSCONFIG_CELL:am62xx ?=3D "k3-am625-sk.cell"
 JH_SYSCONFIG_CELL:am65xx ?=3D "k3-am654-idk.cell"
 JH_SYSCONFIG_CELL:am62pxx ?=3D "k3-am62p5-sk.cell"
-JH_SYSCONFIG_CELL:am62lxx ?=3D "k3-am62l3-evm.cell"
 JH_SYSCONFIG_CELL:j7 ?=3D "k3-j721e-evm.cell"
 JH_SYSCONFIG_CELL:j7200-evm ?=3D "k3-j7200-evm.cell"
=20
--=20
2.25.1


