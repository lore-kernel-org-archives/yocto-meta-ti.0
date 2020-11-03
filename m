Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.5630.1604416850577184859
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 Nov 2020 07:20:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ALCuLlU2;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A3FKnox013179
	for <meta-ti@lists.yoctoproject.org>; Tue, 3 Nov 2020 09:20:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604416849;
	bh=pbsZFapEbuwct/g4rEFd4YtwLxMa8QFV8iSy9re/dy8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ALCuLlU2eHvtm1GAfm959usVvWOEzm0nwN9GZW0maTdfg/Tytilxzt4mQjI0QhOco
	 qnSUd5weixstXVyXnz7HHGGYh/RPOilPaHf01ARwIhilK7P2O+jTyNmaZw7MSq7O+M
	 ba6jBd3cVaz/VFgdw7niueRT4gAJMlX+ztktc0g0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A3FKnIf002326
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 3 Nov 2020 09:20:49 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 3 Nov
 2020 09:20:49 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 3 Nov 2020 09:20:49 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A3FKn2O007169;
	Tue, 3 Nov 2020 09:20:49 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [meta-ti] [dunfell/master] PATCH 2/2] linux-ti-staging: Update kernel to 5.4.74
Date: Tue, 3 Nov 2020 09:20:43 -0600
Message-ID: <20201103152043.27734-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201103152043.27734-1-dmurphy@ti.com>
References: <20201103152043.27734-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.4.bb | 4 ++--
 recipes-kernel/linux/linux-ti-staging_5.4.bb    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
index 6a05aeaa632f..de1b4b7d9c27 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
 
 BRANCH = "ti-rt-linux-5.4.y"
 
-SRCREV = "0343656e0feca050ec3f6a0a47fc65018d5a7fd1"
-PV = "5.4.70+git${SRCPV}"
+SRCREV = "d4b0f63810a64c5f5c9876ba3492b647553d385d"
+PV = "5.4.74+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index 489568b78de8..416776abbd93 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -21,8 +21,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.4.y"
 
-SRCREV = "05b5a584edd4f87bc81874f4d0ad0b7b0c31875b"
-PV = "5.4.70+git${SRCPV}"
+SRCREV = "9574bba32a1898794895ca3816e815154c80226d"
+PV = "5.4.74+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
-- 
2.28.0.585.ge1cfff676549

