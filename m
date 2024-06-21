Return-Path: <sabeeh-khan@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCF2C2BA1A
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 10:52:49 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.70045.1718967160897552089
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 21 Jun 2024 03:52:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pX5R+f/n;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: sabeeh-khan@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45LAqe24089910
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Jun 2024 05:52:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718967160;
	bh=Nf4tsiWYbHVxz43RUiVYVXNJ5aQp7KXXhTrU2CqqvYI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pX5R+f/now9GyT0nIKy7ly6EgVYm02U4c1pv9S0PVQVxKfl31N/a3acuqWpB57gA7
	 PWPrOMV+6l6UT1PMC9fnbRsmk4NRlnWZws3fcN2O6Dzf3g4YSVVJAKId6a3Z96ldrp
	 BHQQKIeTS0hyLjOauPkYgpMEf5I0t9SZNUkCqO4Q=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45LAqeC8025962
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Jun 2024 05:52:40 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Jun 2024 05:52:40 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Jun 2024 05:52:40 -0500
Received: from thinkstationp3.dhcp.ti.com (thinkstationp3.dhcp.ti.com [128.247.83.36])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45LAqcia089126;
	Fri, 21 Jun 2024 05:52:40 -0500
From: Sabeeh Khan <sabeeh-khan@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Sabeeh Khan <sabeeh-khan@ti.com>
Subject: [master/scarthgap][PATCH 2/4] cc33calibrator: add new cc33calibrator tool for cc33xx devices
Date: Fri, 21 Jun 2024 05:52:19 -0500
Message-ID: <20240621105221.1648656-3-sabeeh-khan@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17794

cc33calibrator is a tool provided by TI to manually control the
radio frontend of the cc33xx device. This tool can also be used
for production line testing of the radio.
Documentation for this tool is provided within the following link:
https://www.ti.com/tool/CC33XX-SOFTWARE

Signed-off-by: Sabeeh Khan <sabeeh-khan@ti.com>
---
 .../cc33calibrator/cc33calibrator_git.bb      | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-ti-extras/recipes-connectivity/cc33calibrator/cc33calibrator_git.bb

diff --git a/meta-ti-extras/recipes-connectivity/cc33calibrator/cc33calibrator_git.bb b/meta-ti-extras/recipes-connectivity/cc33calibrator/cc33calibrator_git.bb
new file mode 100644
index 00000000..cd5b7dc5
--- /dev/null
+++ b/meta-ti-extras/recipes-connectivity/cc33calibrator/cc33calibrator_git.bb
@@ -0,0 +1,24 @@
+SUMMARY = "The calibrator utility for TI wireless solution based on cc33xx driver"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d5fc448a36efe573623542dcb989afc4"
+
+SRCREV = "89d7e55b40972cbfc84f0734c35a7a6b4f7f5b31"
+SRC_URI = "git://git.ti.com/git/cc33xx-wlan/cc33xx-utils.git;branch=master;protocol=https"
+
+PV = "1.0.0.50"
+
+DEPENDS = "libnl"
+
+S = "${WORKDIR}/git/cc33calibrator"
+
+export CROSS_COMPILE = "${TARGET_PREFIX}"
+
+EXTRA_OEMAKE = "CFLAGS="${CFLAGS} -I${STAGING_INCDIR}/libnl3/ -DCONFIG_LIBNL32 " \
+		LDFLAGS="${LDFLAGS} -L${STAGING_LIBDIR}" \
+		CC="${CC}" \
+		NLVER=3"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 cc33calibrator ${D}${bindir}/
+}
-- 
2.34.1


