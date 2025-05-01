Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF62DC369DC
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 14:26:42 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.1.1746109591664806896
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 May 2025 07:26:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lnOu+QyU;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 541EQPCK020545
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 May 2025 09:26:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746109585;
	bh=+F5vJCmGArMtXTGdPvSs+CgMFCgzM2UYAwujCZbsWGM=;
	h=From:To:CC:Subject:Date;
	b=lnOu+QyUt4jRnIPm4QPIgUc59lB3KLMn2+AObXoaynQuQSJWT4UBSXqbzpf5uQd0C
	 mAKwnMNQgspmcWDfovLNVdUpC1hfxCxBQY9Bsyy5aN6K7ac0uSRDSoMCE33fZnslRm
	 jY0ZwP9TpspsXqaXJBNx6u7uwdmyMpIpJf+mFZlY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 541EQPpn046156
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 May 2025 09:26:25 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 May 2025 09:26:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 May 2025 09:26:24 -0500
Received: from fllvsmtp8.itg.ti.com ([10.250.35.60])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 541EQO6i077683;
	Thu, 1 May 2025 09:26:24 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH 1/3] ti-eth-fw: Only include information for supported machines
Date: Thu, 1 May 2025 09:26:21 -0500
Message-ID: <20250501142623.351217-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 01 May 2025 14:26:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18526

These other machines are not compatible with this recipe, no need to
setup definitions for these.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
index cf9566dc..e4b6d1de 100644
--- a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
@@ -3,7 +3,7 @@ SUMMARY = "TI Ethernet prebuilt binary firmware images"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://${THISDIR}/../../licenses/TI-TFL;md5=a1b59cb7ba626b9dbbcbf00f3fbc438a"
 
-COMPATIBLE_MACHINE = "k3"
+COMPATIBLE_MACHINE = "j721e|j7200|j784s4"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -22,15 +22,7 @@ inherit ti-secdev
 PLAT_SFX = ""
 PLAT_SFX:j721e = "j721e"
 PLAT_SFX:j7200 = "j7200"
-PLAT_SFX:j721s2 = "j721s2"
 PLAT_SFX:j784s4 = "j784s4"
-PLAT_SFX:j722s = "j722s"
-PLAT_SFX:j742s2 = "j742s2"
-PLAT_SFX:am65xx = "am65xx"
-PLAT_SFX:am64xx = "am64xx"
-PLAT_SFX:am62xx = "am62xx"
-PLAT_SFX:am62pxx = "am62pxx"
-PLAT_SFX:am62axx = "am62axx"
 
 ETH_FW_DIR = "ti-eth/${PLAT_SFX}"
 
@@ -41,15 +33,7 @@ ETH_FW = "app_remoteswitchcfg_server_strip.xer5f"
 ETH_FW_LIST = ""
 ETH_FW_LIST:j721e =   "${ETH_FW}"
 ETH_FW_LIST:j7200 =   "${ETH_FW}"
-ETH_FW_LIST:j721s2 =  ""
 ETH_FW_LIST:j784s4 =  "${ETH_FW}"
-ETH_FW_LIST:j722s =   ""
-ETH_FW_LIST:j742s2 =  ""
-ETH_FW_LIST:am65xx =  ""
-ETH_FW_LIST:am64xx =  ""
-ETH_FW_LIST:am62xx =  ""
-ETH_FW_LIST:am62pxx = ""
-ETH_FW_LIST:am62axx = ""
 
 do_install() {
     # ETH firmware
-- 
2.39.2


