Return-Path: <sabeeh-khan@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D65C2BBCA
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 10:52:49 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.70047.1718967162682004242
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 21 Jun 2024 03:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NmNev6Ms;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: sabeeh-khan@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45LAqgRc014540
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Jun 2024 05:52:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718967162;
	bh=tpovysuvxmte8Q62Qw10xC6nJC2CGIE+nDavaYUDz14=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NmNev6Ms+aLNqvrJ7Uq4W+muZfqrB/yI8u4ajvZFxW4lcxM93yOUVWBmZbwLcXWRJ
	 YUMiuv4hd1rR8QPCs1ffwFNG/yJ0Lh7BAwod0osPcC64fFecAvhDQ6eh5VvK+ket6a
	 vNI089jkbrAIZ66AR/i6yMeo2kU4WJ3vyAwVwak8=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45LAqg61002857
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Jun 2024 05:52:42 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Jun 2024 05:52:42 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Jun 2024 05:52:41 -0500
Received: from thinkstationp3.dhcp.ti.com (thinkstationp3.dhcp.ti.com [128.247.83.36])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45LAqcic089126;
	Fri, 21 Jun 2024 05:52:41 -0500
From: Sabeeh Khan <sabeeh-khan@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Sabeeh Khan <sabeeh-khan@ti.com>
Subject: [master/scarthgap][PATCH 4/4] cc33xx-target-scripts: add cc33xx scripts to control TI cc33xx WLAN device
Date: Fri, 21 Jun 2024 05:52:21 -0500
Message-ID: <20240621105221.1648656-5-sabeeh-khan@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17796

Add scripts and conf files to be used to control and configure
the cc33xx WLAN device. Documentation for these scripts can be found here:
https://www.ti.com/tool/CC33XX-SOFTWARE

Signed-off-by: Sabeeh Khan <sabeeh-khan@ti.com>
---
 .../cc33xx-target-scripts_git.bb              | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts_git.bb

diff --git a/meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts_git.bb b/meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts_git.bb
new file mode 100644
index 00000000..87f75653
--- /dev/null
+++ b/meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts_git.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Scripts and configuration files for TI cc33xx wireless drivers"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=904443cf7fae5c09c3d5f83f8557c265"
+
+SRCREV = "4371c93ea01b339f6f73f77d6d6bfcc185def8c0"
+SRC_URI = "git://git.ti.com/git/cc33xx-wlan/cc33xx-target-scripts.git;protocol=https;branch=master"
+
+S = "${WORKDIR}/git"
+
+FILES:${PN} += "${datadir}/cc33xx/"
+
+do_install() {
+	install -d ${D}${datadir}/cc33xx/
+
+	scripts=`find ./* -type f -name "*.*"`
+	for s in $scripts
+	do
+		install -m 0755 $s ${D}${datadir}/cc33xx/
+	done
+}
-- 
2.34.1


