Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 105E9E0084E; Tue,  7 Oct 2014 04:36:52 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5B28E007C1
	for <meta-ti@yoctoproject.org>; Tue,  7 Oct 2014 04:36:49 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s97BamXI016469
	for <meta-ti@yoctoproject.org>; Tue, 7 Oct 2014 06:36:48 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s97BamJR002250
	for <meta-ti@yoctoproject.org>; Tue, 7 Oct 2014 06:36:48 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 7 Oct 2014 06:36:48 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s97BalIc004561;	Tue, 7 Oct 2014 06:36:47 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 7 Oct 2014 07:36:44 -0400
Message-ID: <1412681805-27235-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2 1/2] common-csl-ip: (ti-csl) Moved from meta-arago and renamed
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
X-List-Received-Date: Tue, 07 Oct 2014 11:36:52 -0000
Content-Type: text/plain

- Moved from meta-arago ( where it was called ti-csl_git.bb)
  http://arago-project.org/git/?p=meta-arago.git;a=blob_plain;f=meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb;hb=HEAD
- Renamed it to common-csl-ip_git.bb
- This package provides chip support library interface files

---
Changes from previous version of patch
-Add comments on renaming and original url attached
- rename to common-csl-ip_git.bb
---

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/common-csl-ip/common-csl-ip_git.bb |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip_git.bb

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
new file mode 100644
index 0000000..fb5e6f8
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "TI CSL"
+LICENSE = "TI BSD"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
+
+COMPATIBLE_MACHINE = "keystone"
+ALLOW_EMPTY_${PN} = "1"
+
+PR = "r0"
+BRANCH="master"
+SRC_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git;protocol=git;branch=${BRANCH}"
+# commit ID corresponds to DEV.CSL_KEYSTONE2.02.00.00.17
+SRCREV = "f6f90144c14e1ee783c4b893b52e54830be8166e" 
+
+S = "${WORKDIR}/git"
+
+do_install () {
+    install -d ${D}${includedir}/ti/csl
+    find . -name "*.h" -type f | xargs -I {} cp --parents {} ${D}${includedir}/ti/csl 
+    find ./src/ip/serdes_sb/V0 -name "*.c" -type f | xargs -I {} cp --parents {} ${D}${includedir}/ti/csl
+}
+
-- 
1.7.9.5


