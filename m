Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90800C369D8
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 15:26:40 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.9211.1745594798342199287
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Apr 2025 08:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=d1MVvmN3;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: anshuld@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PFQarR2822648
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 10:26:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745594796;
	bh=EwutzM5axP76KQXe2zn/d/EUdLcbunpiEzKKCcpGO5w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=d1MVvmN3S92ymusByT2hJaxn0riNmw9RSoafucm0+LDCj/ZXMuz3QPRBEga/H/f0E
	 N97jXhPu83nKg63f9BvirU8ga5zC2T7rxBfJt3wSdNE8ME+ZtjeYUZLuPLHNMJKDLH
	 FpG/gmwkAfq5Yq26Yg9tuqM5mQY6HTzziS4r6OXQ=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PFQaqE017976
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 10:26:36 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 10:26:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 10:26:36 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PFQZQE094905;
	Fri, 25 Apr 2025 10:26:35 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
        <vigneshr@ti.com>
Subject: [PATCH v3 3/4] bsp: u-boot: deploy tispl_falcon.bin to rootfs
Date: Fri, 25 Apr 2025 20:56:09 +0530
Message-ID: <20250425152613.2470204-4-anshuld@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425152613.2470204-1-anshuld@ti.com>
References: <20250425152613.2470204-1-anshuld@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Apr 2025 15:26:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18509

Falcon boot requires tispl_falcon.bin to be on the same filesystem
partition as the fitImage.

This patch creates a new u-boot package called
'u-boot-ti-staging-falcon' that is included in IMAGE_INSTALL when
ti-falcon is enabled which allows us to deploy the required files to
rootfs.

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-falcon.inc | 1 +
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/ti-falcon.inc b/meta-ti-bsp/conf/machine/include/ti-falcon.inc
index 55a4daa6..0b938470 100644
--- a/meta-ti-bsp/conf/machine/include/ti-falcon.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-falcon.inc
@@ -1,3 +1,4 @@
+IMAGE_INSTALL:append = " u-boot-ti-staging-falcon"
 KERNEL_CLASSES:remove = "kernel-fitimage"
 KERNEL_CLASSES += "kernel-fitimage-legacyhs"
 UBOOT_DTB_LOADADDRESS = "0x88000000"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index baa05e78..1d754560 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -14,6 +14,8 @@ require u-boot-mergeconfig.inc
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot:"
 
+FILES:${PN}-falcon = "boot/tispl_falcon.bin"
+
 SUMMARY = "u-boot bootloader for TI devices"
 
 LICENSE = "GPL-2.0-or-later"

