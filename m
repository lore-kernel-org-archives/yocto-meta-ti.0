Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CBD72E008F6; Fri, 16 Jan 2015 10:20:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 97414E008D7
	for <meta-ti@yoctoproject.org>; Fri, 16 Jan 2015 10:20:23 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0GIKMdd003282
	for <meta-ti@yoctoproject.org>; Fri, 16 Jan 2015 12:20:22 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0GIKMLb012781
	for <meta-ti@yoctoproject.org>; Fri, 16 Jan 2015 12:20:22 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 Jan 2015 12:20:22 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0GIKMIE018465;	Fri, 16 Jan 2015 12:20:22 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 16 Jan 2015 13:20:20 -0500
Message-ID: <1421432420-32358-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] traceframework: Add recipe for TI trace framework library
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
X-List-Received-Date: Fri, 16 Jan 2015 18:20:30 -0000
Content-Type: text/plain

- Provide libraries and test code for trace framework.
- Support framework to stream data from producer to multiple consumers
- Supports devices K2H, K2K, K2E, K2L & c6614

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/traceframework/traceframework_git.bb |   48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 recipes-bsp/traceframework/traceframework_git.bb

diff --git a/recipes-bsp/traceframework/traceframework_git.bb b/recipes-bsp/traceframework/traceframework_git.bb
new file mode 100644
index 0000000..3211dea
--- /dev/null
+++ b/recipes-bsp/traceframework/traceframework_git.bb
@@ -0,0 +1,48 @@
+DESCRIPTION = "TI Trace Framework library"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/instrumentation/traceframework/COPYING.txt;md5=e8f6789acdcda76d02ed9203fc2e603d"
+
+BRANCH="master"
+SRC_URI = "git://git.ti.com/keystone-rtos/traceframework.git;destsuffix=git/ti/instrumentation/traceframework;protocol=git;branch=${BRANCH}"
+
+# Below commit ID corresponds to DEV.TFWK-01.01.01.06A
+SRCREV = "bd87f53f4d12dc802bcc5609afb7994643e40cb9"
+PV = "01.01.01.06"
+
+COMPATIBLE_MACHINE = "(tci6614-evm|keystone)"
+DEPENDS = "cuia"
+
+DEVICELIST = ""
+DEVICELIST_append_tci6614-evm = "c6614"
+DEVICELIST_append_keystone    = "k2k k2h k2e k2l"
+
+PACKAGES =+ "${PN}-test"
+
+FILES_${PN}-test = "${bindir}/tfw*.out \
+                    ${bindir}/*.txt"
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/instrumentation/traceframework"
+
+EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} \
+                 CUIA_INSTALL_DIR=${STAGING_INCDIR} CUIA_LIB_DIR=${STAGING_LIBDIR}"
+
+do_compile () {
+#   making the library
+	oe_runmake clean
+	oe_runmake lib
+
+#   make the test application
+	for device in ${DEVICELIST}
+	do
+		oe_runmake tests DEVICE="$device" TFW_INC_DIR=${BASEDIR} TFW_SRC_DIR=${S} \
+			TARGET_ROOT_DIR=${D}
+	done
+}
+
+do_install() {
+	for device in ${DEVICELIST}
+	do
+		oe_runmake install DEVICE="$device" TFW_SRC_DIR=${S} TARGET_ROOT_DIR=${D}
+	done
+}
-- 
1.7.9.5


