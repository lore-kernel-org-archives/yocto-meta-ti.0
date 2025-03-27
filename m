Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FE5C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 22:36:45 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.2086.1743114998511847468
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Mar 2025 15:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yKM7khrD;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52RMaVmD2613775
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 17:36:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743114991;
	bh=9jaFqsiSYwkG0GMwZ1Ew3AzOJrZEU0FdzoZCnxiivps=;
	h=From:To:CC:Subject:Date;
	b=yKM7khrDNc9FztjiyIEwWyJht+Jg/Un8bDK/skNztMUa2XZA3Bg8fXn3nMGDXfTe8
	 iLywD+HwIHwVMm3P2I33IWQEI2ZMz+g1UV3VI58vw9h7a6oc3QO74l/SyEBtGaWKsR
	 7vPogqd06s1pxxsuhAcNEs4KpPsJybXuhAg75Duw=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52RMaVTL030618
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Mar 2025 17:36:31 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Mar 2025 17:36:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Mar 2025 17:36:30 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52RMaU2O046384;
	Thu, 27 Mar 2025 17:36:30 -0500
From: <rs@ti.com>
To: <alex.kiernan@gmail.com>, <sebastian.krahl@lacon.de>, <denis@denix.org>,
        <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][scarthgap][master][PATCH] ti-sgx-ddk-um: fixup packageconfig params
Date: Thu, 27 Mar 2025 17:35:54 -0500
Message-ID: <20250327223554.1501703-1-rs@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Mar 2025 22:36:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18432

From: Randolph Sapp <rs@ti.com>

Fix the package config params to make it obvious what combinations are
allowed. Also, rework the way we are inheriting init related classes so
that we don't accidentally do any additional postinstall steps. While
we're at it, don't execute anything for the compile or configure stage.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../ti-sgx-ddk-um_1.17.4948957.bb             | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
index 98bdec08..21968fd8 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
@@ -17,14 +17,23 @@ SRCREV = "84a396a4fb379f10931421e489ac8a199d6a9f2c"
 
 INITSCRIPT_NAME = "rc.pvr"
 INITSCRIPT_PARAMS = "defaults 8"
+SYSTEMD_SERVICE:${PN} = "pvrsrvctl.service"
 
+# Prefer udev rules over everything, but we do have init services if necessary
 PACKAGECONFIG ??= "udev"
-PACKAGECONFIG[udev] = "UDEV=true,,,udev"
+PACKAGECONFIG[udev] = "UDEV=true,UDEV=false,,udev,,sysvinit systemd"
+PACKAGECONFIG[systemd] = "SYSTEMD=true,SYSTEMD=false,,,,udev sysvinit"
+PACKAGECONFIG[sysvinit] = ",,,,,udev systemd"
 
-def use_sysvinit(d):
-    return d.getVar('VIRTUAL-RUNTIME_init_manager') == 'sysvinit'
+def pick_init(d):
+    packageconfig = d.getVar('PACKAGECONFIG').split()
+    if 'udev' not in packageconfig:
+        if d.getVar('VIRTUAL-RUNTIME_init_manager') == 'sysvinit':
+            return "update-rc.d"
+        return "systemd"
+    return ""
 
-inherit ${@oe.utils.ifelse(use_sysvinit(d), 'update-rc.d', '')}
+inherit ${@pick_init(d)}
 
 TARGET_PRODUCT:ti33x = "ti335x_linux"
 TARGET_PRODUCT:ti43x = "ti437x_linux"
@@ -39,6 +48,8 @@ S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE += "DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} ${PACKAGECONFIG_CONFARGS}"
 
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
 do_install() {
     oe_runmake install
 }
-- 
2.49.0


