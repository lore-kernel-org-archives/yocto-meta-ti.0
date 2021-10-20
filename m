Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.3842.1634705542231483525
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 21:52:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KIKCUuUd;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19K4qKOm047557;
	Tue, 19 Oct 2021 23:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634705540;
	bh=zSRZi2pma/otFY0pFCvBGLwgPTjN1El+2vUtgCGZfP0=;
	h=From:To:Subject:Date;
	b=KIKCUuUdMbGaBvIHc2EodrQzlIx+peJdduzAMS32znXgENOPuQFawQBf+wK1+MJy9
	 LAnRdkyKuGGF7HtUJ0clhpz6g3KtJYQ/XXiFsqGyVHygmMlZaGXzbzM8OpUzfvXBqx
	 zKYGzfniUZWGckVJdvywD82IlYQ1k3nFsx192F7g=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19K4qK44056346
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Oct 2021 23:52:20 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Oct 2021 23:52:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Oct 2021 23:52:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19K4qK9K099834;
	Tue, 19 Oct 2021 23:52:20 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH] ti-sci-fw_git: Fix issue with using gp*.bin for TISCI firmware
Date: Wed, 20 Oct 2021 04:52:20 +0000
Message-ID: <20211020045220.49228-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

With ti-sysfs also hosting *gp-cert.bin for am64x hs-fs breaks gp.
This patch removes * to directly reference the TISCI firmware

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index ca56e1de..ef242476 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -28,7 +28,7 @@ SYSFW_SUFFIX ?= "unknown"
 
 SYSFW_BASE = "${SYSFW_PREFIX}-${SYSFW_SOC}-${SYSFW_SUFFIX}"
 
-SYSFW_TISCI = "${S}/ti-sysfw/${SYSFW_BASE}*.bin"
+SYSFW_TISCI = "${S}/ti-sysfw/${SYSFW_BASE}.bin"
 
 SYSFW_BINARY = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
 SYSFW_VBINARY = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-- 
2.17.1

