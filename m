Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.429.1586014561990737463
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 04 Apr 2020 08:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JkTy0sZr;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: sam.nelson@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 034Fa1TJ071802
	for <meta-ti@lists.yoctoproject.org>; Sat, 4 Apr 2020 10:36:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1586014561;
	bh=ZoTnQ55CHMZfMgFDvae/mjtuxR9O+4hooDxMSjK2J/E=;
	h=From:To:CC:Subject:Date;
	b=JkTy0sZrM3FHC4yP8TzbA/CfTP3tKxS321aAqQq5HZHg/+GrdCKLdK2X57UnHlLG0
	 f8Yyn4w1tqHuY3AQFtlVYImrhX0HgQjgPco64OspTAqiVz00mY7CqrqdpQL10aQUjZ
	 nv1UXsytpwYoA1WY1xBjLrU2EigWftyl6qupzjeI=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 034Fa1e5118732
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Sat, 4 Apr 2020 10:36:01 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sat, 4 Apr
 2020 10:36:00 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sat, 4 Apr 2020 10:36:00 -0500
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 034Fa013119620;
	Sat, 4 Apr 2020 10:36:00 -0500
From: "Sam Nelson" <sam.nelson@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: "m-radhakrishnan2@ti.com" <m-radhakrishnan2@ti.com>,
        Sam Nelson
	<sam.nelson@ti.com>
Subject: [meta-ti][thud][PATCH] sciclient-rtos: Updating License checksum, along with the file it is calculated
Date: Sat, 4 Apr 2020 11:35:57 -0400
Message-ID: <1586014557-23871-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: "m-radhakrishnan2@ti.com" <m-radhakrishnan2@ti.com>

The license as such has not changed, but moved to a License file which
is not expected to change frequently

NOTE: Backporting this from zeus branch

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/sciclient/sciclient-rtos_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
index d14c4a1..43d7586 100644
--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
+++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
@@ -7,12 +7,12 @@ TI_PDK_COMP = "ti.drv.sciclient"
 PE = "1"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://sciclient.h;beginline=1;endline=31;md5=7224b2eeca1444815f1737bfcdfa892a"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=99d7639a81c1ba1f16fd070a928ffddb"
 
 COMPATIBLE_MACHINE = "k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS_append = " osal-rtos common-csl-ip-rtos openssl-native"
 
-- 
1.9.1

