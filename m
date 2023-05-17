Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01E2C77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 20:08:51 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.61309.1684354122172900029
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 May 2023 13:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PCXyiQXF;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34HK8fHb030225;
	Wed, 17 May 2023 15:08:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684354121;
	bh=nJKx5WwOcRsV79UsP24hM5QFh0UjnD+R/GCh9rGMCzg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=PCXyiQXFqOYlJs/hiOULTTZ6qhHu3uq38stCE8QDUiebWZb22hEKkx+s5E93TGtjj
	 W43CaA8ileCGEVLzvWJJ4Q47cmp7wnDYtqoOaMpRSuWYo7Uy/2BygqtXecZTssCdQ7
	 FvZ5A7o0JgXSDXmHwUqvXd0SnVp8NhPlbW2wVWbk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34HK8fpW099891
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 May 2023 15:08:41 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 May 2023 15:08:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 May 2023 15:08:40 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34HK8e1X020022;
	Wed, 17 May 2023 15:08:40 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pzNRw-0006EB-Jd; Wed, 17 May 2023 15:08:40 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH 2/2] linux-ti-staging: Use vendored kernel-devicetree.bbclass
Date: Wed, 17 May 2023 15:08:40 -0500
Message-ID: <20230517200840.23897-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230517200840.23897-1-reatmon@ti.com>
References: <20230517200840.23897-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 May 2023 20:08:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16553

Change over to using the kernel-devicetree-vendor-dtb.bbclass to have
the DTBs installed into the same vendored subdirectory that is in the
kernel.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
index cdee548f..b45a9815 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
@@ -3,7 +3,7 @@ SUMMARY = "Linux kernel for TI devices"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-inherit kernel
+inherit kernel-vendor-dtb
 
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/kernel-rdepends.inc
@@ -18,6 +18,9 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
 		      ${EXTRA_DTC_ARGS}"
 
+KERNEL_DTBDEST = "${KERNEL_IMAGEDEST}/dtbs"
+KERNEL_DTBVENDORED = 1
+
 S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-6.1.y"
-- 
2.17.1


