Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3D57DE00828; Fri, 24 Aug 2018 10:46:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C747FE0080F
	for <meta-ti@yoctoproject.org>; Fri, 24 Aug 2018 10:46:55 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7OHkt47055601
	for <meta-ti@yoctoproject.org>; Fri, 24 Aug 2018 12:46:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535132815;
	bh=1HBnNI9X7/n/HtsCdjKBNdfgpVx/r1+gVoL8CzUdONU=;
	h=From:To:CC:Subject:Date;
	b=lyIwMhXdnrBivP/fEPmCjagrdJBVplEoaj3O0SUiJ9sj65ZKBUzm3M/FRzQsha0Uc
	7+DomM9fqSPf+fv9SOH3d0h5XxK/JkXwFX2llgqg8EWpqv549JB/Si8AZPLGaz8yEu
	M5l7gQsbOOwZW/GDZmoSfI25vfTXU89Qh9Ye1lh0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7OHktQ8005094
	for <meta-ti@yoctoproject.org>; Fri, 24 Aug 2018 12:46:55 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 24 Aug 2018 12:46:54 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 24 Aug 2018 12:46:54 -0500
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7OHkss0020122;
	Fri, 24 Aug 2018 12:46:54 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>, <s-anna@ti.com>
Date: Fri, 24 Aug 2018 13:46:53 -0400
Message-ID: <1535132813-25811-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH] ti-ipc: Update to new version 3.50.01.01
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
X-List-Received-Date: Fri, 24 Aug 2018 17:46:57 -0000
Content-Type: text/plain

-Updates to use sciclient for configuring interrupt routing in SOC

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc-common.inc      |  2 +-
 recipes-ti/ipc/ti-ipc-examples_git.bb |  2 ++
 recipes-ti/ipc/ti-ipc-rtos.inc        | 12 ++++++++----
 recipes-ti/ipc/ti-ipc-rtos_git.bb     |  1 +
 recipes-ti/ipc/ti-ipc.inc             |  4 ++--
 5 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
index 6aea8e6..543990a 100644
--- a/recipes-ti/ipc/ti-ipc-common.inc
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -1,4 +1,4 @@
-PV = "3.50.01.00"
+PV = "3.50.01.01"
 INC_PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/recipes-ti/ipc/ti-ipc-examples_git.bb b/recipes-ti/ipc/ti-ipc-examples_git.bb
index c46e5c8..d8733ae 100644
--- a/recipes-ti/ipc/ti-ipc-examples_git.bb
+++ b/recipes-ti/ipc/ti-ipc-examples_git.bb
@@ -3,6 +3,8 @@ require ti-ipc-examples.inc
 
 DEPENDS = "ti-ipc ti-xdctools-native ti-sysbios ti-ipc-rtos zip-native"
 
+DEPENDS_append_am65xx-evm = " sciclient-rtos"
+
 do_compile_append() {
 
   if [  "${PLATFORM}" != "UNKNOWN" ]; then
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index 13b1914..4b2d7d7 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -24,11 +24,13 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
 branch=${TI_IPC_METADATA_GIT_BRANCH};\
 name=${TI_IPC_METADATA_NAME}"
 
-# Corresponds to tag: 3.50.01.00
-SRCREV_ipc-metadata = "19a8e70cf6ca4fe0984987e25d937c61a62c7658"
+# Corresponds to tag: 3.50.01.01
+TI_IPC_METADATA_SRCREV = "c749d4dd70cc259679dc862a164ad147d51381f6"
+# Corresponds to tag: 3.50.01.01
+TI_IPC_EXAMPLES_SRCREV = "71f6e59a6b2c7e20c2656e5000f318339ded2f3c"
 
-# Corresponds to tag: 3.50.01.00
-SRCREV_ipc-examples = "1975687076426b587be8d2530df56c24425ca53a"
+SRCREV_ipc-metadata = "${TI_IPC_METADATA_SRCREV}"
+SRCREV_ipc-examples = "${TI_IPC_EXAMPLES_SRCREV}"
 
 S_ipc-examples = "${WORKDIR}/git/ipc-examples"
 S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
@@ -89,3 +91,5 @@ EXTRA_OEMAKE = "\
     JOBS="--jobs=${BB_NUMBER_THREADS}" \
     JAVA_TOOL_OPTIONS=-Xss2560k \
 "
+EXTRA_OEMAKE_append_am65xx-evm = " PDK_INSTALL_DIR=${PDK_INSTALL_DIR}"
+
diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index c374bb1..ee7778a 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -3,6 +3,7 @@ require ti-ipc-common.inc
 require ti-ipc-rtos.inc
 
 DEPENDS = "ti-xdctools-native ti-sysbios doxygen-native zip-native"
+DEPENDS_append_am65xx-evm = " sciclient-rtos"
 
 PACKAGES =+ "${PN}-fw"
 FILES_${PN}-fw = "${base_libdir}/firmware/*"
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index b10e242..ca39292 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -8,8 +8,8 @@ TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
 TI_IPC_GIT_BRANCH = "3.50"
 
-#Corresponds to 3.50.01.00C
-TI_IPC_SRCREV = "32294eb80e9889ba12d0c008b21acab4545713af"
+#Corresponds to 3.50.01.01
+TI_IPC_SRCREV = "771859b9687476c3ba1b5bf0d4afb3c97876137e"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
-- 
1.9.1


