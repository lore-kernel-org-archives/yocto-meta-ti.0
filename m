Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558C8C43217
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 09:18:59 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.5152.1665479932015354030
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 02:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EOv7e/BI;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: m-chawdhry@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29B9Ipi8095386
	for <meta-ti@lists.yoctoproject.org>; Tue, 11 Oct 2022 04:18:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665479931;
	bh=tfGlt5+a1uiToEX6szYQ5fi/1k/JK6kn1vT93VjCaJ0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EOv7e/BIxL6oRbsJvY14iO+e73zeZfqONNUqkmQEkNugXiLFLwcPGgek1vEFqiWpx
	 a3qJdbJiE6jkNdtR5fT/+Nk5KCK0N4m4xLm6Pen3HYVeNTqBmqa2v6dSr0YnmeQsYi
	 1a0D19wc8R01c7s4Y4ouy7hRzUYYMZld/FyYCBIc=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29B9Ip1N129020
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 11 Oct 2022 04:18:51 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 11
 Oct 2022 04:18:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 11 Oct 2022 04:18:51 -0500
Received: from uda0497581.dhcp.ti.com (ileaxei01-snat.itg.ti.com
 [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29B9IdG9015392;
	Tue, 11 Oct 2022 04:18:49 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Manorit Chawdhry
	<m-chawdhry@ti.com>
Subject: [meta-ti][RFC dunfell][PATCH 5/6] cnm-wave-fw: add compatible for
 j784s4-hs-evm
Date: Tue, 11 Oct 2022 14:48:38 +0530
Message-ID: <20221011091839.1337077-6-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011091839.1337077-1-m-chawdhry@ti.com>
References: <20221011091839.1337077-1-m-chawdhry@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Oct 2022 09:18:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15143

Add the HS platform to the compatible list in the recipe.

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
 recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb | 3 ++-
 recipes-kernel/linux/kernel-rdepends.inc   | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index b5ad3e31..3d84acd5 100644
--- a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -13,7 +13,7 @@ PR = "${INC_PR}.1"
 
 CLEANBROKEN = "1"
 
-COMPATIBLE_MACHINE = "j721s2-evm|j721s2-hs-evm|j784s4-evm"
+COMPATIBLE_MACHINE = "j721s2-evm|j721s2-hs-evm|j784s4-evm|j784s4-hs-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -24,6 +24,7 @@ SOURCE_WAVE521C = "wave521c_codec_fw.bin"
 SOURCE_WAVE521C_j721s2-evm = "wave521c_j721s2_codec_fw.bin"
 SOURCE_WAVE521C_j721s2-hs-evm = "wave521c_j721s2_codec_fw.bin"
 SOURCE_WAVE521C_j784s4-evm = "wave521c_j721s2_codec_fw.bin"
+SOURCE_WAVE521C_j784s4-hs-evm = "wave521c_j721s2_codec_fw.bin"
 
 ALTERNATIVE_LINK_NAME[wave521c_codec_fw.bin] = "${base_libdir}/firmware/${TARGET_WAVE521C}"
 ALTERNATIVE_TARGET[wave521c_codec_fw.bin] = "${base_libdir}/firmware/cnm/${TARGET_WAVE521C}"
diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
index 8225a5af..0a61c408 100644
--- a/recipes-kernel/linux/kernel-rdepends.inc
+++ b/recipes-kernel/linux/kernel-rdepends.inc
@@ -51,6 +51,7 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " vxd-dec-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-evm = " cnm-wave-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-hs-evm = " cnm-wave-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j784s4-evm = " cnm-wave-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j784s4-hs-evm = " cnm-wave-fw"
 
 # Add run-time dependency for TIFS Low Power Module stub
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62xx-evm = " tifs-lpm-stub"
-- 
2.34.1


