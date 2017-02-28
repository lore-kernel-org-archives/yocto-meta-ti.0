Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AC453E00510; Mon, 27 Feb 2017 17:50:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94151E004E5
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2017 17:50:16 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6DD4C209A4;
	Tue, 28 Feb 2017 01:50:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 0I6d8mGEj-3u; Tue, 28 Feb 2017 01:50:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 54E2520481;
	Tue, 28 Feb 2017 01:50:14 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id C0FC116238C;
	Mon, 27 Feb 2017 20:50:13 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 27 Feb 2017 20:50:13 -0500
Message-Id: <1488246613-46568-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] ti-ipc: update from "eng" to GA version of 3.45
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
X-List-Received-Date: Tue, 28 Feb 2017 01:50:17 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/ipc/ti-ipc-rtos.inc | 14 +++++++-------
 recipes-ti/ipc/ti-ipc.inc      |  6 +++---
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index 77ce7ec..7f029a7 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -25,19 +25,19 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
 branch=${TI_IPC_METADATA_GIT_BRANCH};\
 name=${TI_IPC_METADATA_NAME}"
 
-# Corresponds to tag: 3.45.00.00_eng
-SRCREV_ipc-examples = "b19a3b7a003aa3304a12599a498d9b3a24f20c6e"
+# Corresponds to tag: 3.45.00.00
+SRCREV_ipc-examples = "3a8ee1841ec36117a9bcd3d45bb2781bbd53ecf8"
 
-# Corresponds to tag: 3.45.00.00_eng
-SRCREV_ipc-metadata = "92fa9ce4419abf0fa2cf4063ee84e524c51548d0"
+# Corresponds to tag: 3.45.00.00
+SRCREV_ipc-metadata = "30b83f09be1877f86b22c971d978cb478fc7dd6e"
 
 S_ipc-examples = "${WORKDIR}/git/ipc-examples"
 S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
 
-RELEASE_TYPE = "ENG"
-RELEASE_SUFFIX = "_eng"
+RELEASE_TYPE = "GA"
+RELEASE_SUFFIX = ""
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.2"
 
 DEPENDS_append_keystone = " ti-cgt6x-native \
                             gcc-arm-none-eabi-native \
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 876aca9..ea256d2 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
 
 TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
-TI_IPC_GIT_BRANCH = "ipc-next"
+TI_IPC_GIT_BRANCH = "master"
 
-#Corresponds to 3.45.00.00_eng
-TI_IPC_SRCREV = "9dd159d851496047b6833a5b7c71ed9ea95efc07"
+#Corresponds to 3.45.00.00
+TI_IPC_SRCREV = "1584985938884bf6cb1d839779578354b1865ea4"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
-- 
2.7.4


