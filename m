Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7F33AE00CC9; Tue, 18 Jul 2017 16:04:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 81CAAE00CAF
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 16:04:48 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6IN4lqc007572
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500419087;
	bh=2fsnBA9AYXTG/Mbw1Y4JJPJmK3Od9Om2HMh0vRUV1TI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=h1yZtDQ9HMCD4+O0abGY7OxFzVyAqL5Vz3YMcYm27Diu5nelmts8NpdcF76f16B3b
	W7w3ADMk0AyzRRlmIjYxItb/jkRJ3ZdRhr6VZ3UQsnNKh96d48frtQ/EO5DYrxyIRe
	qsf3sVRQZLySIpheZ9E6zWr3o5etty9S2FE4Nkb0=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6IN4lQS008822
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:47 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 18:04:47 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6IN46hx000997;	Tue, 18 Jul 2017 18:04:47 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jul 2017 19:03:37 -0400
Message-ID: <1500419028-3361-26-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 26/37] ti-pdk-setup: Add ti-pdk-setup recipe
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
X-List-Received-Date: Tue, 18 Jul 2017 23:04:57 -0000
Content-Type: text/plain

Upstreaming package to set up the PDK development environment
Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v2 - Added summary

 recipes-ti/ti-pdk-setup/ti-pdk-setup_git.bb | 81 +++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 recipes-ti/ti-pdk-setup/ti-pdk-setup_git.bb

diff --git a/recipes-ti/ti-pdk-setup/ti-pdk-setup_git.bb b/recipes-ti/ti-pdk-setup/ti-pdk-setup_git.bb
new file mode 100644
index 0000000..899db1f
--- /dev/null
+++ b/recipes-ti/ti-pdk-setup/ti-pdk-setup_git.bb
@@ -0,0 +1,81 @@
+SUMMARY = "Package containing scripts to setup the PDK development environment"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://release/full/pdksetupenv.sh;beginline=1;endline=20;md5=1858f90ca160daa7ca1b05dc3e474791"
+
+require recipes-ti/includes/ti-paths.inc
+
+PDK_SETUP_GIT_URI = "git://git@bitbucket.itg.ti.com/processor-sdk/processor-pdk-packages.git"
+PDK_SETUP_GIT_PROTOCOL = "ssh"
+PDK_SETUP_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "DEV.PDK_PACKAGES.01.00.00.01"
+PDK_SETUP_SRCREV = "23f310087fded4955d6d64e6df20fd057d1cede8"
+
+BRANCH = "${PDK_SETUP_GIT_BRANCH}"
+SRC_URI = "${PDK_SETUP_GIT_URI};protocol=${PDK_SETUP_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${PDK_SETUP_SRCREV}"
+PV = "01.00.00.01"
+PR = "r0"
+
+S = "${WORKDIR}/git/"
+
+CLEANBROKEN = "1"
+
+LIMIT_SOCS = "${TI_PDK_LIMIT_SOCS}"
+LIMIT_BOARDS = "${TI_PDK_LIMIT_BOARDS}"
+
+PDK_SOC = "${@'${MACHINE}'.replace('-evm','')}"
+PDK_SOC_omapl138-lcdk = "${@'${MACHINE}'.replace('-lcdk','')}"
+
+do_compile() {
+    :
+}
+
+do_install() {
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages
+
+    install -m 0755 release/full/pdksetupenv.sh ${D}${PDK_INSTALL_DIR_RECIPE}/packages
+    install -m 0755 release/full/pdksetupenv.bat ${D}${PDK_INSTALL_DIR_RECIPE}/packages
+    install -m 0755 release/full/pdkProjectCreate.bat ${D}${PDK_INSTALL_DIR_RECIPE}/packages
+    install -m 0755 release/full/pdkProjectCreate.sh ${D}${PDK_INSTALL_DIR_RECIPE}/packages
+    install -m 0755 release/full/pdkAppImageCreate.bat ${D}${PDK_INSTALL_DIR_RECIPE}/packages
+    install -m 0755 release/full/pdkAppImageCreate.sh ${D}${PDK_INSTALL_DIR_RECIPE}/packages
+    install -m 0755 release/full/macros.ini ${D}${PDK_INSTALL_DIR_RECIPE}/packages
+    install -m 0644 release/full/Rules.make ${D}${PDK_INSTALL_DIR_RECIPE}/packages
+
+    sed -i -e "s|__PDK_VER__|${PDK_VERSION}|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/pdkProjectCreate.sh
+    sed -i -e "s|__PDK_VER__|${PDK_VERSION}|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/pdkProjectCreate.bat
+
+    sed -i -e "s|__LIMIT_SOCS__|${LIMIT_SOCS}|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/pdksetupenv.sh
+    sed -i -e "s|__LIMIT_SOCS__|${LIMIT_SOCS}|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/pdksetupenv.bat
+    sed -i -e "s|__LIMIT_SOCS__|${LIMIT_SOCS}|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/Rules.make
+
+    sed -i -e "s|__LIMIT_BOARDS__|${LIMIT_BOARDS}|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/pdksetupenv.sh
+    sed -i -e "s|__LIMIT_BOARDS__|${LIMIT_BOARDS}|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/pdksetupenv.bat
+    sed -i -e "s|__LIMIT_BOARDS__|${LIMIT_BOARDS}|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/Rules.make
+
+    TI_PDK_VERSION=`echo ${PDK_VERSION} | sed -e 's|\.|_|g' -e 's|^0||'`
+
+    sed -i -e "s|__PDK_SOC__|${PDK_SOC}|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/Rules.make
+    sed -i -e "s|__PDK_VER__|${TI_PDK_VERSION}|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/Rules.make
+}
+
+do_install_append_omapl1() {
+    sed -i -e "s|c66x|c674x|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/pdksetupenv.sh
+    sed -i -e "s|c66x|c674x|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/pdksetupenv.bat
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/*"
-- 
1.9.1


