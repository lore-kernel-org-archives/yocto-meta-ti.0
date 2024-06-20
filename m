Return-Path: <sabeeh-khan@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09ED9C27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 03:22:18 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.39356.1718853736630903423
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Jun 2024 20:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=F/yWJ+DT;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: sabeeh-khan@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45K3MGEM034628
	for <meta-ti@lists.yoctoproject.org>; Wed, 19 Jun 2024 22:22:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718853736;
	bh=9be1NxgGdC+sWmsDUmHh2mq8zjScCPBRvbFHQs3oqz8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=F/yWJ+DTOhs2bAg10qjnCW+0RgtWYMCIR4lMHJ/htBdbHP7ZWbIpojMKodHxyZ7xb
	 XRvp8Mnkx+CycBh9lvKJEb8lsACyElVaODSh9VKCnVucPSd438uL0LlcTHuYoNhHbO
	 xBi01FRdxBcTbO1VbgyR4dcEkCB5VwpOJ8+2B87c=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45K3MGDw031587
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 19 Jun 2024 22:22:16 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Jun 2024 22:22:15 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Jun 2024 22:22:15 -0500
Received: from thinkstationp3.dhcp.ti.com (thinkstationp3.dhcp.ti.com [128.247.83.36])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45K3MB63003124;
	Wed, 19 Jun 2024 22:22:15 -0500
From: Sabeeh Khan <sabeeh-khan@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Sabeeh Khan <sabeeh-khan@ti.com>
Subject: [RFC][master/scarthgap][PATCH 2/4] cc33calibrator: add new cc33calibrator tool for cc33xx devices
Date: Wed, 19 Jun 2024 22:22:00 -0500
Message-ID: <20240620032202.169122-3-sabeeh-khan@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17768

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
index 00000000..da2d0453
--- /dev/null
+++ b/meta-ti-extras/recipes-connectivity/cc33calibrator/cc33calibrator_git.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "The calibrator utility for TI wireless solution based on cc33xx driver"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d5fc448a36efe573623542dcb989afc4"
+
+SRCREV = "a2f84140b8d67cfc94472cf92676a409d1e47d86"
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


