Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.5893.1634799884326586229
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 00:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=zNJn3jaF;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19L74gCh014669;
	Thu, 21 Oct 2021 02:04:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634799882;
	bh=2EgRoD67a42ETty7OMvvf5m+cnj/DG6P5JvCE70DT5U=;
	h=From:To:Subject:Date;
	b=zNJn3jaFTrx7Lv/wHAyL8t7NzkX4rP8g3+ZXX/67N8KnvGMRXoax0MDymUXKzysHb
	 5LHv0TzBo6PetXeDSGYVpYlMuS/+VcvUZu2g+YKP+wq59pVODnKMrgNR5a18zSx90J
	 /WzARjyD3/y+qN7YRNQ38ZcKJJyddaxhf755OcUc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19L74ga7074790
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Oct 2021 02:04:42 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 21
 Oct 2021 02:04:42 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 21 Oct 2021 02:04:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19L74fGe061096;
	Thu, 21 Oct 2021 02:04:41 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2] ti-sci-fw_git: Fix issue with using gp*.bin for TISCI firmware
Date: Thu, 21 Oct 2021 07:04:41 +0000
Message-ID: <20211021070441.37565-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

With ti-sysfs also hosting *gp-cert.bin for am64x hs-fs breaks gp.
This patch removes * to directly reference the TISCI firmware

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---

Change from v1:
Previous version caused issue with the HS platforms.
Added conditional statement for HS device.

 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index ca56e1de..a1a7446b 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -27,8 +27,9 @@ SYSFW_PREFIX_j7-hs-evm-k3r5 = "ti-fs-firmware"
 SYSFW_SUFFIX ?= "unknown"
 
 SYSFW_BASE = "${SYSFW_PREFIX}-${SYSFW_SOC}-${SYSFW_SUFFIX}"
+SYSFW_BASE_append = "${@['','*']['${SYSFW_SUFFIX}' == 'hs']}"
 
-SYSFW_TISCI = "${S}/ti-sysfw/${SYSFW_BASE}*.bin"
+SYSFW_TISCI = "${S}/ti-sysfw/${SYSFW_BASE}.bin"
 
 SYSFW_BINARY = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
 SYSFW_VBINARY = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-- 
2.17.1

