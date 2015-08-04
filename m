Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 598C3E00A92; Tue,  4 Aug 2015 08:17:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 92C9FE009C5
	for <meta-ti@yoctoproject.org>; Tue,  4 Aug 2015 08:17:13 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t74FHDRe020079
	for <meta-ti@yoctoproject.org>; Tue, 4 Aug 2015 10:17:13 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t74FHDRt010827
	for <meta-ti@yoctoproject.org>; Tue, 4 Aug 2015 10:17:13 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 4 Aug 2015 10:17:13 -0500
Received: from udc0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t74FHC7G003784;	Tue, 4 Aug 2015 10:17:13 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 4 Aug 2015 11:17:10 -0400
Message-ID: <1438701430-32517-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v3] ti-sysbios: Update version to 6.41.04.54
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
X-List-Received-Date: Tue, 04 Aug 2015 15:17:15 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../{ti-sysbios_6.41.02.41.bb => ti-sysbios_6.41.04.54.bb}     | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename recipes-ti/bios/{ti-sysbios_6.41.02.41.bb => ti-sysbios_6.41.04.54.bb} (27%)

diff --git a/recipes-ti/bios/ti-sysbios_6.41.02.41.bb b/recipes-ti/bios/ti-sysbios_6.41.04.54.bb
similarity index 27%
rename from recipes-ti/bios/ti-sysbios_6.41.02.41.bb
rename to recipes-ti/bios/ti-sysbios_6.41.04.54.bb
index ccc6ad1..1e24fe1 100644
--- a/recipes-ti/bios/ti-sysbios_6.41.02.41.bb
+++ b/recipes-ti/bios/ti-sysbios_6.41.04.54.bb
@@ -1,12 +1,12 @@
 require ti-sysbios.inc
 
-PV = "6_41_02_41"
-PR = "r1"
+PV = "6_41_04_54"
+PR = "r0"
 
-LIC_FILES_CHKSUM = "file://bios_${PV}_manifest.html;md5=a4af75ec6d586c5267c71075eebff418"
+LIC_FILES_CHKSUM = "file://bios_${PV}_manifest.html;md5=95c3c6050fb23f2755ab75bf76805190"
 
-SRC_URI[sysbiosbin.md5sum] = "65deff27110c2af87a3c71fea3c0345e"
-SRC_URI[sysbiosbin.sha256sum] = "2c47b4a3aa9513d10e5811a8ac7ed1d6ce3d13df57a0bffe10d8cabaf228c76f"
+SRC_URI[sysbiosbin.md5sum] = "cbc53f2b15c2f70e2eaa05c1ed90b8db"
+SRC_URI[sysbiosbin.sha256sum] = "2b4fcb85af4c0abc46dadc925312b2a28906ec34db9b1500f0c484ee3fcb58cf"
 
 TI_BIN_UNPK_CMDS=""
 TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
-- 
1.9.1


