Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2AD5C7EE23
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 18:27:40 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1415.1685125656541793969
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 May 2023 11:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Wp35VGcl;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34QIRYdr009526;
	Fri, 26 May 2023 13:27:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685125654;
	bh=oWaOENCQDjPLxoe6XOIXujlyHk21wJT7h+v2LLvX/+8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Wp35VGclJIRMDIvVnCNuC+OFHuThdshESDlWqyGf/HRdQK4RwnnclMCHRcYEucGbe
	 27DHN1mIeNuR7V+M4VCkEGJebbB4/c97LyLuE6Z9NLb7P6OkUG9qfXYxkfzwiZuXg+
	 QId0Ap1JdrnekvL0aGtzjFBLDk00QfigCIxP7zlI=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34QIRYu7109125
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 May 2023 13:27:34 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 May 2023 13:27:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 May 2023 13:27:34 -0500
Received: from fllv0040.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34QIRWls013297;
	Fri, 26 May 2023 13:27:34 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 4/8] conf: machine: j784s4: Include the non-HS config in the HS config
Date: Fri, 26 May 2023 13:27:27 -0500
Message-ID: <20230526182731.284783-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230526182731.284783-1-afd@ti.com>
References: <20230526182731.284783-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 May 2023 18:27:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16604

Everything is the same, so just include the non-HS config to set vars.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/j784s4-hs-evm.conf | 24 +--------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf b/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
index 847a26b6..8fa1c1fd 100644
--- a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
@@ -2,26 +2,4 @@
 #@NAME: J784S4 HS EVM
 #@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM
 
-require conf/machine/include/j784s4.inc
-
-TFA_K3_USART = "0x8"
-OPTEEMACHINE = "k3-j784s4"
-OPTEE_K3_USART = "0x8"
-
-KERNEL_DEVICETREE_PREFIX = " \
-    ti/k3-j784s4 \
-    ti/k3-j7200-mcspi-loopback \
-    ti/k3-am69-sk \
-"
-
-KERNEL_DEVICETREE = " \
-    ti/k3-j784s4-evm.dtb \
-"
-
-UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
-
-TFA_BOARD = "j784s4"
-
-SPL_BINARY = "tispl.bin_HS"
-UBOOT_BINARY = "u-boot.img_HS"
-UBOOT_SYMLINK = "u-boot.img"
+require conf/machine/j784s4-evm.conf
-- 
2.39.2


