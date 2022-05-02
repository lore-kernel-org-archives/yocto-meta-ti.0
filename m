Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59998C4332F
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:51:40 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.11504.1651503090853631863
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 May 2022 07:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4C84040C3A
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 14:51:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XXrMy2cUL9VY for <meta-ti@lists.yoctoproject.org>;
	Mon,  2 May 2022 14:51:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 75FDB40CB2
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 14:51:23 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 72BEC174925
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 10:51:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 16/26] linux-ti-staging/mainline: depend on
 libmpc-native and gmp-native
Date: Mon,  2 May 2022 14:51:10 +0000
Message-Id: <20220502145120.726632-17-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502145120.726632-1-denis@denix.org>
References: <20220502145120.726632-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 May 2022 14:51:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14667

From: Denys Dmytriyenko <denys@konsulko.com>

Similar to OE-Core changes:
https://git.openembedded.org/openembedded-core/commit/?id=3D128abf5eb76dd=
0d2680c93f043bf7cac0a3552b8

5.10.85 changed how the GCC plugins are built, which means they now
depend on both GMP and MPC to be built.

Also add MPC dependency to linux-ti-mainline, as it already depends
on GMP since:
https://git.yoctoproject.org/meta-ti/commit/?id=3D0376ebcd4333ea2915b3113=
945ff6a818f7cb442

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index f7719e9b..af823b98 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -10,7 +10,7 @@ require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/kernel-rdepends.inc
 require recipes-kernel/linux/ti-kernel.inc
=20
-DEPENDS +=3D "gmp-native"
+DEPENDS +=3D "gmp-native libmpc-native"
=20
 KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} \
 		      ${EXTRA_DTC_ARGS}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
index cf70ac31..a1a68a9b 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -13,6 +13,8 @@ require recipes-kernel/linux/bundle-devicetree.inc
 require recipes-kernel/linux/kernel-rdepends.inc
 require recipes-kernel/linux/ti-kernel.inc
=20
+DEPENDS +=3D "gmp-native libmpc-native"
+
 # Look in the generic major.minor directory for files
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-5.10:"
=20
--=20
2.25.1


