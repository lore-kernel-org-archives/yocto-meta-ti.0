Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.16905.1583350439769332304
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Mar 2020 11:34:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=RYAyQHbm;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nikhil.nd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 024JXxTK116983;
	Wed, 4 Mar 2020 13:33:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583350439;
	bh=+/iJhxm43nU+ZkoUL6/jTUCSTWQ9P9q8dfFTb0vMTV0=;
	h=From:To:CC:Subject:Date;
	b=RYAyQHbmo8giAptgvwQbnNmnIRJffoaK1eSXqQ608nAs8KE+7lhouuVVvfNDA3Ruj
	 Q65qKQYZbkubC3Gi68F054oNj17lMP6dT557mdWwy/4+2TFpD4poV45/8g9vJIMZgy
	 u6AAZX3Kuk17u8PgTEOaCIP+Kzo2XoynsI7em8aA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 024JXxGf063759
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Mar 2020 13:33:59 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Mar
 2020 13:33:58 -0600
Received: from localhost.localdomain (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 4 Mar 2020 13:33:58 -0600
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 024JXuTV052767;
	Wed, 4 Mar 2020 13:33:57 -0600
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: <denys@ti.com>
CC: <meta-ti@yoctoproject.org>, <meta-ti@lists.yoctoproject.org>,
        Nikhil
 Devshatwar <nikhil.nd@ti.com>
Subject: [meta-ti][zeus PATCH v1 1/2] recipes-bsp: jailhouse: Update tty for j7-evm jailhouse
Date: Thu, 5 Mar 2020 01:03:46 +0530
Message-ID: <20200304193347.15094-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Nikhil Devshatwar <nikhil.nd@ti.com>

Latest upstream jailhouse uses ttyS3 as the console for
inmate cell. Update the recipe to pass the correct cmdline.

Override only for j7-evm

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 recipes-kernel/jailhouse/jailhouse_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
index a4ee2fc7..1273c57d 100644
--- a/recipes-kernel/jailhouse/jailhouse_git.bb
+++ b/recipes-kernel/jailhouse/jailhouse_git.bb
@@ -59,7 +59,8 @@ INITRAMFS_IMAGE ?= ""
 JH_RAMFS_IMAGE ?= "${INITRAMFS_IMAGE}"
 
 JH_CMDLINE ?= ""
-JH_CMDLINE_k3 ?= "console=ttyS1,115200n8"
+JH_CMDLINE_am65xx ?= "console=ttyS1,115200n8"
+JH_CMDLINE_j7-evm ?= "console=ttyS3,115200n8"
 
 do_configure() {
 	if [ -d ${STAGING_DIR_HOST}/${CELLCONF_DIR} ]; 
-- 
2.17.1

