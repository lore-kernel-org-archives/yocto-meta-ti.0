Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B29C83F22
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 14:52:36 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.24374.1752677549903782050
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 16 Jul 2025 07:52:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZRWXiqHB;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56GEqSkR2871594;
	Wed, 16 Jul 2025 09:52:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752677548;
	bh=74podkWHYkdjm9iAw3G5VcgXXMWrFTieLCJVquRDfa0=;
	h=From:To:Subject:Date;
	b=ZRWXiqHBNyhd5oeWhVOaYI3re76PDDiO5QWEB+cnsywXw8yk5/Kc/XjiyRXNdubDZ
	 oA1oPoi+wtCaLs08ovsrPpemEcTMBnYAUZzDrQif18H4dZU2mp4ENGbe/LhVsGNmoA
	 sk05Oht613hJ9Mhs75G+WGADJOgXN3h5XYelf+J8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56GEqSEq956589
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 16 Jul 2025 09:52:28 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 16
 Jul 2025 09:52:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 16 Jul 2025 09:52:27 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56GEqRFL338751;
	Wed, 16 Jul 2025 09:52:27 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uc3Uh-0000SE-MS; Wed, 16 Jul 2025 09:52:27 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2] ti-kernel-fitimage: Add ti-secdev
Date: Wed, 16 Jul 2025 09:52:27 -0500
Message-ID: <20250716145227.1699-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 16 Jul 2025 14:52:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18792

In order to turn the fitImage signing back on, we need to inherit the
ti-secdev class to setup all of the needed signing variables.

Remove the inherit ti-secdev from the kernel recipes since the fitImage
signing is handled in the ti-kernel-fitimage recipe and not in the
kernel recipes anymore.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Remove the inherit ti-secdev from the kernel recipes and add
    appropriate comment.

 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb  | 1 -
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb | 1 -
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb  | 1 -
 meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb    | 2 ++
 4 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
index ac034c2c..39ff24ed 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
@@ -3,7 +3,6 @@ SUMMARY = "Linux kernel for TI devices"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-inherit ti-secdev
 inherit kernel
 
 require recipes-kernel/linux/setup-defconfig.inc
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 3383787e..e58eadcb 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -3,7 +3,6 @@ SUMMARY = "Linux kernel for TI devices"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-inherit ti-secdev
 inherit kernel
 
 require recipes-kernel/linux/setup-defconfig.inc
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
index 07cad78d..a2eb3978 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
@@ -3,7 +3,6 @@ SUMMARY = "Linux kernel for TI devices"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-inherit ti-secdev
 inherit kernel
 
 require recipes-kernel/linux/setup-defconfig.inc
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb b/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
index dae76387..a5e6a280 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
@@ -3,6 +3,8 @@ FIT_CONF_PREFIX ?= "conf-ti_"
 
 require recipes-kernel/linux/linux-yocto-fitimage.bb
 
+inherit ti-secdev
+
 include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
 
 do_compile[depends] += "virtual/kernel:do_shared_workdir"
-- 
2.17.1


