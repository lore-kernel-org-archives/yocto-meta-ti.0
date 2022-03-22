Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BED4C4167B
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 16:25:33 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.12148.1647966331713934069
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 09:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ir895Q+F;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MGPUba102044;
	Tue, 22 Mar 2022 11:25:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647966330;
	bh=XqYd3P0BzLU+5DKd20cWTl2F8ljC/PVIXjJs5i6eXd8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ir895Q+FU6nUIRP+VMu7qVsCHXWSNvQfRBrPGmXz486cJYCeoJEdONEfUJWOwq1se
	 ueM4oSeGz9NozHQ5NuOJ1pA37nSWVJae/m3uMpIPeO/OOip20K8LqtSL3qYPq4Y6Qp
	 0twkUGfA4ZDEhvhAB6xMUM/+0usTdqI/iP+AB8XM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MGPU8u089918
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 11:25:30 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 11:25:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 11:25:30 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MGPUBD116427;
	Tue, 22 Mar 2022 11:25:30 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nWhK5-00040L-TS; Tue, 22 Mar 2022 11:25:29 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 07/11] recipes-bsp: tifs-lpm-stub: Introduce
 new recipe
Date: Tue, 22 Mar 2022 11:25:24 -0500
Message-ID: <20220322162528.15298-8-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220322162528.15298-1-reatmon@ti.com>
References: <20220322162528.15298-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Mar 2022 16:25:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14515

From: Nikhil Devshatwar <nikhil.nd@ti.com>

This firmware stub is required by the TI foundational security
software while transitioning to low power mode.

Add a recipe for this compatible with am62xx-evm

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../tifs-lpm-stub/tifs-lpm-stub_git.bb        | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb

diff --git a/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb b/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
new file mode 100644
index 00000000..bc341035
--- /dev/null
+++ b/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
@@ -0,0 +1,21 @@
+SUMMARY = "TI Foundational security Low Power Management Stub"
+
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
+
+PV = "v2021.09a"
+
+COMPATIBLE_MACHINE = "am62xx-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+S = "${WORKDIR}/git"
+TARGET = "ti-fs-stub-firmware-am62x-gp.signed.bin"
+
+do_install() {
+	install -d ${D}${base_libdir}/firmware/ti-sysfw/
+	install -m 0644 ${S}/ti-sysfw/${TARGET} ${D}${base_libdir}/firmware/ti-sysfw/${TARGET}
+}
+
+FILES_${PN} = "${base_libdir}/firmware"
-- 
2.17.1


