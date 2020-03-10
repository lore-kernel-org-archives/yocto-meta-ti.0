Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.1105.1583865190004845451
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Mar 2020 11:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hpIC9HgX;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7CCCDE0181A; Tue, 10 Mar 2020 11:33:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1B14AE01818
	for <meta-ti@yoctoproject.org>; Tue, 10 Mar 2020 11:33:07 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02AIX6MZ116321
	for <meta-ti@yoctoproject.org>; Tue, 10 Mar 2020 13:33:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583865186;
	bh=ZLWYASZq3IqXNdnxHnaT/ZBKNRQ5q2YQU74Ds1bdKQU=;
	h=From:To:Subject:Date;
	b=hpIC9HgXht1yXcuA4sC3ygmG7kete8w1YybN7kf+J5EWZJUhkk8oqLh2Yv7IdbeoL
	 42HXYaZimxEyed9uCSc3GzQRXGF4mTarpwVrSTenACGr1luvTbRHtx0SsQTKldPwSa
	 elN6p/cf2o0eGquzXlL+3lZZtdC/l+PBSvYFk1ZE=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02AIX6nr040882
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 10 Mar 2020 13:33:06 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 10
 Mar 2020 13:33:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 10 Mar 2020 13:33:06 -0500
Received: from UDA0875154.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02AIX6oC087024
	for <meta-ti@yoctoproject.org>; Tue, 10 Mar 2020 13:33:06 -0500
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [thud/master][PATCH v2] sciclient-rtos: SRCREV update, adding steps to generate sysfw.bin
Date: Tue, 10 Mar 2020 14:33:05 -0400
Message-ID: <20200310183305.39325-1-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

---
 recipes-bsp/sciclient/sciclient-rtos_git.bb | 41 +++++++++++++++++++--
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
index 6a3d79c3..efb369bb 100644
--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
+++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
@@ -7,14 +7,14 @@ TI_PDK_COMP = "ti.drv.sciclient"
 PE = "1"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://sciclient.h;beginline=1;endline=31;md5=7224b2eeca1444815f1737bfcdfa892a"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=99d7639a81c1ba1f16fd070a928ffddb"
 
 COMPATIBLE_MACHINE = "k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r0"
+PR = "r1"
 
-DEPENDS_append = " osal-rtos common-csl-ip-rtos"
+DEPENDS_append = " osal-rtos common-csl-ip-rtos openssl-native"
 
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
@@ -60,6 +60,41 @@ do_compile() {
     tar -cf sciclient.tar --exclude='*.tar' ./*
 }
 
+
+do_compile_prepend_am65xx-hs-evm() {
+
+    cd ${SCICLIENT_ROOTPATH}
+
+    # Saving the GP firmware to a different GP name
+    cp ${CP_ARGS} ./soc/V0/sysfw.bin ./soc/V0/sysfw-gp.bin
+    
+    cd ${SCICLIENT_ROOTPATH}/tools
+    # Create the .bin file for HS
+    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh am65x-hs ${PDK_INSTALL_DIR}/packages
+    cd -
+}
+
+do_compile_prepend_am65xx-evm() {
+
+    cd ${SCICLIENT_ROOTPATH}/tools
+
+    # Create the .bin file for GP, PG1
+    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh am65x ${PDK_INSTALL_DIR}/packages
+    # Create the .bin file for GP, PG2
+    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh am65x_pg2 ${PDK_INSTALL_DIR}/packages
+    
+    cd -
+}
+
+
+do_compile_prepend_j7-evm() {
+
+    cd ${SCICLIENT_ROOTPATH}/tools
+    # Create the .bin file for GP
+    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh j721e ${PDK_INSTALL_DIR}/packages
+    cd -
+}
+
 do_install() {
     cd ${SCICLIENT_ROOTPATH}
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/sciclient
-- 
2.17.1

