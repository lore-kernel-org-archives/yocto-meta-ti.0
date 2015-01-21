Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8487AE0089B; Wed, 21 Jan 2015 12:38:06 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A97A6E008F6
	for <meta-ti@yoctoproject.org>; Wed, 21 Jan 2015 12:38:00 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 44825529E0; Wed, 21 Jan 2015 20:38:00 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150121203800.44825529E0@arago-project.org>
Date: Wed, 21 Jan 2015 20:38:00 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : traceframework: Add recipe for TI trace framework library
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
X-List-Received-Date: Wed, 21 Jan 2015 20:38:06 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 47b1d13a6e7875ce7df3dae94b89b240d3762774
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=47b1d13a6e7875ce7df3dae94b89b240d3762774

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Sat Jan 17 00:20:20 2015 +0000

traceframework: Add recipe for TI trace framework library

- Provide libraries and test code for trace framework.
- Support framework to stream data from producer to multiple consumers
- Supports devices K2H, K2K, K2E, K2L & c6614

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/traceframework/traceframework_git.bb |   48 ++++++++++++++++++++++
 1 files changed, 48 insertions(+), 0 deletions(-)

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


