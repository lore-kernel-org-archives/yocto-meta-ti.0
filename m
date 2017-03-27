Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 32043E00995; Mon, 27 Mar 2017 10:27:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DCA38E00867
	for <meta-ti@yoctoproject.org>; Mon, 27 Mar 2017 10:27:12 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 525CF20B84;
	Mon, 27 Mar 2017 17:27:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id mhlD8QIq8jYQ; Mon, 27 Mar 2017 17:27:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1504E208CB;
	Mon, 27 Mar 2017 17:27:09 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id A955D1623B7;
	Mon, 27 Mar 2017 13:27:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 27 Mar 2017 13:27:05 -0400
Message-Id: <1490635625-86103-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Suman Anna <s-anna@ti.com>
Subject: [morty/master][PATCH v2] ti-ipc: add module dependency between omap_remoteproc and virtio_rpmsg_bus
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
X-List-Received-Date: Mon, 27 Mar 2017 17:27:17 -0000

From: Denys Dmytriyenko <denys@ti.com>

This is required to workaround the remoteproc crash due to watchdog interrupt
conflicts - LCPD-9490

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Sam Nelson <sam.nelson@ti.com>
Cc: Suman Anna <s-anna@ti.com>
---
v2 - only add module dependency for dra7xx platforms

 recipes-ti/ipc/ti-ipc/omap_remoteproc.conf | 1 +
 recipes-ti/ipc/ti-ipc_git.bb               | 6 ++++++
 2 files changed, 7 insertions(+)
 create mode 100644 recipes-ti/ipc/ti-ipc/omap_remoteproc.conf

diff --git a/recipes-ti/ipc/ti-ipc/omap_remoteproc.conf b/recipes-ti/ipc/ti-ipc/omap_remoteproc.conf
new file mode 100644
index 0000000..6b5034c
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc/omap_remoteproc.conf
@@ -0,0 +1 @@
+softdep omap_remoteproc pre: virtio_rpmsg_bus
diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index 5878b63..05b4d85 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -9,6 +9,7 @@ PR = "${INC_PR}.0"
 DEPENDS += "virtual/kernel"
 
 SRC_URI += "file://tiipclad-daemon.sh \
+            file://omap_remoteproc.conf \
             file://0001-Add-kernel-build-dir.patch \
            "
 
@@ -43,6 +44,11 @@ do_install_append() {
     install -c -m 755 ${WORKDIR}/tiipclad-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
 }
 
+do_install_append_dra7xx() {
+    install -d ${D}${sysconfdir}/modprobe.d/
+    install -c -m 644 ${WORKDIR}/omap_remoteproc.conf ${D}${sysconfdir}/modprobe.d/
+}
+
 PACKAGES =+ "${PN}-test"
 RDEPENDS_${PN}-test += "${PN}"
 
-- 
2.7.4


