Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0FC02E00836; Mon, 26 Jan 2015 10:24:07 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 68452E006AF
	for <meta-ti@yoctoproject.org>; Mon, 26 Jan 2015 10:24:05 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 268C352A23; Mon, 26 Jan 2015 18:24:05 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150126182405.268C352A23@arago-project.org>
Date: Mon, 26 Jan 2015 18:24:05 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : srss-tc: Add recipe for Smart reflex application
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
X-List-Received-Date: Mon, 26 Jan 2015 18:24:07 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ef551169016a3d1d0e6423f6d529d3875003763a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ef551169016a3d1d0e6423f6d529d3875003763a

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Thu Jan 22 11:34:30 2015 +0000

srss-tc: Add recipe for Smart reflex application

- Provides Smart reflex temperature control with keystone devices

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/srss-tc/srss-tc_git.bb |   30 ++++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

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


