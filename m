Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 11AA0E00902; Wed, 21 Jan 2015 21:34:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CCDB6E008EC
	for <meta-ti@yoctoproject.org>; Wed, 21 Jan 2015 21:34:33 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0M5YXCR026705
	for <meta-ti@yoctoproject.org>; Wed, 21 Jan 2015 23:34:33 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0M5YXuT030232
	for <meta-ti@yoctoproject.org>; Wed, 21 Jan 2015 23:34:33 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 21 Jan 2015 23:34:32 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0M5YW5m004770;	Wed, 21 Jan 2015 23:34:32 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 22 Jan 2015 00:34:30 -0500
Message-ID: <1421904870-21429-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] srss-tc: Add recipe for Smart reflex application
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
X-List-Received-Date: Thu, 22 Jan 2015 05:34:38 -0000
Content-Type: text/plain

- Provides Smart reflex temperature control with keystone devices

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/srss-tc/srss-tc_git.bb |   30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 recipes-bsp/srss-tc/srss-tc_git.bb

diff --git a/recipes-bsp/srss-tc/srss-tc_git.bb b/recipes-bsp/srss-tc/srss-tc_git.bb
new file mode 100644
index 0000000..79edbed
--- /dev/null
+++ b/recipes-bsp/srss-tc/srss-tc_git.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "TI Smart Reflex temperature control application for KeyStone II"
+HOMEPAGE = "http://git.ti.com/cgit/cgit.cgi/keystone-linux/srss-tc.git"
+LICENSE = "BSD & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2c17cd1dc60dc06a4c4f2a2c45472a51"
+COMPATIBLE_MACHINE = "keystone"
+
+PV = "1.0.0.0"
+
+BRANCH = "master"
+# This commit corresponds to tag DEV.SRSS-TC-01.00.00.00A
+SRCREV = "7aaf8308d7ba470144730275df12edae5007e07a"
+
+SRC_URI = "git://git.ti.com/keystone-linux/srss-tc.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+SRSS_BIN_NAME = "srss_tc.out"
+INITSCRIPT_NAME = "run_srss_tc.sh"
+INITSCRIPT_PARAMS = "defaults 10"
+
+inherit update-rc.d
+LDFLAGS += "-lrt"
+
+do_install() {
+	install -d ${D}${bindir}/
+	install -c -m 755 ${S}/src/${SRSS_BIN_NAME} ${D}${bindir}/${SRSS_BIN_NAME}
+
+	install -d ${D}${sysconfdir}/init.d/
+	install -c -m 755 ${S}/scripts/${INITSCRIPT_NAME} ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+}
-- 
1.7.9.5


