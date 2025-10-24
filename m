Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 151A5CCD1BF
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 15:54:02 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.14961.1761321238301013070
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 08:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wlYbu/FP;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59OFrvPp779054;
	Fri, 24 Oct 2025 10:53:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761321237;
	bh=YY4CEepvwprhgLj9WGOjwj6g+F0UhzX/7xiVWB0MKz4=;
	h=From:To:Subject:Date;
	b=wlYbu/FPqg/By2Rgc0zmwUVs3C4LuAJuzsHIIWu0J0Oeh8HB6uo55/X/w8BLGrLiQ
	 aIuF3UuRUQYsEaDsVOnlfIVhmdJ3VWbqhiXxQoicpVzDi5QHzDw9k0sVSg19Vss/3J
	 w6kCP9aS3Y5ubWSFvqbl5vgZnfoNTxI6liQiKxks=
Received: from DLEE213.ent.ti.com (dlee213.ent.ti.com [157.170.170.116])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59OFruPh3981493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Oct 2025 10:53:57 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Oct
 2025 10:53:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Oct 2025 10:53:56 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59OFru6v560640;
	Fri, 24 Oct 2025 10:53:56 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1vCK72-0005C1-9P; Fri, 24 Oct 2025 10:53:56 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2] packagegroup-ti-core-initramfs: ensure TI_INITRAMFS_KERNEL_MODULES is set
Date: Fri, 24 Oct 2025 10:53:56 -0500
Message-ID: <20251024155356.19234-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 24 Oct 2025 15:54:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19171

TI_INITRAMFS_KERNEL_MODULES gets set only for TI platfroms and ends up
being undefined otherwise, which breaks parsing in yocto-check-layer
and/or in multi-BSP setups. Ensure the variable is defined in the
packagegroup, if not already set by the machine configuration.

Remove the previous default assignment since we put it in the wrong
location.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Remove the setting in ti-soc.inc.

 meta-ti-bsp/conf/machine/include/ti-soc.inc                     | 2 --
 .../recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb      | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/conf/machine/include/ti-soc.inc
index 2e3a1c1b..ca182968 100644
--- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
@@ -29,8 +29,6 @@ CLASS_DEVICETREE_PREFIX = "${@ 'ti-devicetree-prefix' if d.getVar('KERNEL_DEVICE
 KERNEL_CLASSES += "${CLASS_DEVICETREE_PREFIX}"
 IMAGE_CLASSES += "${CLASS_DEVICETREE_PREFIX}"
 
-TI_INITRAMFS_KERNEL_MODULES ?= ""
-
 BUILD_CORE_INITRAMFS_IMAGE = "ti-core-initramfs"
 BUILD_CORE_INITRAMFS_IMAGE_FILE = "${BUILD_CORE_INITRAMFS_IMAGE}.cpio.xz"
 
diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
index e9cf5e6b..6845f0c9 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
@@ -2,6 +2,8 @@ SUMMARY = "Minimal initramfs for boot requirements"
 
 require recipes-core/packagegroups/packagegroup-core-boot.bb
 
+TI_INITRAMFS_KERNEL_MODULES ?= ""
+
 RDEPENDS:${PN} += "\
     ${TI_INITRAMFS_KERNEL_MODULES} \
     initramfs-framework-base \
-- 
2.17.1


