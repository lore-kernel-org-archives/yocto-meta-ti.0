Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.4547.1627995587668662199
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 Aug 2021 05:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=by/BjO8c;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: lokeshvutla@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 173CxhDh128396;
	Tue, 3 Aug 2021 07:59:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1627995583;
	bh=pxOa6PE+fLldB+q7j1MNPYVMJ+hFd71XHP5me+af3Eg=;
	h=From:To:CC:Subject:Date;
	b=by/BjO8csdsoK1IUbGkFfTfhJfA5GRfn49w5wBWfreqioDNbPbPzd1g0Y8VIOjIFJ
	 7/7D1GX/10sx7Y5u8W/fuWJUos9GA5WQx29/JX8uCnUEZQQeNu3BVO8HXP0swJb/4f
	 RJYBXVzJt6pCruUbyKTek6cdxIo1YXxxwvJuoYN8=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 173Cxhlv058410
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Aug 2021 07:59:43 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 3 Aug
 2021 07:59:42 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 3 Aug 2021 07:59:42 -0500
Received: from uda0131933.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 173Cxe5I024849;
	Tue, 3 Aug 2021 07:59:40 -0500
From: "Lokesh Vutla" <lokeshvutla@ti.com>
To: <meta-ti@lists.yoctoproject.org>, Praneeth Bajjuri <praneeth@ti.com>
CC: <yogeshs@ti.com>, <denis@denix.org>, Nishanth Menon <nm@ti.com>,
        Lokesh
 Vutla <lokeshvutla@ti.com>
Subject: [dunfell/master PATCH] ti-rtos-firmware: Update PATH to include ti-sci-fw
Date: Tue, 3 Aug 2021 18:29:39 +0530
Message-ID: <20210803125939.18706-1-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Yogesh Siraswar <yogeshs@ti.com>

Build is failing for ti-rtos-firmware when ARAGO_BRAND = "mainline"
with below error:
"ERROR: ti-rtos-firmware-08.00.00.32-r0.0 do_fetch: Fetcher failure:
Unable to find file file://0001-Revert-soc-am64x-Makefile-Move-the-
SPL-Load-address-.patch;patchdir=../imggen anywhere."

This is because the mentioned patch is not present in the current path.
Fix this by updating the path to include ti-sci-fw

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 conf/layer.conf                            | 1 +
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index 26a42f7f..c37d6bae 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -1,5 +1,6 @@
 # We have a conf and classes directory, append to BBPATH
 BBPATH .= ":${LAYERDIR}"
+METATIBASE := '${@os.path.normpath("${LAYERDIR}/")}'
 
 # We have a recipes directory, add to BBFILES
 BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 198426ed..43de1ec2 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -18,6 +18,7 @@ PLAT_SFX_j7200-evm = "j7200"
 PLAT_SFX_am65xx = "am65xx"
 PLAT_SFX_am64xx = "am64xx"
 
+FILESEXTRAPATHS_prepend := "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
 require recipes-bsp/ti-sci-fw/ti-sci-fw.inc
 
 CORESDK_RTOS_VERSION ?= "08.00.00.26"
-- 
2.30.0

