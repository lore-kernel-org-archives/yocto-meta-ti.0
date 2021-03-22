Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1366.1616429238448257492
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Mar 2021 09:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=OAOHppy3;
 spf=none, err=permanent DNS error (domain: swubn03, ip: 198.47.19.141, mailfrom: a0221627@swubn03)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12MG7H7q048512
	for <meta-ti@lists.yoctoproject.org>; Mon, 22 Mar 2021 11:07:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616429237;
	bh=H4YBW7ZNVXX3uax2hU0luG7keVl4osk7ikcBvpQfwpA=;
	h=From:To:CC:Subject:Date;
	b=OAOHppy3fhtRKrnY6+3n0kIbtd/peuUZLXB4h7K95mzvQn5omxRUrNY3f48EZOqZJ
	 jeyC07dKny7gW4qeR4sfGy0cRaAtVrM6a4ynW4Kk4ZU2MHTWu+tpHV+DRXPDBVddoh
	 gQZRnT5Tw4K8QqSjgJKkeUTS3orN3YqjL2jGIBf4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12MG7H8l102709
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 22 Mar 2021 11:07:17 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 22
 Mar 2021 11:07:16 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 22 Mar 2021 11:07:16 -0500
Received: from swubn03 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12MG7FJb057075;
	Mon, 22 Mar 2021 11:07:16 -0500
Received: from a0221627 by swubn03 with local (Exim 4.90_1)
	(envelope-from <a0221627@swubn03>)
	id 1lON5H-0000yR-6K; Mon, 22 Mar 2021 21:37:15 +0530
From: l-weaver@ti.com
To: <meta-ti@lists.yoctoproject.org>
CC: <nikhil.nd@ti.com>, <praneeth@ti.com>, Lucas Weaver <l-weaver@ti.com>
Subject: [meta-ti][dunfell/master][PATCH v2] ti-sci-fw: Update J7200 deploy to install ti-sci-fw
Date: Mon, 22 Mar 2021 21:37:06 +0530
Message-ID: <20210322160706.3304-1-l-weaver@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Lucas Weaver <l-weaver@ti.com>

The J7200 ti-sci-fw needs to be installed in the deploy
directory so that it can be packaged in Processor SDK bundle

This is required because the ti-sci-fw is needed in the
installer prebuilt-images in order to build the combined boot
image for J7200

Signed-off-by: Lucas Weaver <l-weaver@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index e7580a57..25fac359 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -99,6 +99,7 @@ do_deploy_j7200-evm-k3r5() {
 	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
 	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
 	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
+	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
 
 do_install_am64xx-evm-k3r5() {
-- 
2.17.1

