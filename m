Return-Path: <sabeeh-khan@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2681C41513
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 03:22:27 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.39358.1718853741061505647
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Jun 2024 20:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nUZiNQEz;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: sabeeh-khan@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45K3MKgv034636
	for <meta-ti@lists.yoctoproject.org>; Wed, 19 Jun 2024 22:22:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718853740;
	bh=XUsNTyhdyOWJuwMRGnY9x5QZmqMrkEt3kpfiFIJBwXA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nUZiNQEzizvMqptT6cIWqw8GgJKX1ThJdLglrNaqLP5Ssm59wLaIaRFuY6jtGGlIB
	 gVDHe7AFsiAVFby/aR4HoRS2OOQwxOFC1RABJjuCLRXddI3Ee5zx8NZqSezzd6JieL
	 5OJK+IntPkeVKt231/+/Zgp1aMxLkZwRCaeJjMmE=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45K3MKHX006780
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 19 Jun 2024 22:22:20 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Jun 2024 22:22:20 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Jun 2024 22:22:20 -0500
Received: from thinkstationp3.dhcp.ti.com (thinkstationp3.dhcp.ti.com [128.247.83.36])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45K3MB65003124;
	Wed, 19 Jun 2024 22:22:20 -0500
From: Sabeeh Khan <sabeeh-khan@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Sabeeh Khan <sabeeh-khan@ti.com>
Subject: [RFC][master/scarthgap][PATCH 4/4] cc33xx-target-scripts: add cc33xx scripts to control TI cc33xx WLAN device
Date: Wed, 19 Jun 2024 22:22:02 -0500
Message-ID: <20240620032202.169122-5-sabeeh-khan@ti.com>
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
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Jun 2024 03:22:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17770

Add scripts and conf files to be used to control and configure
the cc33xx WLAN device. Documentation for these scripts can be found here:
https://www.ti.com/tool/CC33XX-SOFTWARE

Signed-off-by: Sabeeh Khan <sabeeh-khan@ti.com>
---
 .../cc33xx-target-scripts.bb                  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts.bb

diff --git a/meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts.bb b/meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts.bb
new file mode 100644
index 00000000..2f13f911
--- /dev/null
+++ b/meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Scripts and configuration files for TI cc33xx wireless drivers"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=904443cf7fae5c09c3d5f83f8557c265"
+
+SRCREV = "4371c93ea01b339f6f73f77d6d6bfcc185def8c0"
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/git/cc33xx-wlan/cc33xx-target-scripts.git;protocol=https;branch=${BRANCH} \
+"
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


