Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.10360.1616511844873432850
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 23 Mar 2021 08:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LTYUKKMv;
 spf=none, err=permanent DNS error (domain: swubn03, ip: 198.47.19.142, mailfrom: a0221627@swubn03)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12NF4330101443
	for <meta-ti@lists.yoctoproject.org>; Tue, 23 Mar 2021 10:04:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616511843;
	bh=2Az02wQ2KOwL/DfT5ZnStUFQ6cG3BXYXqEv7zf5lIpc=;
	h=From:To:CC:Subject:Date;
	b=LTYUKKMv4M9KuB+RmnnfkW2B/6AruJECCR9LQwe1uNDbIQ+ChR9eMohS55UVoujiA
	 lEw1T4I1NP54J6RGeM6kECH57E8NTIAXvjRRC6AL3V6TsCPn7LFGPykyt6OFFEAnq/
	 EBBaL7LlDUI9yEf4vhanomtVBjp8shk2t9vz6Cmo=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12NF434a071473
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 23 Mar 2021 10:04:03 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 23
 Mar 2021 10:04:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 23 Mar 2021 10:04:03 -0500
Received: from swubn03 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12NF42se083896;
	Tue, 23 Mar 2021 10:04:03 -0500
Received: from a0221627 by swubn03 with local (Exim 4.90_1)
	(envelope-from <a0221627@swubn03>)
	id 1lOiZd-00022j-VN; Tue, 23 Mar 2021 20:34:02 +0530
From: "Weaver, Lucas" <l-weaver@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <nikhil.nd@ti.com>, <praneeth@ti.com>, <shiju@ti.com>,
        Lucas Weaver
	<l-weaver@ti.com>
Subject: [meta-ti][dunfell/master][PATCH v3] ti-sci-fw: Update J7200/AM64 deploy to install ti-sci-fw
Date: Tue, 23 Mar 2021 20:33:48 +0530
Message-ID: <20210323150348.7304-1-l-weaver@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Lucas Weaver <l-weaver@ti.com>

The J7200/AM64 ti-sci-fw needs to be installed in the deploy
directory so that it can be packaged in Processor SDK bundle

This is required because the ti-sci-fw is needed in the
installer prebuilt-images in order to build the combined boot
image for J7200/AM64

Signed-off-by: Lucas Weaver <l-weaver@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index e7580a57..e6fa460c 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -99,6 +99,7 @@ do_deploy_j7200-evm-k3r5() {
 	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
 	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
 	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
+	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
 
 do_install_am64xx-evm-k3r5() {
@@ -113,6 +114,7 @@ do_deploy_am64xx-evm-k3r5() {
 	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
 	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
 	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
+	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
 
 do_install_am64xx-sk-k3r5() {
@@ -127,6 +129,7 @@ do_deploy_am64xx-sk-k3r5() {
 	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
 	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
 	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
+	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
 
 addtask deploy before do_build after do_compile
-- 
2.17.1

