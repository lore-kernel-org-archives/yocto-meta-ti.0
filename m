Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.1589.1622656928497714388
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 02 Jun 2021 11:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=knEEIt91;
 spf=none, err=permanent DNS error (domain: swubn01, ip: 198.47.19.141, mailfrom: a0490844@swubn01)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 152I1x6i022396;
	Wed, 2 Jun 2021 13:01:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1622656919;
	bh=KnT4SEuO4jBRX/cC5IsEtdmkgQRIvXYc+N7/pVq2zFw=;
	h=From:To:CC:Subject:Date;
	b=knEEIt91Yt+8vLPz1hl8iqmh6SfJ79xqbzSfH9RJ1CvB/B4on7b6RVTSPwOIV5fF5
	 HJkTOWTYYNQU2DwdNnVKhrsw3vOqsLoYgN4OvdNurVQ9Xq+eZ5J5wMFMEPnSwuWBWX
	 82/xXkI4iroX+Wea5Z9OVezpZ4wshB/uJe/Tnwp0=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 152I1xLL106352
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Jun 2021 13:01:59 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 2 Jun
 2021 13:01:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 2 Jun 2021 13:01:59 -0500
Received: from swubn01 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 152I1wGo117574;
	Wed, 2 Jun 2021 13:01:58 -0500
Received: from a0490844 by swubn01 with local (Exim 4.90_1)
	(envelope-from <a0490844@swubn01>)
	id 1loVBl-0001Dt-NW; Wed, 02 Jun 2021 23:31:57 +0530
From: a-m1@ti.com
To: <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <denis@denix.org>, Aparna M <a-m1@ti.com>
Subject: [meta-ti][meta-ti PATCH] ti-sci-fw: Install sysfw.itb in the deploy directory
Date: Wed, 2 Jun 2021 23:31:51 +0530
Message-ID: <20210602180151.4393-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

The sysfw.itb to be packaged by the installer is copied to the
prebuilt-images directory from the deploy directory. This
change installs the sysfw.itb in the deploy directory.

Signed-off-by: Aparna M <a-m1@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 87fdec68..fef87705 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -92,12 +92,11 @@ do_install_j7200-evm-k3r5() {
 	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
 }
 
-do_deploy_j7200-evm-k3r5() {
+do_deploy_append_j7200-evm-k3r5() {
 	install -d ${DEPLOYDIR}
 	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
 	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
 	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
-	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
 
 do_install_am64xx-evm-k3r5() {
@@ -107,12 +106,11 @@ do_install_am64xx-evm-k3r5() {
 	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
 }
 
-do_deploy_am64xx-evm-k3r5() {
+do_deploy_append_am64xx-evm-k3r5() {
 	install -d ${DEPLOYDIR}
 	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
 	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
 	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
-	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
 
 addtask deploy before do_build after do_compile
-- 
2.17.1

