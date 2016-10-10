Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 23BFAE009FA; Mon, 10 Oct 2016 07:58:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D44DBE00546
	for <meta-ti@yoctoproject.org>; Mon, 10 Oct 2016 07:58:03 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9AEw2YR001393
	for <meta-ti@yoctoproject.org>; Mon, 10 Oct 2016 09:58:02 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9AEw29H007466
	for <meta-ti@yoctoproject.org>; Mon, 10 Oct 2016 09:58:02 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 10 Oct 2016 09:58:01 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u9AEw01o017174;	Mon, 10 Oct 2016 09:58:00 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 10 Oct 2016 10:55:36 -0400
Message-ID: <1476111336-15663-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] multiprocmgr: add systemd service
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
X-List-Received-Date: Mon, 10 Oct 2016 14:58:08 -0000
Content-Type: text/plain

* The multiprocmgr's mpmsrv daemon requires a set of kernel modules to
  be loaded prior to initialization.
* Add a systemd service so that these dependencies may be specified.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../multiprocmgr/multiprocmgr/mpmsrv-daemon.service   | 14 ++++++++++++++
 recipes-ti/multiprocmgr/multiprocmgr_git.bb           | 19 +++++++++++++++----
 2 files changed, 29 insertions(+), 4 deletions(-)
 create mode 100644 recipes-ti/multiprocmgr/multiprocmgr/mpmsrv-daemon.service

diff --git a/recipes-ti/multiprocmgr/multiprocmgr/mpmsrv-daemon.service b/recipes-ti/multiprocmgr/multiprocmgr/mpmsrv-daemon.service
new file mode 100644
index 0000000..40eb465
--- /dev/null
+++ b/recipes-ti/multiprocmgr/multiprocmgr/mpmsrv-daemon.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=TI Multiproc Manager
+
+[Service]
+ExecStartPre=/sbin/modprobe keystone_remoteproc
+ExecStartPre=/sbin/modprobe keystone_dsp_mem
+ExecStartPre=/sbin/modprobe uio_module_drv
+
+Type=forking
+PIDFile=/var/run/mpm/pid
+ExecStart=/usr/bin/mpmsrv
+
+[Install]
+WantedBy=basic.target
diff --git a/recipes-ti/multiprocmgr/multiprocmgr_git.bb b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
index 38d4ceb..2960ee3 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
@@ -3,7 +3,9 @@ SUMMARY = "Provides download, debug and other utilities for other cores in the S
 
 include multiprocmgr.inc
 
-PR = "${INC_PR}.0"
+SRC_URI_append = " file://mpmsrv-daemon.service"
+
+PR = "${INC_PR}.1"
 
 DEPENDS = "mpm-transport libdaemon virtual/kernel"
 RDEPENDS_${PN} = "syslog-ng"
@@ -15,15 +17,24 @@ CC += "-I${STAGING_KERNEL_DIR}/include"
 INITSCRIPT_NAME = "mpmsrv-daemon.sh"
 INITSCRIPT_PARAMS = "defaults 10"
 
-inherit update-rc.d
+SYSTEMD_SERVICE_${PN} = "mpmsrv-daemon.service"
+
+inherit update-rc.d systemd
 
 do_install() {
 	install -d ${D}${bindir}/
 	install -c -m 755 ${S}/bin/mpmsrv ${D}${bindir}/mpmsrv
 	install -c -m 755 ${S}/bin/mpmcl ${D}${bindir}/mpmcl
 
-	install -d ${D}${sysconfdir}/init.d/
-	install -c -m 755 ${S}/scripts/mpmsrv-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+	systemd_enabled=${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '1', '0', d)}
+	if [ ${systemd_enabled} -eq 1 ]
+	then
+		install -d ${D}${systemd_system_unitdir}
+		install -m 0644 ${WORKDIR}/mpmsrv-daemon.service ${D}${systemd_system_unitdir}
+	else
+		install -d ${D}${sysconfdir}/init.d/
+		install -c -m 755 ${S}/scripts/mpmsrv-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+	fi
 	install -d ${D}${sysconfdir}/mpm/
 	install -c -m 755 ${S}/scripts/crash_callback.sh ${D}${sysconfdir}/mpm/crash_callback.sh
 
-- 
2.7.4


