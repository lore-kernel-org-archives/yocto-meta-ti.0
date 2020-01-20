Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.14887.1579543872994145415
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Jan 2020 10:11:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=UV1IlXNW;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: j-stiffler@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00KIBCT5064719
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Jan 2020 12:11:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1579543872;
	bh=4R3Wree3kG9xvVMCBgERtWuMd3rOdQmNRebUj+eeghk=;
	h=From:To:CC:Subject:Date;
	b=UV1IlXNWD9cVt5sA4JMaFvgO/R+tK6OsrRGAzIkCrsmG6L6RGMVDMqhYQvFSmvTe1
	 sPrHzVi7vmlecX52/sWcdssCyr5xBY6QQVWnBStGtCpLZ2S/aq0pNso3jqjWHcwZKS
	 ku/DfzeojSovQRg3U/8POKq+AP6iG1QFWWZMLORI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00KIBCu7092175
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Jan 2020 12:11:12 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 20
 Jan 2020 12:11:11 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 20 Jan 2020 12:11:11 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00KIBBib015405;
	Mon, 20 Jan 2020 12:11:11 -0600
From: "Jacob Stiffler" <j-stiffler@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Jacob Stiffler <j-stiffler@ti.com>
Subject: [thud/master][PATCH] ti-pdk-fetch: hard-link .git directory into workdir
Date: Mon, 20 Jan 2020 12:52:09 -0500
Message-ID: <1579542729-29110-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Link the git directory into the recipe's work directory to provide
git history and commit information for recipes that may need it.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 classes/ti-pdk-fetch.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
index 117e54f..d4c32ab 100644
--- a/classes/ti-pdk-fetch.bbclass
+++ b/classes/ti-pdk-fetch.bbclass
@@ -3,7 +3,7 @@ TI_PDK_GIT_BRANCH ?= "release/PROCESSOR-SDK_06.02.00"
 TI_PDK_GIT_PROTOCOL ?= "git"
 TI_PDK_SRCREV ?= "2357d1436f1b2c3b5f1d0c9c94e045d33b63f3fe"
 
-TI_PDK_VERSION ?= "2019.12.2"
+TI_PDK_VERSION ?= "2019.12.3"
 
 PV = "${TI_PDK_VERSION}"
 
@@ -32,6 +32,9 @@ python do_unpack_append() {
 
         # Recursively hard-link the sources
         shutil.copytree(src, s, copy_function=os.link)
+
+        # Recursively hard-link the git directory
+        shutil.copytree(os.path.join(d.getVar('TI_PDK_SOURCE'),'.git'), os.path.join(s,'.git'), copy_function=os.link)
 }
 
 # Make sure that ti-pdk-source is unpacked before we set up the hardlinks.
-- 
2.7.4

