Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 023A7E00B49; Thu, 18 Dec 2014 15:38:35 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 54F07E009B3
	for <meta-ti@yoctoproject.org>; Thu, 18 Dec 2014 15:38:30 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id sBINcTH0001253
	for <meta-ti@yoctoproject.org>; Thu, 18 Dec 2014 17:38:29 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBINcTt3011648
	for <meta-ti@yoctoproject.org>; Thu, 18 Dec 2014 17:38:29 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 18 Dec 2014 17:38:29 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	sBINcR3Q014137;	Thu, 18 Dec 2014 17:38:29 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 18 Dec 2014 18:38:26 -0500
Message-ID: <1418945906-17216-2-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1418945906-17216-1-git-send-email-sam.nelson@ti.com>
References: <1418945906-17216-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] sa-lld: Add recipes for SA module low level driver
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
X-List-Received-Date: Thu, 18 Dec 2014 23:38:35 -0000
Content-Type: text/plain

- Provides library and test code for Security accelerator module
- Supports k2h, k2k, k2l & k2e devices

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/sa-lld/sa-lld-test_git.bb |   33 +++++++++++++++++++++++++++++++++
 recipes-bsp/sa-lld/sa-lld.inc         |   14 ++++++++++++++
 recipes-bsp/sa-lld/sa-lld_git.bb      |   14 ++++++++++++++
 3 files changed, 61 insertions(+)
 create mode 100644 recipes-bsp/sa-lld/sa-lld-test_git.bb
 create mode 100644 recipes-bsp/sa-lld/sa-lld.inc
 create mode 100644 recipes-bsp/sa-lld/sa-lld_git.bb

diff --git a/recipes-bsp/sa-lld/sa-lld-test_git.bb b/recipes-bsp/sa-lld/sa-lld-test_git.bb
new file mode 100644
index 0000000..2069d41
--- /dev/null
+++ b/recipes-bsp/sa-lld/sa-lld-test_git.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "TI Security Accelerator LLD (SA LLD) Examples"
+
+DEPENDS = "common-csl-ip cppi-lld qmss-lld pa-lld sa-lld"
+
+include sa-lld.inc
+
+DEVICELIST = "k2h k2k k2l k2e"
+
+CHOICELIST = "no yes"
+
+do_compile () {
+#   Now build the lld in the updated directory
+	for device in ${DEVICELIST}
+	do
+		make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" SA_SRC_DIR=${S}
+		for choice in ${CHOICELIST}
+		do
+			make -f makefile_armv7 examples PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" SA_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
+		done
+	done
+}
+
+do_install () {
+	install -d ${D}${bindir}/ti/drv/sa/example/SaBasicExample/vectors
+
+# copy all the test vectors
+	find example/SaBasicExample/vectors -name *.bin -type f | xargs -I {} cp --parents {} ${D}${bindir}/ti/drv/sa
+
+	for device in ${DEVICELIST}
+	do
+		make -f makefile_armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" SA_SRC_DIR=${S} INSTALL_BIN_BASE_DIR=${D}${bindir}
+	done
+}
diff --git a/recipes-bsp/sa-lld/sa-lld.inc b/recipes-bsp/sa-lld/sa-lld.inc
new file mode 100644
index 0000000..d4bdc95
--- /dev/null
+++ b/recipes-bsp/sa-lld/sa-lld.inc
@@ -0,0 +1,14 @@
+LICENSE = "BSD-3-Clause"
+COMPATIBLE_MACHINE = "keystone"
+
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/sa/COPYING.txt;md5=4709d353574a9569e129ebdf20e732dd"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-rtos/sa-lld.git;destsuffix=git/ti/drv/sa;protocol=git;branch=${BRANCH}"
+# Following commit DEV.SA_LLD.03.00.00.08
+SRCREV = "4da032c600ded79ab226a2a0100c1d8178a9da39"
+PV = "03.00.00.08"
+PR = "r0"
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/drv/sa"
diff --git a/recipes-bsp/sa-lld/sa-lld_git.bb b/recipes-bsp/sa-lld/sa-lld_git.bb
new file mode 100644
index 0000000..f345895
--- /dev/null
+++ b/recipes-bsp/sa-lld/sa-lld_git.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "TI Security Accelerator LLD (SA LLD) Library"
+
+DEPENDS = "common-csl-ip"
+
+include sa-lld.inc
+
+do_compile () {
+#   Now build the lld in the updated directory
+	make -f makefile_armv7 clean lib PDK_INSTALL_PATH=${STAGING_INCDIR}
+}
+
+do_install () {
+	make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}/${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+}
-- 
1.7.9.5


