Return-Path: <sabeeh-khan@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B658C27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 10:52:49 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.70171.1718967160191407685
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 21 Jun 2024 03:52:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=L/LW72JN;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: sabeeh-khan@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45LAqdKD094981
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Jun 2024 05:52:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718967159;
	bh=9qo/1QV+NZ6KKpaA4ajqKI+GNz4Ufs/Sz0qV+i1kjfI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=L/LW72JN9ETbeg9kYj/67+q70oYRoy4rHAvKKZrmHFl7d9m19Ktc1h2gwfDc8OQvi
	 qD4MK0PPzF3HvryRkh2+QCqjkgDRkWOYfKB/A9LKruqznrVeLj6SgDNSs4Q/4zy2uV
	 uQ1w4qhz3spggvWNr/qmqxsPleVLB228KfS7jPQg=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45LAqdEL010047
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Jun 2024 05:52:39 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Jun 2024 05:52:38 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Jun 2024 05:52:39 -0500
Received: from thinkstationp3.dhcp.ti.com (thinkstationp3.dhcp.ti.com [128.247.83.36])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45LAqciZ089126;
	Fri, 21 Jun 2024 05:52:38 -0500
From: Sabeeh Khan <sabeeh-khan@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Sabeeh Khan <sabeeh-khan@ti.com>
Subject: [master/scarthgap][PATCH 1/4] cc33conf: add new cc33conf tool for cc33xx devices
Date: Fri, 21 Jun 2024 05:52:18 -0500
Message-ID: <20240621105221.1648656-2-sabeeh-khan@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17793

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
index 00000000..096bf9bc
--- /dev/null
+++ b/meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Configuration utility for TI CC33xx wireless devices"
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


