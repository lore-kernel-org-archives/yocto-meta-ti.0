Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 808F4C3ABB0
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 21:25:12 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.148.1746221111283027675
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 May 2025 14:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RvhEzH8v;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542LPAO13957616
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 16:25:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746221110;
	bh=+F5vJCmGArMtXTGdPvSs+CgMFCgzM2UYAwujCZbsWGM=;
	h=From:To:CC:Subject:Date;
	b=RvhEzH8vaN2eRKExBh7eay7f+P0Mt5iA4/n165mAaHmpwjN4HnsYsCR5F9oKgiSPz
	 CdYDUg4AFxii4mUpBoc2JLnK4d9+qElhLnaUyiPFMwUGcGzLBlEVMju6NwZlPub93K
	 Iuk7JhSSzSv9eL1HvXTDPMQ/d3o59AVS1BkfsGmE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542LP91h034591
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 16:25:10 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 16:25:09 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 16:25:09 -0500
Received: from lelvsmtp6.itg.ti.com ([10.250.35.60])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542LP9aM095517;
	Fri, 2 May 2025 16:25:09 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH v2 1/3] ti-eth-fw: Only include information for supported machines
Date: Fri, 2 May 2025 16:25:05 -0500
Message-ID: <20250502212507.78984-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 02 May 2025 21:25:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18531

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


