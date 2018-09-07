Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B2DD6E00953; Fri,  7 Sep 2018 05:05:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0A7E1E0090C
	for <meta-ti@yoctoproject.org>; Fri,  7 Sep 2018 05:05:04 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w87C54TO087270
	for <meta-ti@yoctoproject.org>; Fri, 7 Sep 2018 07:05:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536321904;
	bh=zuXa0yaV0aogiFyd3hudcW39HOhR3DpaK9NX0OTDsk4=;
	h=From:To:CC:Subject:Date;
	b=CN31uoH7pH5ikF8WUktutZEkrAPna9vZ1Lx2XEUBwnxGvvbkSt2l4TiFhq1IZiL7L
	SuA+KH8yRGj6gETEPvHXbJBq+AtxQCMT9kexghNdCRM5G9Qpgc1SzdoN/58Nyrh5Xo
	cbnlU4Yr89a+4cYakepatGO8SAa6uWS5QyAjiXWc=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w87C54lo006543
	for <meta-ti@yoctoproject.org>; Fri, 7 Sep 2018 07:05:04 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 7 Sep 2018 07:05:03 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 7 Sep 2018 07:05:04 -0500
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w87C53B7013709;
	Fri, 7 Sep 2018 07:05:03 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 7 Sep 2018 08:05:02 -0400
Message-ID: <1536321902-7078-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko-next][PATCH] ti-ipc: Add systemd startup script
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
X-List-Received-Date: Fri, 07 Sep 2018 12:05:05 -0000
Content-Type: text/plain

With systemd enabled, it is better to add the proper systemd
script instead of legacy init.d script.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc/tiipclad-daemon.service | 11 +++++++++++
 recipes-ti/ipc/ti-ipc_git.bb                  | 21 +++++++++++++++++----
 2 files changed, 28 insertions(+), 4 deletions(-)
 create mode 100644 recipes-ti/ipc/ti-ipc/tiipclad-daemon.service

diff --git a/recipes-ti/ipc/ti-ipc/tiipclad-daemon.service b/recipes-ti/ipc/ti-ipc/tiipclad-daemon.service
new file mode 100644
index 0000000..7c09c7d
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc/tiipclad-daemon.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=TI IPC Daemon
+
+[Service]
+Type=forking
+PIDFile=/var/run/tiipclad.pid
+ExecStart=/usr/bin/__LAD_DAEMON__ -g -l lad.txt
+PIDFile=/var/run/tiipclad.pid
+
+[Install]
+WantedBy=basic.target
diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index 23b8d94..8b3ac91 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -4,12 +4,13 @@ HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
 require ti-ipc.inc
 require ti-ipc-common.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 DEPENDS += "virtual/kernel"
 
 SRC_URI += "file://tiipclad-daemon.sh \
             file://omap_remoteproc.conf \
+            file://tiipclad-daemon.service \
             file://0001-Add-kernel-build-dir.patch \
            "
 
@@ -23,11 +24,13 @@ DAEMON_k2g = "lad_66ak2g"
 DAEMON_omapl138 = "lad_omapl138"
 DAEMON_k3 = "lad_am65xx"
 
-inherit autotools-brokensep pkgconfig update-rc.d
+inherit autotools-brokensep pkgconfig update-rc.d systemd
 
 INITSCRIPT_NAME = "tiipclad-daemon.sh"
 INITSCRIPT_PARAMS = "defaults 10"
 
+SYSTEMD_SERVICE_${PN} = "tiipclad-daemon.service"
+
 EXTRA_OECONF += "PLATFORM=${PLATFORM} KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} KERNEL_BUILD_DIR=${STAGING_KERNEL_BUILDDIR}"
 
 do_compile[depends] += "virtual/kernel:do_shared_workdir"
@@ -40,10 +43,20 @@ do_configure() {
 do_install_append() {
     install -d ${D}${sysconfdir}/init.d/
 
-    # Modify the tiipclad-daemon.sh script to point to the right
+    # Modify the startup scripts to point to the right
     # lad daemon executable.
     sed -i -e "s/__LAD_DAEMON__/${DAEMON}/" ${WORKDIR}/tiipclad-daemon.sh
-    install -c -m 755 ${WORKDIR}/tiipclad-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+    sed -i -e "s/__LAD_DAEMON__/${DAEMON}/" ${WORKDIR}/tiipclad-daemon.service
+
+    systemd_enabled=${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '1', '0', d)}
+    if [ ${systemd_enabled} -eq 1 ]
+    then
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${WORKDIR}/tiipclad-daemon.service ${D}${systemd_system_unitdir}
+    else
+        install -d ${D}${sysconfdir}/init.d/
+        install -c -m 755 ${S}/scripts/tiipclad-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+    fi
 }
 
 do_install_append_dra7xx() {
-- 
1.9.1


