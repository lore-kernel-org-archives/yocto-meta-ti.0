Received: from spamalot.elettra.eu (spamalot.elettra.eu [140.105.206.208])
 by mx.groups.io with SMTP id smtpd.web08.7226.1607191318161269196
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 05 Dec 2020 10:01:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: elettra.eu, ip: 140.105.206.208, mailfrom: alessio.bogani@elettra.eu)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost (Email Security Appliance) with ESMTP id 1A30A440F70_FCBCB11B
	for <meta-ti@lists.yoctoproject.org>; Sat,  5 Dec 2020 18:01:53 +0000 (GMT)
Received: from unknown-host
	by spamalot.elettra.eu with queue id 871429
	for meta-ti@lists.yoctoproject.org; Sat, 05 Dec 2020 18:01:52 GMT
Received: from pc-bogani.elettra.trieste.it (pc-bogani.elettra.trieste.it [192.168.205.85])
	by spamalot.elettra.eu (Sophos Email Appliance) with ESMTP id B75DF43E432_FCBCB10F;
	Sat,  5 Dec 2020 18:01:52 +0000 (GMT)
From: "Alessio Igor Bogani" <alessio.bogani@elettra.eu>
To: meta-ti@lists.yoctoproject.org
Cc: Alessio Igor Bogani <alessio.bogani@elettra.eu>
Subject: [PATCH] Remove a 32bit binary
Date: Sat,  5 Dec 2020 19:01:50 +0100
X-Mailer: git-send-email 2.17.1
X-SASI-RCODE: 200
Message-Id: <20201205180153.1A30A440F70_FCBCB11B@spamalot.elettra.eu>

Make nativesdk-ti-cgt-pru installable removing a file which is the
uninstaller (useless anyway) and avoid this errors:
https://lists.yoctoproject.org/g/meta-ti/message/13301

Signed-off-by: Alessio Igor Bogani <alessio.bogani@elettra.eu>
---
 recipes-ti/devtools/ti-cgt-pru_2.3.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb b/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
index ed10e272..de21794e 100644
--- a/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
+++ b/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
@@ -28,6 +28,7 @@ do_install() {
     install -d ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}
     cp -r ${S}/ti-cgt-pru_${PV}/. \
           ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}/
+    rm -f ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}/ti_cgt_pru_${PV}_uninstaller.run
 }
 
 do_install_class-target() {
-- 
2.17.1

