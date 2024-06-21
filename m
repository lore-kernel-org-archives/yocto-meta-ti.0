Return-Path: <sabeeh-khan@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B523C2BD09
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 10:52:49 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.70046.1718967161849689709
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 21 Jun 2024 03:52:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JIyUMZcz;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: sabeeh-khan@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45LAqfm4014535
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Jun 2024 05:52:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718967161;
	bh=hrVHSKSun+10H68YMX9LXkyvnDtHpvqVUFsn9qq6Tuc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=JIyUMZcz3bPkkM8vYDhOSiVJWvwtzcXqN6EpvGcxTNK6VpQRamczi9Ei4eMN//70D
	 6OmHyfcup32PVOk3NEI/kuG+JuJY03esvR/fd9p1oUHGXja7MLjv5SrSqgZOdGX+UG
	 BNFLe1Ps5nXjkQdpjLAeWQsZHwSxcT4Jr07or7Ks=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45LAqf03002852
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Jun 2024 05:52:41 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Jun 2024 05:52:40 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Jun 2024 05:52:41 -0500
Received: from thinkstationp3.dhcp.ti.com (thinkstationp3.dhcp.ti.com [128.247.83.36])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45LAqcib089126;
	Fri, 21 Jun 2024 05:52:40 -0500
From: Sabeeh Khan <sabeeh-khan@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Sabeeh Khan <sabeeh-khan@ti.com>
Subject: [master/scarthgap][PATCH 3/4] cc33xx-fw: install cc33xx firmware
Date: Fri, 21 Jun 2024 05:52:20 -0500
Message-ID: <20240621105221.1648656-4-sabeeh-khan@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621105221.1648656-1-sabeeh-khan@ti.com>
References: <20240621105221.1648656-1-sabeeh-khan@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 21 Jun 2024 10:52:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17795

Download and install the cc33xx firmware and binaries
to be used with the cc33xx drivers.

FW Version: 1.7.0.120

Signed-off-by: Sabeeh Khan <sabeeh-khan@ti.com>
---
 .../recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb

diff --git a/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb b/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
new file mode 100644
index 00000000..9f1de766
--- /dev/null
+++ b/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Firmware files for use with TI cc33xx"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=df68504cbd0a4da1643ebcfd5783dbc9"
+
+SRCREV = "988ded3a7d4d0e46de62e9ebfcb685c502bd9edf"
+SRC_URI = "git://git.ti.com/git/cc33xx-wlan/cc33xx-fw.git;protocol=https;branch=master"
+
+PV = "1.7.0.120"
+
+CLEANBROKEN = "1"
+
+S = "${WORKDIR}/git"
+
+do_compile[no_exec] = "1"
+
+EXTRA_OEMAKE = "DEST_DIR=${D} BASE_LIB_DIR=${nonarch_base_libdir}"
+
+do_install() {
+    oe_runmake install
+}
+
+FILES:${PN} = "${nonarch_base_libdir}/firmware/ti-connectivity/*"
-- 
2.34.1


