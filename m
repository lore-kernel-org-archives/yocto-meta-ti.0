Return-Path: <sabeeh-khan@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1771C27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 03:22:27 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.39357.1718853739033466958
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Jun 2024 20:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=U+VJBvfJ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: sabeeh-khan@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45K3MI42058201
	for <meta-ti@lists.yoctoproject.org>; Wed, 19 Jun 2024 22:22:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718853738;
	bh=/GZNVf5Qx5AeGfPaDGnx1ESADGBRsqbv1puLeijKI40=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=U+VJBvfJ0RQQxq+5sCjDxyNJRlL4JhlDRJCgMWcWa4Xoh5mb91dxqpkoyih+fTu6A
	 kcZ9k7X8PQk3/u+/N13RVMoM4tu1letDQjDdevoUZAYcu2RizYs+io1THlWi2fIzjG
	 /cqJ56kC11lBqrgFZC/jek3MAbJm6Cx3V3TmGhzo=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45K3MInM119109
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 19 Jun 2024 22:22:18 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Jun 2024 22:22:18 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Jun 2024 22:22:18 -0500
Received: from thinkstationp3.dhcp.ti.com (thinkstationp3.dhcp.ti.com [128.247.83.36])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45K3MB64003124;
	Wed, 19 Jun 2024 22:22:18 -0500
From: Sabeeh Khan <sabeeh-khan@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Sabeeh Khan <sabeeh-khan@ti.com>
Subject: [RFC][master/scarthgap][PATCH 3/4] cc33xx-fw: install cc33xx firmware
Date: Wed, 19 Jun 2024 22:22:01 -0500
Message-ID: <20240620032202.169122-4-sabeeh-khan@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17769

Download and install the cc33xx firmware and binaries
to be used with the cc33xx drivers.

FW Version: 1.7.0.120

Signed-off-by: Sabeeh Khan <sabeeh-khan@ti.com>
---
 .../recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb    | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb

diff --git a/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb b/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
new file mode 100644
index 00000000..152e3501
--- /dev/null
+++ b/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Firmware files for use with TI cc33xx"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=df68504cbd0a4da1643ebcfd5783dbc9"
+
+SRC_URI = " \
+	git://git.ti.com/git/cc33xx-wlan/cc33xx-fw.git;protocol=https;branch=${BRANCH} 
+"
+
+PV = "1.7.0.120"
+
+SRCREV = "988ded3a7d4d0e46de62e9ebfcb685c502bd9edf"
+BRANCH = "master"
+
+CLEANBROKEN = "1"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+    :
+}
+
+do_install() {
+    oe_runmake 'DEST_DIR=${D}' install
+}
+
+FILES:${PN} = "${nonarch_base_libdir}/firmware/ti-connectivity/*"
-- 
2.34.1


