Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8C7C7E00D58; Wed, 16 Sep 2015 05:15:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1DEB8E00D31
	for <meta-ti@yoctoproject.org>; Wed, 16 Sep 2015 05:15:12 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8GCFCg4027564
	for <meta-ti@yoctoproject.org>; Wed, 16 Sep 2015 07:15:12 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8GCFChS006392
	for <meta-ti@yoctoproject.org>; Wed, 16 Sep 2015 07:15:12 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 16 Sep 2015 07:15:12 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t8GCF9TT013636;	Wed, 16 Sep 2015 07:15:11 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 16 Sep 2015 08:15:06 -0400
Message-ID: <1442405706-27242-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1442405706-27242-1-git-send-email-j-stiffler@ti.com>
References: <1442405706-27242-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] ti-framework-components: Bump version to 3.40.01.04
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
X-List-Received-Date: Wed, 16 Sep 2015 12:15:17 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 ...nts_3.40.00.02.bb => ti-framework-components_3.40.01.04.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename recipes-ti/framework-components/{ti-framework-components_3.40.00.02.bb => ti-framework-components_3.40.01.04.bb} (30%)

diff --git a/recipes-ti/framework-components/ti-framework-components_3.40.00.02.bb b/recipes-ti/framework-components/ti-framework-components_3.40.01.04.bb
similarity index 30%
rename from recipes-ti/framework-components/ti-framework-components_3.40.00.02.bb
rename to recipes-ti/framework-components/ti-framework-components_3.40.01.04.bb
index 78f764d..61c5a98 100644
--- a/recipes-ti/framework-components/ti-framework-components_3.40.00.02.bb
+++ b/recipes-ti/framework-components/ti-framework-components_3.40.01.04.bb
@@ -1,9 +1,9 @@
 require ti-framework-components.inc
 
-PV = "3_40_00_02"
-PR = "r1"
+PV = "3_40_01_04"
+PR = "r0"
 
-LIC_FILES_CHKSUM = "file://framework_components_${PV}_Manifest.html;md5=e3ce0b3e17175b7200f346d0c6dbbcc6"
+LIC_FILES_CHKSUM = "file://framework_components_${PV}_Manifest.html;md5=806c3e4afd3bfbf7e5dc400ed1a0cc3c"
 
-SRC_URI[fctarball.md5sum] = "f66cb201582e1f407b92501d64738047"
-SRC_URI[fctarball.sha256sum] = "91b0e571b8760e51e4683b44ce13ff3d2f6deb39b204e09894c30514f10c60db"
+SRC_URI[fctarball.md5sum] = "0e6b61cb6e1ad8b249d64f041c872192"
+SRC_URI[fctarball.sha256sum] = "eb38002092a7fc8f704fe9ea9de7f29108bc2533ba95f184706b2936dd24711c"
-- 
1.9.1


