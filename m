Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.1508.1639602666565248060
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 13:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4EA1840C8C
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 21:11:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Od9vCqoyE-M5 for <meta-ti@lists.yoctoproject.org>;
	Wed, 15 Dec 2021 21:11:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4521940C5F
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 21:11:05 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id CF28B174722
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 16:11:03 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 10/11] linux-ti-mainline: Bump kernel version to v5.15
Date: Wed, 15 Dec 2021 16:11:02 -0500
Message-Id: <1639602663-32787-11-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1639602663-32787-1-git-send-email-denis@denix.org>
References: <1639602663-32787-1-git-send-email-denis@denix.org>

From: Ryan Eatmon <reatmon@ti.com>

This adds up numerous fixes for various k3 platforms.

While at it, bump the ti-upstream-tools repo as this sync up gives us:
config: audio_display: Update cdns-mhdp configs

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-kernel/linux/linux-ti-mainline_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kernel/linux/linux-ti-mainline_git.bb
index 9489ed6..6fe2107 100644
--- a/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -20,9 +20,9 @@ S = "${WORKDIR}/git"
 BRANCH = "master"
 TOOLS_BRANCH = "master"
 
-# 5.13 Mainline version
-SRCREV = "62fb9874f5da54fdb243003b386128037319b219"
-PV = "5.13+git${SRCPV}"
+# 5.15 Mainline version
+SRCREV = "8bb7eca972ad531c9b149c0a51ab43a417385813"
+PV = "5.15+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR:append = "b"
@@ -36,7 +36,7 @@ SRC_URI += " \
     file://defconfig \
 "
 
-SRCREV_ti-upstream-tools = "c9b8150cb00a5beb7b7f3e42d0d817aa9392fabd"
+SRCREV_ti-upstream-tools = "0f60697843bba6f8d721b14da92b1652563ccb95"
 SRCREV_FORMAT = "linux"
 
 KERNEL_DEVICETREE = ""
-- 
2.7.4

