Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.19357.1582541684611758016
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Feb 2020 02:54:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mexy7GXp;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nikhil.nd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01OAshuO130442;
	Mon, 24 Feb 2020 04:54:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582541683;
	bh=BINdNXqnaLL7SnWW1iTKUTpZWs1azW7a33xurakCgEc=;
	h=From:To:CC:Subject:Date;
	b=mexy7GXpf0Spskl8Ql3BR7L6Lqm1Jrs+5rPk+hMKleMPM1NNYozc+aegVt5PCYDCp
	 aXmroRBTvy/OgqDI8r40+BdKVLRMMX2UG0qu0hZXUX8lWtk9qahXB3b3Yrm4/GkeLh
	 26ixpow7qqH6Ob2ZmCS/zecPHl3eZhLDEcDgPo7E=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01OAshjF062703
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Feb 2020 04:54:43 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 24
 Feb 2020 04:54:43 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 24 Feb 2020 04:54:43 -0600
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01OAsfft047253;
	Mon, 24 Feb 2020 04:54:41 -0600
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: <denys@ti.com>
CC: <meta-ti@yoctoproject.org>, <meta-ti@lists.yoctoproject.org>,
        Nikhil
 Devshatwar <nikhil.nd@ti.com>
Subject: [meta-ti][zeus PATCH v2] recipes-kernel: jailhose: Update to 0.12 version
Date: Mon, 24 Feb 2020 16:24:37 +0530
Message-ID: <20200224105437.27936-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Nikhil Devshatwar <nikhil.nd@ti.com>

Jailhouse 0.12 does not need to define custom config flags.
Remove the steps to copy the config from do_configure task

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---

Notes:
    Changes from v1:
    * Fixed build error with do_configure

 recipes-kernel/jailhouse/jailhouse_git.bb | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
index 4186dc3a..a4ee2fc7 100644
--- a/recipes-kernel/jailhouse/jailhouse_git.bb
+++ b/recipes-kernel/jailhouse/jailhouse_git.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = " \
     file://COPYING;md5=9fa7f895f96bde2d47fd5b7d95b6ba4d \
 "
 
-PV = "0.10+git${SRCPV}"
-SRCREV = "b3a68ac89d7ed955546eae91954b184ec1583ce3"
-BRANCH = "ti-jailhouse-0.10"
+PV = "0.12+git${SRCPV}"
+SRCREV = "92db71f257fabd3c08fa4b99498fa61a41ea831d"
+BRANCH = "ti-jailhouse-0.12"
 
 SRC_URI = " \
     git://git.ti.com/jailhouse/ti-jailhouse.git;protocol=git;branch=${BRANCH} \
@@ -40,9 +40,6 @@ CELL_DIR ?= "${JH_DATADIR}/cells"
 CELLCONF_DIR ?= "${JH_DATADIR}/configs"
 INMATES_DIR ?= "${JH_DATADIR}/inmates"
 
-JH_CONFIG ?= "${S}/ci/jailhouse-config-x86.h"
-JH_CONFIG_k3 ?= "${S}/ci/jailhouse-config-k3.h"
-
 JH_CELL_FILES ?= "*.cell"
 JH_CELL_FILES_k3 ?= "k3-*.cell"
 
@@ -69,8 +66,6 @@ do_configure() {
 	then
 		cp ${STAGING_DIR_HOST}/${CELLCONF_DIR}/*.c ${S}/configs/
 	fi
-
-	cp -av ${JH_CONFIG} ${S}/include/jailhouse/config.h
 }
 
 USER_SPACE_CFLAGS = '${CFLAGS} -DLIBEXECDIR=\\\"${libexecdir}\\\" \
-- 
2.17.1

