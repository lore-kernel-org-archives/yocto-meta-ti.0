Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.111.1579798765288284003
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Jan 2020 08:59:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=dbX7KxXk;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: d-huang@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00NGxOMe045597
	for <meta-ti@lists.yoctoproject.org>; Thu, 23 Jan 2020 10:59:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1579798764;
	bh=U+adLd6njo2ZBg19IubUM29lChMiB3USiuRbF4PWwvY=;
	h=From:To:CC:Subject:Date;
	b=dbX7KxXk2uDGYt9GRTQQnXhVvm9RI0sbOnhkjgigiptXi97FdSLq0rYZIZuznwIPK
	 PCbV9bzvBNvO01ZvFXYHjmvEKTs2ulyI/zEvSYJmGygwoeB8es3Jh4sM0hIAxgcmJY
	 omYtqCngrab628VvS1orsIT7XT8ASMX4m/fVN9nI=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00NGxOv9086182
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 23 Jan 2020 10:59:24 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 23
 Jan 2020 10:59:24 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 23 Jan 2020 10:59:24 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00NGxNCv090039;
	Thu, 23 Jan 2020 10:59:23 -0600
Received: from ulc0226152.dal.design.ti.com (ulc0226152.dhcp.ti.com [128.247.77.143])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id 00NGxN323453;
	Thu, 23 Jan 2020 10:59:23 -0600 (CST)
From: "David Huang" <d-huang@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <ajhernandez@ti.com>
CC: <angelabaker@ti.com>, <sunitan@ti.com>, David Huang <d-huang@ti.com>
Subject: [meta-ti][thud][PATCH] ti-img-encode-decode: Update SRCREV to latest
Date: Thu, 23 Jan 2020 10:58:56 -0600
Message-ID: <20200123165856.26907-1-d-huang@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: David Huang <d-huang@ti.com>

Pick up latest version of ti-img-encode-decode recipe
with Makefiles using instead of hard coding
aarch64-linux-gnu as the cross compiler.

Signed-off-by: David Huang <d-huang@ti.com>
---
 .../ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
index 86d954756600..a1da9585e368 100644
--- a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
+++ b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
@@ -4,12 +4,12 @@ LIC_FILES_CHKSUM = "file://driver/common/dq.c;beginline=1;endline=16;md5=e015e28
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "f"
+MACHINE_KERNEL_PR_append = "g"
 PR = "${MACHINE_KERNEL_PR}"
 
 COMPATIBLE_MACHINE = "j7-evm"
 
-SRCREV = "030e50dd0c53ec8e7825c85479ac3208925bb58d"
+SRCREV = "0eba3678300f649e49f03d92d1b624cf0e008008"
 
 EXTRA_OEMAKE = "KPATH=${STAGING_KERNEL_DIR} KCONF=${STAGING_KERNEL_BUILDDIR}"
 TARGET_CC_ARCH += "${LDFLAGS}"
-- 
2.17.1

