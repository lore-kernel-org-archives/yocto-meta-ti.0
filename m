Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C64C4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 10:09:58 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.18300.1665569394908281318
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Oct 2022 03:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yYQpr046;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: m-chawdhry@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29CA9sCC124800
	for <meta-ti@lists.yoctoproject.org>; Wed, 12 Oct 2022 05:09:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665569394;
	bh=tfGlt5+a1uiToEX6szYQ5fi/1k/JK6kn1vT93VjCaJ0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yYQpr046DJss5CmKzyk6HsA7rWsN/XogUtu6ixvJqwTfuux4xUTse8Pj2OsJfGTv3
	 S25oBkqLbaI+1ZoYfGQAF/1kjuH6zq32bYLSMkQmTDyKjt9lC6s8OhjDul+HzBWI/9
	 Cb6CIguBiHugEHl+4aKuCe6WbMQV+GFXvA6hdVx4=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29CA9sIO006267
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 12 Oct 2022 05:09:54 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 12
 Oct 2022 05:09:53 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 12 Oct 2022 05:09:54 -0500
Received: from uda0497581.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29CA9fCO014602;
	Wed, 12 Oct 2022 05:09:52 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Manorit Chawdhry
	<m-chawdhry@ti.com>
Subject: [meta-ti][RFC dunfell][PATCH v2 5/6] cnm-wave-fw: add compatible for j784s4-hs-evm
Date: Wed, 12 Oct 2022 15:39:40 +0530
Message-ID: <20221012100941.153924-6-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221012100941.153924-1-m-chawdhry@ti.com>
References: <20221012100941.153924-1-m-chawdhry@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Oct 2022 10:09:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15154

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


