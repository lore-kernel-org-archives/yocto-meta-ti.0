Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9CC0C7EE2A
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 18:06:51 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.22878.1750874811379690899
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jun 2025 11:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ijciQ1Aa;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55PI6opn1524233;
	Wed, 25 Jun 2025 13:06:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750874810;
	bh=1Hm/AJ4K/dZey8BHMa7psYFp6lubbmU83cjExJBbtn0=;
	h=From:To:Subject:Date;
	b=ijciQ1AasrvGIupHEnSp482xkERAQs9eZO1rg1XVGvn6XGMLD+a7xSJLXj/sS5E+b
	 v0XC+w3+ybTrESs6HbRsYEuk72V0/7fvPETP9dnmJ360M3xw0oCOxpUUpsZ3hXPrVv
	 +/P+iN+69hZuy8ilAXtRtbfT/6hncaDEU8YS4rro=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55PI6oJn2890579
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 25 Jun 2025 13:06:50 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 13:06:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 13:06:49 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55PI6oPs4075681;
	Wed, 25 Jun 2025 13:06:50 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uUUWI-0004eE-3J; Wed, 25 Jun 2025 13:06:50 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 1/7] meta-ti/linux: Update for S changes
Date: Wed, 25 Jun 2025 13:06:44 -0500
Message-ID: <20250625180650.17820-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 18:06:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18677

The kernel class operates a little differently.  The kernel is
downloaded and then moved to the "global" shared location and a symlink
is created to point to that location.  Since we cannot set S =
"${WORKDIR}/git" anymore, just choose a new name under UNPACKDIR.  The
value for BB_GIT_DEFAULT_DESTSUFFIX is the subdir name that is used by
default when fetching git repositories, so just use that name.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb      | 2 +-
 meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb     | 2 +-
 meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb      | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb  | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb
index 805c3a84..067c9ddf 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb
@@ -53,7 +53,7 @@ PB-MIKROBUS-0.dtbo \
 PB-MIKROBUS-1.dtbo \
 "
 
-S = "${WORKDIR}/git"
+S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 # 6.1.83 version for 32-bit
 SRCREV:armv7a = "be9b910b08dfd674e47a2643f35080b005ac3792"
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
index e3521505..6e221d1b 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
@@ -53,7 +53,7 @@ ${DT_VENDOR_PREFIX}PB-MIKROBUS-0.dtbo \
 ${DT_VENDOR_PREFIX}PB-MIKROBUS-1.dtbo \
 "
 
-S = "${WORKDIR}/git"
+S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 # 6.12.22 version for 32-bit
 SRCREV:armv7a = "d7f560ef48a867b94959f040b4c3c57053f4e32d"
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
index c6dcdfd2..cc7a56ac 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
@@ -53,7 +53,7 @@ ${DT_VENDOR_PREFIX}PB-MIKROBUS-0.dtbo \
 ${DT_VENDOR_PREFIX}PB-MIKROBUS-1.dtbo \
 "
 
-S = "${WORKDIR}/git"
+S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 # 6.6.58 version for 32-bit
 SRCREV:armv7a = "0d043a88f69f48789e43526d7a807ab744708071"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index 4e9ae3a1..388110ad 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -11,7 +11,7 @@ DEPENDS += "gmp-native libmpc-native"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}"
 
-S = "${WORKDIR}/git"
+S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 # 6.12 Mainline version
 SRCREV = "adc218676eef25575469234709c2d87185ca223a"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
index 7c91a3d4..97fa6463 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
@@ -19,7 +19,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
 		      ${EXTRA_DTC_ARGS}"
 
-S = "${WORKDIR}/git"
+S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.1.y"
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 3ea4e6a6..58a6ac2e 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -19,7 +19,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.12:"
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
 		      ${EXTRA_DTC_ARGS}"
 
-S = "${WORKDIR}/git"
+S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.12.y"
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
index 1eaa859d..4714bba1 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
@@ -19,7 +19,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.6:"
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
 		      ${EXTRA_DTC_ARGS}"
 
-S = "${WORKDIR}/git"
+S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.6.y"
 
-- 
2.17.1


