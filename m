Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DFF8CCA482
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 10:35:40 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.10870.1654598138966655347
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 03:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PKbEkkO/;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: j-choudhary@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 257AZcgw128297
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Jun 2022 05:35:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654598138;
	bh=BhvT0fxlVH/CT6idSqQhNyoqPDP8ZmKc/OJ6/ai0/GM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PKbEkkO/uSsIEjKO6G0eC6bliDN1L4jkdOl3Bf+jw6IjmVrHjyH72V0KFJ3eIC27t
	 HGeYdxpM1a7iWQc+MnMU8nTdb1dBsH+c0H6Mb3NXAcp0GXBaaMnkMoo19p+2Et+s6e
	 JKfdlP1eaMOGDcZC9xQszPo/7T8ArOg/hTlsiSqw=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 257AZcDY097026
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Jun 2022 05:35:38 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 7
 Jun 2022 05:35:38 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 7 Jun 2022 05:35:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 257AZbd7001627;
	Tue, 7 Jun 2022 05:35:37 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <afd@ti.com>, <praneeth@ti.com>, <reatmon@ti.com>, <j-choudhary@ti.com>
Subject: [meta-ti] [dunfell PATCH v2 5/5] cnm-wave-fw: add compatible for
 j721s2-hs-evm
Date: Tue, 7 Jun 2022 16:05:29 +0530
Message-ID: <20220607103529.13068-6-j-choudhary@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220607103529.13068-1-j-choudhary@ti.com>
References: <20220607103529.13068-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Jun 2022 10:35:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14791

Add the HS platform to the compatible list in the recipe.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb | 3 ++-
 recipes-kernel/linux/kernel-rdepends.inc   | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index 0c432de2..83619090 100644
--- a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -13,7 +13,7 @@ PR = "${INC_PR}.1"
 
 CLEANBROKEN = "1"
 
-COMPATIBLE_MACHINE = "j721s2-evm"
+COMPATIBLE_MACHINE = "j721s2-evm|j721s2-hs-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -22,6 +22,7 @@ TARGET_WAVE521C = "wave521c_codec_fw.bin"
 
 SOURCE_WAVE521C = "wave521c_codec_fw.bin"
 SOURCE_WAVE521C_j721s2-evm = "wave521c_j721s2_codec_fw.bin"
+SOURCE_WAVE521C_j721s2-hs-evm = "wave521c_j721s2_codec_fw.bin"
 
 ALTERNATIVE_LINK_NAME[wave521c_codec_fw.bin] = "${base_libdir}/firmware/${TARGET_WAVE521C}"
 ALTERNATIVE_TARGET[wave521c_codec_fw.bin] = "${base_libdir}/firmware/cnm/${TARGET_WAVE521C}"
diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
index 17aee4c2..2ebf4948 100644
--- a/recipes-kernel/linux/kernel-rdepends.inc
+++ b/recipes-kernel/linux/kernel-rdepends.inc
@@ -45,6 +45,7 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " vxd-dec-fw"
 
 # Add run-time dependency for Chips&Media Wave521 firmware to the rootfs
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-evm = " cnm-wave-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-hs-evm = " cnm-wave-fw"
 
 # Add run-time dependency for TIFS Low Power Module stub
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62xx-evm = " tifs-lpm-stub"
-- 
2.17.1


