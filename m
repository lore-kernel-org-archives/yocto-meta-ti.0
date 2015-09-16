Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3AF05E00D36; Wed, 16 Sep 2015 05:15:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4944E00D22
	for <meta-ti@yoctoproject.org>; Wed, 16 Sep 2015 05:15:11 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8GCFBEv006334
	for <meta-ti@yoctoproject.org>; Wed, 16 Sep 2015 07:15:11 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8GCFAeW011794
	for <meta-ti@yoctoproject.org>; Wed, 16 Sep 2015 07:15:11 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 16 Sep 2015 07:15:11 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t8GCF9TS013636;	Wed, 16 Sep 2015 07:15:10 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 16 Sep 2015 08:15:05 -0400
Message-ID: <1442405706-27242-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1442405706-27242-1-git-send-email-j-stiffler@ti.com>
References: <1442405706-27242-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] ti-sysbios: Bump version to 6.42.02.29
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
X-List-Received-Date: Wed, 16 Sep 2015 12:15:15 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../bios/{ti-sysbios_6.41.04.54.bb => ti-sysbios_6.42.02.29.bb}   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename recipes-ti/bios/{ti-sysbios_6.41.04.54.bb => ti-sysbios_6.42.02.29.bb} (29%)

diff --git a/recipes-ti/bios/ti-sysbios_6.41.04.54.bb b/recipes-ti/bios/ti-sysbios_6.42.02.29.bb
similarity index 29%
rename from recipes-ti/bios/ti-sysbios_6.41.04.54.bb
rename to recipes-ti/bios/ti-sysbios_6.42.02.29.bb
index 1e24fe1..1abb496 100644
--- a/recipes-ti/bios/ti-sysbios_6.41.04.54.bb
+++ b/recipes-ti/bios/ti-sysbios_6.42.02.29.bb
@@ -1,12 +1,12 @@
 require ti-sysbios.inc
 
-PV = "6_41_04_54"
+PV = "6_42_02_29"
 PR = "r0"
 
-LIC_FILES_CHKSUM = "file://bios_${PV}_manifest.html;md5=95c3c6050fb23f2755ab75bf76805190"
+LIC_FILES_CHKSUM = "file://bios_${PV}_manifest.html;md5=ab905941085d55ea207fcb4cdab4f9c3"
 
-SRC_URI[sysbiosbin.md5sum] = "cbc53f2b15c2f70e2eaa05c1ed90b8db"
-SRC_URI[sysbiosbin.sha256sum] = "2b4fcb85af4c0abc46dadc925312b2a28906ec34db9b1500f0c484ee3fcb58cf"
+SRC_URI[sysbiosbin.md5sum] = "ba470b69d1ffa4a34fd05645f240216c"
+SRC_URI[sysbiosbin.sha256sum] = "eb070642e8ee8e742525599f53ef1547d6f5dded557987550c710ad193d0de31"
 
 TI_BIN_UNPK_CMDS=""
 TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
-- 
1.9.1


