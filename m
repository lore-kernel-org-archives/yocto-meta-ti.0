Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.17050.1579633102145989956
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Jan 2020 10:58:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=U1MFmP4v;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: d-huang@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00LIwLN6001991
	for <meta-ti@lists.yoctoproject.org>; Tue, 21 Jan 2020 12:58:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1579633101;
	bh=FG+K6N5F2IYrw68iJtoDutVToxoKu3xYDZqbanftc98=;
	h=From:To:CC:Subject:Date;
	b=U1MFmP4vDI4qS/g3jYQiiIslEvEtukszzMsuoFAvxIt1OTDTqcA9lq8aKlzkuFFqP
	 SmqixqMJZhCbbXjBM7u49/tyYZW8ByTkXUOA2elBQplF9JZw3hyudTPAqmjYG+K/XJ
	 paCtBxcGMMfQCi3DAH2mB4pYOJUa3UEZ7/vxpEMY=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00LIwLTa028975
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 21 Jan 2020 12:58:21 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 21
 Jan 2020 12:58:20 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 21 Jan 2020 12:58:20 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00LIwKUk023587;
	Tue, 21 Jan 2020 12:58:20 -0600
Received: from ulc0226152.dal.design.ti.com (ulc0226152.dhcp.ti.com [128.247.77.143])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id 00LIwK316528;
	Tue, 21 Jan 2020 12:58:20 -0600 (CST)
From: "David Huang" <d-huang@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <ajhernandez@ti.com>
CC: <angelabaker@ti.com>, <sunitan@ti.com>, David Huang <d-huang@ti.com>
Subject: [meta-ti][thud][PATCH] ti-img-encode-decode: Update SRCREV to latest
Date: Tue, 21 Jan 2020 12:56:53 -0600
Message-ID: <20200121185653.15419-1-d-huang@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: David Huang <d-huang@ti.com>

Pick up latest version of ti-img-encode-decode with improvements
to V4L2 decoder stream restart and slice map calculation, and
encoder performance profiling options.

Signed-off-by: David Huang <d-huang@ti.com>
---
 .../ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
index 87ed70a8c48c..86d954756600 100644
--- a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
+++ b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
@@ -4,12 +4,12 @@ LIC_FILES_CHKSUM = "file://driver/common/dq.c;beginline=1;endline=16;md5=e015e28
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "e"
+MACHINE_KERNEL_PR_append = "f"
 PR = "${MACHINE_KERNEL_PR}"
 
 COMPATIBLE_MACHINE = "j7-evm"
 
-SRCREV = "fe07667a9405f17f04f5d26de5b0ba0626fec807"
+SRCREV = "030e50dd0c53ec8e7825c85479ac3208925bb58d"
 
 EXTRA_OEMAKE = "KPATH=${STAGING_KERNEL_DIR} KCONF=${STAGING_KERNEL_BUILDDIR}"
 TARGET_CC_ARCH += "${LDFLAGS}"
-- 
2.17.1

