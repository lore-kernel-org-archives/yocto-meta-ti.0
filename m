Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DE1C636D6
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 23:10:37 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.514.1675897834164883934
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 15:10:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MCjTHo2y;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 318NAXT0055080;
	Wed, 8 Feb 2023 17:10:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675897833;
	bh=dCMP4I13fAvOPx5rM1htbEf+BJ4yWN12jAlgk3tIBzA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=MCjTHo2yylrK40V/tSzIqnfe7SxHd0+M//uRnGl1HwIqp7shlFuhPuL43ZpX116Yj
	 f8a/Dc87mPAI18wvcxmuyiFtC6ZVTPMR/zB8ZtnfgmezCoSM0lTl0B0Q9Y+I+l6xz+
	 vc89e5YAe8ONy664OPEL1ZdDjKEzK068DbLCXPSg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 318NAXX0010818
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Feb 2023 17:10:33 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 8
 Feb 2023 17:10:32 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 8 Feb 2023 17:10:32 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 318NAVKg043668;
	Wed, 8 Feb 2023 17:10:32 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 4/4] conf: machine: k3: Remove unneeded TI_SECURE_DEV_PKG_K3 assignments
Date: Wed, 8 Feb 2023 17:10:31 -0600
Message-ID: <20230208231031.16363-4-afd@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208231031.16363-1-afd@ti.com>
References: <20230208231031.16363-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Feb 2023 23:10:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15763

For K3 machines the SECDEV selection happens in the recipes that use it.
This assignment is therefor no longer needed. Remove it.

Suggested-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/include/k3.inc   | 2 --
 meta-ti-bsp/conf/machine/include/k3r5.inc | 2 --
 2 files changed, 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index a34b67ff..3b59645b 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -48,5 +48,3 @@ MACHINE_FEATURES += "efi"
 WKS_FILE ?= "sdimage-2part-efi.wks"
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
 do_image_wic[mcdepends] += "mc::k3r5:ti-sci-fw:do_deploy"
-
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/meta-ti-bsp/conf/machine/include/k3r5.inc b/meta-ti-bsp/conf/machine/include/k3r5.inc
index 31646f5a..d000404e 100644
--- a/meta-ti-bsp/conf/machine/include/k3r5.inc
+++ b/meta-ti-bsp/conf/machine/include/k3r5.inc
@@ -22,5 +22,3 @@ UBOOT_SYMLINK = "u-boot-r5spl.${UBOOT_SUFFIX}"
 
 PACKAGECONFIG:pn-u-boot-ti-staging = ""
 PACKAGECONFIG:pn-u-boot-ti-mainline = ""
-
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
-- 
2.39.1


