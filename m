Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8DA3C3526F
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 20:44:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.1641.1650398256836454583
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 12:57:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 796F240C22;
	Tue, 19 Apr 2022 19:57:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZFQsmeyy5Ece; Tue, 19 Apr 2022 19:57:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6534840BC4;
	Tue, 19 Apr 2022 19:57:34 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 206A31748D3;
	Tue, 19 Apr 2022 15:57:34 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell][PATCH] linux-ti-staging/mainline: depend on libmpc-native
 and gmp-native
Date: Tue, 19 Apr 2022 15:57:33 -0400
Message-Id: <1650398253-47514-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 19 Apr 2022 20:44:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14605

From: Denys Dmytriyenko <denys@konsulko.com>

Similar to OE-Core changes:
https://git.openembedded.org/openembedded-core/commit/?id=128abf5eb76dd0d2680c93f043bf7cac0a3552b8

5.10.85 changed how the GCC plugins are built, which means they now
depend on both GMP and MPC to be built.

Also add MPC dependency to linux-ti-mainline, as it already depends
on GMP since:
https://git.yoctoproject.org/meta-ti/commit/?id=0376ebcd4333ea2915b3113945ff6a818f7cb442

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-kernel/linux/linux-ti-mainline_git.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kernel/linux/linux-ti-mainline_git.bb
index 7491dae..4a5034f 100644
--- a/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -10,7 +10,7 @@ require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/kernel-rdepends.inc
 require recipes-kernel/linux/ti-kernel.inc
 
-DEPENDS += "gmp-native"
+DEPENDS += "gmp-native libmpc-native"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
 		      ${EXTRA_DTC_ARGS}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 9eb5a30..a0ba18e 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -13,6 +13,8 @@ require recipes-kernel/linux/bundle-devicetree.inc
 require recipes-kernel/linux/kernel-rdepends.inc
 require recipes-kernel/linux/ti-kernel.inc
 
+DEPENDS += "gmp-native libmpc-native"
+
 # Look in the generic major.minor directory for files
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
-- 
2.7.4


