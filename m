Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.720.1616533413562249835
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 23 Mar 2021 14:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VBBW1Ct6;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12NL3Tm4098785;
	Tue, 23 Mar 2021 16:03:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616533409;
	bh=Bcz6LuYZc7IFchMSMYatyd/LG7wAKqU6/lVnoBZU1vU=;
	h=From:To:CC:Subject:Date;
	b=VBBW1Ct6wJva5zHTeNl23lg2IShgknV9vTWqHSv6+CDp0AP6ScWPuhA4uQmH59xjX
	 fE0bwJSduvIm0JeK5jdHylpd/Jn76JZZOUBYqwljazohkdJnMXViKRGMuTJEFBiSsM
	 0sbTaQM8LnYgP7ANsI25MvqIIAsbOCl06zIzFmJ4=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12NL3TOh029064
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 23 Mar 2021 16:03:29 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 23
 Mar 2021 16:03:29 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 23 Mar 2021 16:03:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12NL3Tc8016651;
	Tue, 23 Mar 2021 16:03:29 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>, <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <nm@ti.com>
Subject: [dunfell/master][PATCH] linux-ti-mainline: Set the branch for the ti-upstream-tools repo
Date: Tue, 23 Mar 2021 16:03:29 -0500
Message-ID: <20210323210329.22634-1-nm@ti.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Dan Murphy <dmurphy@ti.com>

ti-upstream-tools[1] repository carries the overlays and defconfig
fragments that we don't wish to overload upstream kernel community with.
The reason for that being these are constantly on churn as our test
coverage increases etc. Currently we reuse the "BRANCH" variable to also
matchup with kernel and ti-upstream-tools repositories as well.

This can tend to be a little painful if we decide to start testing
various kernel configurations - RT etc.. So, lets just split out the
TOOLS_BRANCH separated from the branch we use for kernel. Even though
the branch remains the exact same at this point.

[1] https://git.ti.com/cgit/ti-linux-kernel/ti-upstream-tools/

Signed-off-by: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---
 recipes-kernel/linux/linux-ti-mainline_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kernel/linux/linux-ti-mainline_git.bb
index 41e852ba0e88..19c091e81e79 100644
--- a/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -16,6 +16,7 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 S = "${WORKDIR}/git"
 
 BRANCH = "master"
+TOOLS_BRANCH = "master"
 
 # 5.11 Mainline version
 SRCREV = "f40ddce88593482919761f74910f42f4b84c004b"
@@ -29,7 +30,7 @@ KERNEL_GIT_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g
 KERNEL_GIT_PROTOCOL = "git"
 SRC_URI += " \
     ${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH};name=linux \
-    git://git.ti.com/ti-linux-kernel/ti-upstream-tools.git;protocol=${KERNEL_GIT_PROTOCOL};name=ti-upstream-tools;destsuffix=ti-upstream-tools \
+    git://git.ti.com/ti-linux-kernel/ti-upstream-tools.git;branch=${TOOLS_BRANCH};protocol=${KERNEL_GIT_PROTOCOL};name=ti-upstream-tools;destsuffix=ti-upstream-tools \
     file://defconfig \
 "
 
-- 
2.31.0

