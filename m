Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397ACD3C52D
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 19:08:33 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.6156.1729192107645815486
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Oct 2024 12:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=poXQcNr6;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49HJ8QVc098612;
	Thu, 17 Oct 2024 14:08:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729192106;
	bh=YqHTIoAspqE3UBAWOqb7JY1q/Eh1tf8KozO+4aghDB8=;
	h=From:To:Subject:Date;
	b=poXQcNr6JDbiSLdhkgFC5KEh1zIe6gW/Go2ovBMZYOkWr/h4FLodWHR/yDCu7RqFk
	 NixN5BSa+B7wP/za9/FNOzMzApIq9DcBqPJMg/3gGpjc0Dawe8t1Z6bN3Ne3aMUk9w
	 zdll1FkKhEku0Oy8WqBNso9C+hB7iBSD4wFxrIjg=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49HJ8QA9083994
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Oct 2024 14:08:26 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Oct 2024 14:08:26 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Oct 2024 14:08:26 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49HJ8QCQ058159;
	Thu, 17 Oct 2024 14:08:26 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1t1VrG-0001Uc-06; Thu, 17 Oct 2024 14:08:26 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] linux: Rework the reproducibility patches
Date: Thu, 17 Oct 2024 14:08:25 -0500
Message-ID: <20241017190825.5694-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 17 Oct 2024 19:08:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18012

It was suggested to move the reproducibility patches out of
ti-kernel.inc and into the respective recipes.  Take this time to also
rename the variable being added to the SRC_URI to
REPRODUCIBILITY_PATCHES to make it clearer about what the patches are
that it lists.

This change will also make it easier for the upstream testing flow to
update the mainline recipe to the new version and update the needed
patches at the same time.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../linux/linux-ti-mainline_git.bb             |  4 ++++
 .../linux/linux-ti-staging_6.12.bb             |  4 ++++
 .../linux/linux-ti-staging_6.6.bb              |  4 ++++
 meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc | 18 ++----------------
 4 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index a9048f16..bd06cc2b 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -19,6 +19,10 @@ PV = "6.11"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=https;branch=master"
 
+REPRODUCIBILITY_PATCHES:bsp-mainline = " \
+    file://0001-drivers-gpu-drm-msm-registers-improve-reproducibilit.patch \
+"
+
 DEFCONFIG_NAME = "multi_v7_defconfig"
 DEFCONFIG_NAME:omapl138 = "davinci_all_defconfig"
 DEFCONFIG_NAME:k3 = "defconfig"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index f6f8732b..591eb5e3 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -33,6 +33,10 @@ KERNEL_GIT_PROTOCOL = "https"
 SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
             file://defconfig"
 
+REPRODUCIBILITY_PATCHES:bsp-ti-6_12 = " \
+    file://0001-drivers-gpu-drm-msm-registers-improve-reproducibilit.patch \
+"
+
 # Special configuration for remoteproc/rpmsg IPC modules
 module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
 module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg_bus"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
index 9a906a0f..baf5f9f1 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
@@ -31,6 +31,10 @@ KERNEL_GIT_PROTOCOL = "https"
 SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
             file://defconfig"
 
+REPRODUCIBILITY_PATCHES:bsp-ti-6_6 = " \
+    file://0001-vt-conmakehash-improve-reproducibility.patch \
+"
+
 # Special configuration for remoteproc/rpmsg IPC modules
 module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
 module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg_bus"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
index 09cfdb12..e51b14d7 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
@@ -13,19 +13,5 @@ EXTRA_DTC_ARGS += "${@get_extra_dtc_args(d)}"
 KERNEL_DTBDEST = "${KERNEL_IMAGEDEST}/dtb"
 KERNEL_DTBVENDORED = "1"
 
-KERNEL_PATCHES = ""
-
-KERNEL_PATCHES:bsp-mainline = " \
-    file://0001-vt-conmakehash-improve-reproducibility-for-v6.10.patch \
-    file://0001-drivers-gpu-drm-msm-registers-improve-reproducibilit.patch \
-"
-
-KERNEL_PATCHES:bsp-ti-6_12 = " \
-    file://0001-drivers-gpu-drm-msm-registers-improve-reproducibilit.patch \
-"
-
-KERNEL_PATCHES:bsp-ti-6_6 = " \
-    file://0001-vt-conmakehash-improve-reproducibility.patch \
-"
-
-SRC_URI:append = " ${KERNEL_PATCHES} "
+REPRODUCIBILITY_PATCHES = ""
+SRC_URI:append = " ${REPRODUCIBILITY_PATCHES}"
-- 
2.17.1


