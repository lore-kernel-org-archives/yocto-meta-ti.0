Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F9EC77B7A
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 18:50:23 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.214.1684435820922977079
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 May 2023 11:50:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fCi9ZZsg;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34IIoI0i100589;
	Thu, 18 May 2023 13:50:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684435818;
	bh=+SOsNMraiNt7FbA0w1UN6Cc2D8zfrYItRGhxz/a4B8E=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=fCi9ZZsg9S8fAdxr9VWnW4RAnB7h0R25+B07pzSWNpd3I31zf09q8lfJyds1nQk5P
	 d3gRwE3RuvqOGvCObYHnOVFmiaxTJ1JAJZxCrd9M/VcY1MOnKJd0ohzZOOs5hSsE2n
	 jmXi6iKK67y08MqS9MBRxtuoG2K8Tpu1eIWcjxoc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34IIoIjE124425
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 May 2023 13:50:18 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 May 2023 13:50:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 18 May 2023 13:50:18 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34IIoI2E013853;
	Thu, 18 May 2023 13:50:18 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pzihe-0007Yt-BB; Thu, 18 May 2023 13:50:18 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH v3 2/2] linux-ti-*: Use vendored kernel-devicetree.bbclass
Date: Thu, 18 May 2023 13:50:18 -0500
Message-ID: <20230518185018.29018-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518185018.29018-1-reatmon@ti.com>
References: <20230518185018.29018-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 May 2023 18:50:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16565

Change over to using the kernel_devicetree_vendor_dtb.bbclass to have
the DTBs installed into the same vendored subdirectory that is in the
kernel.  Setting the variables comes in a follow on patch.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v3: - Removed setting of variables for follow on patch.
    - Add additional kernel receipes that point to the new
      class.
v2: - Fixed syntax of "1"
    - Fixed name of custom kernel class to match the other patch.

 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb     | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index dfa46f48..74a4a860 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "Mainline Linux kernel for TI devices"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-inherit kernel
+inherit kernel_vendor_dtb
 
 require recipes-kernel/linux/kernel-rdepends.inc
 require recipes-kernel/linux/ti-kernel.inc
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
index 9138c7c5..e1e1eb5e 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "Linux-next kernel for TI devices"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-inherit kernel
+inherit kernel_vendor_dtb
 
 require recipes-kernel/linux/ti-kernel.inc
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
index cdee548f..e8622a2e 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
@@ -3,7 +3,7 @@ SUMMARY = "Linux kernel for TI devices"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-inherit kernel
+inherit kernel_vendor_dtb
 
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/kernel-rdepends.inc
-- 
2.17.1


