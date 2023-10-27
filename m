Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E6FBC25B6E
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 22:22:19 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.28094.1698445334282286542
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 15:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Chc8c6ec;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39RMMCFu043996;
	Fri, 27 Oct 2023 17:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698445332;
	bh=IdGdmllvaoP15xHga+6SaHAfid6iG/3cySA/SPfYkYU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Chc8c6ecSU6PyO2EapO33SdvHUQwiNZFRx9oNS+pLu9aufP/8GoGlb20T+6q1OihP
	 IcXHEf1t092aVGLGg4mkLNKvwvQJ2ppBls/KJwDrhLynwXAeTKYKWB5V0yuYZkTt4P
	 /ogG1XvPfHvnMxyzh6NZXyOyk6Qjt5plm4eYfrbE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39RMMCqt110713
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Oct 2023 17:22:12 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 27
 Oct 2023 17:22:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 27 Oct 2023 17:22:11 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39RMMBQP014476;
	Fri, 27 Oct 2023 17:22:12 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>,
        Randolph Sapp
	<rs@ti.com>
Subject: [meta-ti][kirkstone][PATCH 2/4] ti-img-rogue-*: move to 23.2 release
Date: Fri, 27 Oct 2023 17:21:58 -0500
Message-ID: <20231027222200.3659634-3-rs@ti.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231027222200.3659634-1-rs@ti.com>
References: <20231027222200.3659634-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Oct 2023 22:22:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17215

From: Randolph Sapp <rs@ti.com>

Move to the 23.2 release branch and bump SRCREV accordingly. This branch
has the proper implementation of the cache coherency fix along with some
other checks that address some system stability issues on Jacinto
devices.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 ...iver_23.1.6404501.bb => ti-img-rogue-driver_23.2.6460340.bb} | 2 +-
 ...libs_23.1.6404501.bb => ti-img-rogue-umlibs_23.2.6460340.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_23.1.6404501.bb => ti-img-rogue-driver_23.2.6460340.bb} (95%)
 rename meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-umlibs_23.1.6404501.bb => ti-img-rogue-umlibs_23.2.6460340.bb} (98%)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
similarity index 95%
rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
index 10f3b727..d46699ca 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
@@ -22,7 +22,7 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
 
 S = "${WORKDIR}/git"
 
-SRCREV = "c0adc3c36f4a0b2f590abfe0609b03096d58c648"
+SRCREV = "778aa5d1e104f36c7f7c1f50e99f8499cbbdadbb"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
similarity index 98%
rename from meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
index 0d02f12a..121c4cc5 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
@@ -12,7 +12,7 @@ PR = "r2"
 
 BRANCH = "linuxws/kirkstone/k6.1/${PV}"
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
-SRCREV = "6e460fee82d07513bb329b3022e5430c5ba73809"
+SRCREV = "d0543929cc6fe53959a64c60285896e2c14ed314"
 S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
-- 
2.42.0


