Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3196.1598403628449363525
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Aug 2020 18:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BF78F40C49;
	Wed, 26 Aug 2020 01:00:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IhO25dRHlCoW; Wed, 26 Aug 2020 01:00:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9F12940B96;
	Wed, 26 Aug 2020 01:00:26 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B80D2174463;
	Tue, 25 Aug 2020 21:00:25 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 2/2] ti-sci-fw: pick up u-boot-spl.bin from sysroot and simplify dependency
Date: Tue, 25 Aug 2020 21:00:24 -0400
Message-Id: <1598403624-32731-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598403624-32731-1-git-send-email-denis@denix.org>
References: <1598403624-32731-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index e50e7b3..458b892 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -1,10 +1,7 @@
 require recipes-bsp/ti-sci-fw/ti-sci-fw.inc
 
 DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
-
-UBOOT_DEPENDS = ""
-UBOOT_DEPENDS_j7200-evm-k3r5 = "u-boot-ti-staging:do_deploy"
-do_compile[depends] += "${UBOOT_DEPENDS}"
+DEPENDS_append_j7200-evm-k3r5 = " u-boot-ti-staging"
 
 CLEANBROKEN = "1"
 PR = "r1"
@@ -49,7 +46,7 @@ EXTRA_OEMAKE_HS = " \
 "
 EXTRA_OEMAKE_append = "${@['',' ${EXTRA_OEMAKE_HS}']['${SYSFW_SUFFIX}' == 'hs']}"
 
-EXTRA_OEMAKE_append_j7200-evm-k3r5 = " SBL="${DEPLOY_DIR_IMAGE}/u-boot-spl.bin""
+EXTRA_OEMAKE_append_j7200-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 
 do_compile() {
 	cd ${WORKDIR}/imggen/
-- 
2.7.4

