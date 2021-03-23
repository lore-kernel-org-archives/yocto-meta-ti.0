Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.636.1616533073781942000
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 23 Mar 2021 13:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FdaAGhtq;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12NKvjch095887;
	Tue, 23 Mar 2021 15:57:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616533065;
	bh=C3LagvUM4DqZ516zMJAaFAYMn8mXfiO+jgVzNphVIII=;
	h=From:To:CC:Subject:Date;
	b=FdaAGhtqtTjrUN6hnaBnOtZ/vtsLsRRTPt43xt+ghF3QBGKcvywWJgFNTCz6VwewF
	 yrH1io90Nnck8GFsWn/Fwzz+R4BXdr4mSy/KQaqtkdbZkgbRgr08rZIq9XT29zMovn
	 JhJp5r33MeCBqXEPgw7F4djYot3n3gkD/eg6lwHs=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12NKvj6m122907
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 23 Mar 2021 15:57:45 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 23
 Mar 2021 15:57:45 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 23 Mar 2021 15:57:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12NKvj9B118152;
	Tue, 23 Mar 2021 15:57:45 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>, <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <nm@ti.com>
Subject: [dunfell/master] [PATCH] linux-ti-mainline: Add gmp-native as a kernel dependency
Date: Tue, 23 Mar 2021 15:57:45 -0500
Message-ID: <20210323205745.21086-1-nm@ti.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Dan Murphy <dmurphy@ti.com>

Add GNU Multiple Precision Arithmetic Library as a dependency for
mainline linux builds. These are necesary for kernel to handle gcc
plugins for builtins.h

Signed-off-by: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---
 recipes-kernel/linux/linux-ti-mainline_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kernel/linux/linux-ti-mainline_git.bb
index ed7607046186..41e852ba0e88 100644
--- a/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -9,6 +9,8 @@ DEFCONFIG_BUILDER = "${WORKDIR}/ti-upstream-tools/config/defconfig_builder.sh"
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/kernel-rdepends.inc
 
+DEPENDS += "gmp-native"
+
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
 S = "${WORKDIR}/git"
-- 
2.31.0

