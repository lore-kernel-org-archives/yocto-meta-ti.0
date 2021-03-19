Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.137.1616171580011273458
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Mar 2021 09:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XigcKuMq;
 spf=none, err=permanent DNS error (domain: swubn03, ip: 198.47.19.141, mailfrom: a0221627@swubn03)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12JGWwpY072774
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Mar 2021 11:32:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616171578;
	bh=s2kqX2B4bJSeKEHxUQS2mAvTX2co+JD/kwhX4TPHM+w=;
	h=From:To:CC:Subject:Date;
	b=XigcKuMqzBm3xdPGXN2moQcwk18rS6qOTZxS8FiJpuZCqv/94wE/PfgNkZP33CZNX
	 E1qpSUWkzkFEVMSDemqpgyem4G5dAtBKdbe/VHG3vgqgUrePphUKEO+pzNFFbZhAB4
	 3JyF/iuF24R/OrFhPgjQ+x8qWhtyOLYeCQ2Ql9eg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12JGWwuV057123
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Mar 2021 11:32:58 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 19
 Mar 2021 11:32:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 19 Mar 2021 11:32:58 -0500
Received: from swubn03 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12JGWvLm030421;
	Fri, 19 Mar 2021 11:32:57 -0500
Received: from a0221627 by swubn03 with local (Exim 4.90_1)
	(envelope-from <a0221627@swubn03>)
	id 1lNI3U-0001Pc-Pd; Fri, 19 Mar 2021 22:02:56 +0530
From: l-weaver@ti.com
To: <meta-ti@lists.yoctoproject.org>
CC: <nikhil.nd@ti.com>, <praneeth@ti.com>, Lucas Weaver <l-weaver@ti.com>
Subject: [meta-ti][dunfell/master][PATCH] ti-sci-fw: Update J7200 deploy to install ti-sci-fw
Date: Fri, 19 Mar 2021 22:02:52 +0530
Message-ID: <20210319163252.5249-1-l-weaver@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Lucas Weaver <l-weaver@ti.com>

Update J7200 deploy to install ti-sci-fw

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

