Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE86C2BD05
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 00:56:44 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.62716.1718931399790527812
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Jun 2024 17:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2BF3340CB7;
	Fri, 21 Jun 2024 00:56:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6thp4TfP9rzM; Fri, 21 Jun 2024 00:56:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D650640BA8;
	Fri, 21 Jun 2024 00:56:37 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id 93AEE163FC1;
	Thu, 20 Jun 2024 20:56:37 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH] linux: cleanup and unify mainline and next kernel recipes
Date: Thu, 20 Jun 2024 20:56:36 -0400
Message-Id: <20240621005636.6279-1-denis@denix.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 21 Jun 2024 00:56:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17788

From: Denys Dmytriyenko <denys@konsulko.com>

Share the most commonality between the recipes, except:

* SRC_URI torvalds vs. linux-next
* SRCREV and PV
* Device Tree list vs. DT prefix
* SUMMARY

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../linux/linux-ti-mainline_git.bb            | 19 +++----------------
 .../recipes-kernel/linux/linux-ti-next_git.bb | 19 ++-----------------
 2 files changed, 5 insertions(+), 33 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index 47b573e1..77ebb11e 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -9,30 +9,17 @@ require recipes-kernel/linux/ti-kernel.inc
=20
 DEPENDS +=3D "gmp-native libmpc-native"
=20
-KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} \
-		      ${EXTRA_DTC_ARGS}"
+KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}=
"
=20
 S =3D "${WORKDIR}/git"
=20
 # 6.6 Mainline version
 SRCREV =3D "ffc253263a1375a65fa6c9f62a893e9767fbebfa"
-PV =3D "6.6+git"
+PV =3D "6.6"
=20
-KERNEL_GIT_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git"
-KERNEL_GIT_PROTOCOL =3D "https"
-KERNEL_GIT_BRANCH =3D "master"
-SRC_URI +=3D " \
-	${KERNEL_GIT_URI};protocol=3D${KERNEL_GIT_PROTOCOL};branch=3D${KERNEL_G=
IT_BRANCH} \
-"
+SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git;protocol=3Dhttps;branch=3Dmaster"
=20
 DEFCONFIG_NAME =3D "multi_v7_defconfig"
 DEFCONFIG_NAME:omapl138 =3D "davinci_all_defconfig"
 DEFCONFIG_NAME:k3 =3D "defconfig"
 KERNEL_CONFIG_COMMAND =3D "oe_runmake -C ${S} O=3D${B} ${DEFCONFIG_NAME}=
"
-
-do_shared_workdir:prepend() {
-	cd ${B}
-	echo >> Module.symvers
-}
-
-FILES:${KERNEL_PACKAGE_NAME}-devicetree +=3D "/${KERNEL_IMAGEDEST}/*.itb=
"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb b/meta=
-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
index f1a14ab1..3c206754 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
@@ -1,26 +1,11 @@
-SECTION =3D "kernel"
-SUMMARY =3D "Linux-next kernel for TI devices"
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
+require linux-ti-mainline_git.bb
=20
-inherit kernel
+SUMMARY =3D "Linux-next kernel for TI devices"
=20
-require recipes-kernel/linux/ti-kernel.inc
 include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.=
getVar('KERNEL_DEVICETREE_PREFIX') else ''}
=20
-DEPENDS +=3D "gmp-native libmpc-native"
-
-KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}=
"
-
-S =3D "${WORKDIR}/git"
-
 # 6.6.0-rc3+ version
 SRCREV =3D "6465e260f48790807eef06b583b38ca9789b6072"
 PV =3D "6.6.0-rc3+git"
=20
 SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git;protocol=3Dhttps;branch=3Dmaster"
-
-DEFCONFIG_NAME =3D "multi_v7_defconfig"
-DEFCONFIG_NAME:omapl138 =3D "davinci_all_defconfig"
-DEFCONFIG_NAME:k3 =3D "defconfig"
-KERNEL_CONFIG_COMMAND =3D "oe_runmake -C ${S} O=3D${B} ${DEFCONFIG_NAME}=
"
--=20
2.35.3


