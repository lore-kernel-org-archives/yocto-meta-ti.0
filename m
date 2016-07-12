Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 97B97E007E8; Tue, 12 Jul 2016 06:39:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D3A05E0077E
	for <meta-ti@yoctoproject.org>; Tue, 12 Jul 2016 06:39:29 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u6CDdSAB014249
	for <meta-ti@yoctoproject.org>; Tue, 12 Jul 2016 08:39:28 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u6CDdSGL012536
	for <meta-ti@yoctoproject.org>; Tue, 12 Jul 2016 08:39:28 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 12 Jul 2016 08:39:28 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u6CDdRv8026608;	Tue, 12 Jul 2016 08:39:28 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 12 Jul 2016 09:38:50 -0400
Message-ID: <1468330730-606-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ti-framework-components: update to version 3.40.02.07
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jul 2016 13:39:32 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 ...onents_3.40.01.04.bb => ti-framework-components_3.40.02.07.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename recipes-ti/framework-components/{ti-framework-components_3.40.01.04.bb => ti-framework-components_3.40.02.07.bb} (33%)

diff --git a/recipes-ti/framework-components/ti-framework-components_3.40.01.04.bb b/recipes-ti/framework-components/ti-framework-components_3.40.02.07.bb
similarity index 33%
rename from recipes-ti/framework-components/ti-framework-components_3.40.01.04.bb
rename to recipes-ti/framework-components/ti-framework-components_3.40.02.07.bb
index 61c5a98..56c0028 100644
--- a/recipes-ti/framework-components/ti-framework-components_3.40.01.04.bb
+++ b/recipes-ti/framework-components/ti-framework-components_3.40.02.07.bb
@@ -1,9 +1,9 @@
 require ti-framework-components.inc
 
-PV = "3_40_01_04"
+PV = "3_40_02_07"
 PR = "r0"
 
-LIC_FILES_CHKSUM = "file://framework_components_${PV}_Manifest.html;md5=806c3e4afd3bfbf7e5dc400ed1a0cc3c"
+LIC_FILES_CHKSUM = "file://framework_components_${PV}_Manifest.html;md5=0dd131dd53300f517b14dba8824f8b0a"
 
-SRC_URI[fctarball.md5sum] = "0e6b61cb6e1ad8b249d64f041c872192"
-SRC_URI[fctarball.sha256sum] = "eb38002092a7fc8f704fe9ea9de7f29108bc2533ba95f184706b2936dd24711c"
+SRC_URI[fctarball.md5sum] = "36dd2312ea8d70aa2ae0a05a24dbf54e"
+SRC_URI[fctarball.sha256sum] = "69082a0f86d12c24b39a1293ec35cf8007b850479898d5ae485ec1e8cf2e8c72"
-- 
2.7.4


