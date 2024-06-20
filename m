Return-Path: <sabeeh-khan@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D5C3C2BA18
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 03:22:18 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.39353.1718853734524160529
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Jun 2024 20:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pH+Gb47J;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: sabeeh-khan@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45K3MD1a051680
	for <meta-ti@lists.yoctoproject.org>; Wed, 19 Jun 2024 22:22:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718853733;
	bh=v80n/+Qd1dMTJgC0PT6glZsWMhN3Oc/PRZ9snY87UZg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pH+Gb47JnG50MQqR3huNk0y7TmO+rmDPgFyZT1y/DpZMtwAQq9oy8U377TCrVBViw
	 INYkKMfqhOcJtPuumX28ah8kGJ8ocLj6SyKY5oaBpiRBDL1DKVs+eauXqy/pxmb8Jo
	 pFCwGofiKQBwlodd/julo3hVo41TPutaA60TSPXQ=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45K3MDlN006795
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 19 Jun 2024 22:22:13 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Jun 2024 22:22:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Jun 2024 22:22:13 -0500
Received: from thinkstationp3.dhcp.ti.com (thinkstationp3.dhcp.ti.com [128.247.83.36])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45K3MB62003124;
	Wed, 19 Jun 2024 22:22:13 -0500
From: Sabeeh Khan <sabeeh-khan@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Sabeeh Khan <sabeeh-khan@ti.com>
Subject: [RFC][master/scarthgap][PATCH 1/4] cc33conf: add new cc33conf tool for cc33xx devices
Date: Wed, 19 Jun 2024 22:21:59 -0500
Message-ID: <20240620032202.169122-2-sabeeh-khan@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620032202.169122-1-sabeeh-khan@ti.com>
References: <20240620032202.169122-1-sabeeh-khan@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Jun 2024 03:22:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17767

cc33conf is a tool provided by TI to configure
cc33xx WLAN devices. It can be used to change
the RF parameters and other features of the target.
Documentation for this tool is provided within the following link:
https://www.ti.com/tool/CC33XX-SOFTWARE

Signed-off-by: Sabeeh Khan <sabeeh-khan@ti.com>
---
 .../cc33conf/cc33conf_git.bb                  | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb

diff --git a/meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb b/meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb
new file mode 100644
index 00000000..1e4faa77
--- /dev/null
+++ b/meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "Configuration utility for TI CC33xx wireless devices"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d5fc448a36efe573623542dcb989afc4"
+
+SRCREV = "a2f84140b8d67cfc94472cf92676a409d1e47d86"
+SRC_URI = "git://git.ti.com/git/cc33xx-wlan/cc33xx-utils.git;branch=master;protocol=https"
+
+PV = "1.7.0.120"
+
+S = "${WORKDIR}/git/cc33conf"
+
+EXTRA_OEMAKE = "CC="${CC}""
+
+do_install() {
+	install -d ${D}${sbindir}
+	install -d ${D}${sbindir}/cc33conf/
+
+	install -m 0755 cc33xxconf ${D}${sbindir}/cc33conf/
+	install -m 0755 dictionary.txt ${D}${sbindir}/cc33conf/
+	install -m 0755 default.conf ${D}${sbindir}/cc33conf/
+	install -m 0755 README ${D}${sbindir}/cc33conf/
+	install -m 0755 cc33xx-conf.conf ${D}${sbindir}/cc33conf/
+	install -m 0755 cc33xx-conf.ini ${D}${sbindir}/cc33conf/
+	install -m 0755 conf.h ${D}${sbindir}/cc33conf/
+}
+
+FILES:${PN} += " \
+	${sbindir}/cc33conf \
+"
-- 
2.34.1


