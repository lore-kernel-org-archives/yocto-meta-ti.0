Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 92B36E0088B; Mon,  7 Mar 2016 10:36:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24484E0077F
	for <meta-ti@yoctoproject.org>; Mon,  7 Mar 2016 10:36:17 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u27IaHfS012310
	for <meta-ti@yoctoproject.org>; Mon, 7 Mar 2016 12:36:17 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u27IaHiR015617
	for <meta-ti@yoctoproject.org>; Mon, 7 Mar 2016 12:36:17 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 7 Mar 2016 12:36:16 -0600
Received: from a0756824local.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u27IaGDd028029;	Mon, 7 Mar 2016 12:36:16 -0600
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 7 Mar 2016 13:36:13 -0500
Message-ID: <1457375774-27214-1-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH v2 1/2] ti-sysbios: Update to 6.45.01.29
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
X-List-Received-Date: Mon, 07 Mar 2016 18:36:20 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
V2 Changes: Removed old version and submitted with -C01 so new version is detected as copy of old

 .../{ti-sysbios_6.42.02.29.bb => ti-sysbios_6.45.01.29.bb}   |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename recipes-ti/bios/{ti-sysbios_6.42.02.29.bb => ti-sysbios_6.45.01.29.bb} (23%)

diff --git a/recipes-ti/bios/ti-sysbios_6.42.02.29.bb b/recipes-ti/bios/ti-sysbios_6.45.01.29.bb
similarity index 23%
rename from recipes-ti/bios/ti-sysbios_6.42.02.29.bb
rename to recipes-ti/bios/ti-sysbios_6.45.01.29.bb
index 1abb496..6ab4e27 100644
--- a/recipes-ti/bios/ti-sysbios_6.42.02.29.bb
+++ b/recipes-ti/bios/ti-sysbios_6.45.01.29.bb
@@ -1,12 +1,12 @@
-require ti-sysbios.inc
+require recipes-ti/bios/ti-sysbios.inc
 
-PV = "6_42_02_29"
+PV = "6_45_01_29"
 PR = "r0"
 
-LIC_FILES_CHKSUM = "file://bios_${PV}_manifest.html;md5=ab905941085d55ea207fcb4cdab4f9c3"
+LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=dbcd89745f1745f24ace8171a96ed493"
 
-SRC_URI[sysbiosbin.md5sum] = "ba470b69d1ffa4a34fd05645f240216c"
-SRC_URI[sysbiosbin.sha256sum] = "eb070642e8ee8e742525599f53ef1547d6f5dded557987550c710ad193d0de31"
+SRC_URI[sysbiosbin.md5sum] = "16cf6dc3c5cc9d2b877fa7d81dd12150"
+SRC_URI[sysbiosbin.sha256sum] = "efaf5f1d725f3fd06e45476109b1124c74c16c39c870d12929e071047c3e5a22"
 
 TI_BIN_UNPK_CMDS=""
 TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
-- 
1.7.10.4


