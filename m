Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D0529E00C51; Fri, 29 Apr 2016 15:15:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.19 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7177E00C41
	for <meta-ti@yoctoproject.org>; Fri, 29 Apr 2016 15:15:23 -0700 (PDT)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.148])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6F00F6Q1SSTV50@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 29 Apr 2016 17:15:07 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=YQmRWQ_4xF5TMZ6b-s4A:9
Received: by 100.15.86.14 with SMTP id 4f9b3a1d; Fri, 29 Apr 2016 22:15:07 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9F64F161FD0;	Fri,
	29 Apr 2016 18:14:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 29 Apr 2016 18:14:51 -0400
Message-id: <1461968091-21403-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] eudev: immediately tell kernel that userspace FW loading failed
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
X-List-Received-Date: Fri, 29 Apr 2016 22:15:26 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-core/udev/eudev/firmware.rules | 3 +++
 recipes-core/udev/eudev_%.bbappend     | 7 +++++--
 2 files changed, 8 insertions(+), 2 deletions(-)
 create mode 100644 recipes-core/udev/eudev/firmware.rules

diff --git a/recipes-core/udev/eudev/firmware.rules b/recipes-core/udev/eudev/firmware.rules
new file mode 100644
index 0000000..f7a08ce
--- /dev/null
+++ b/recipes-core/udev/eudev/firmware.rules
@@ -0,0 +1,3 @@
+# stub for immediately telling the kernel that userspace firmware loading
+# failed; necessary to avoid long timeouts with CONFIG_FW_LOADER_USER_HELPER=y
+SUBSYSTEM=="firmware", ACTION=="add", ATTR{loading}="-1"
diff --git a/recipes-core/udev/eudev_%.bbappend b/recipes-core/udev/eudev_%.bbappend
index a23d015..54cbf84 100644
--- a/recipes-core/udev/eudev_%.bbappend
+++ b/recipes-core/udev/eudev_%.bbappend
@@ -1,8 +1,11 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-SRC_URI_append = " file://omap-tty.rules"
+SRC_URI_append = " \
+    file://omap-tty.rules \
+    file://firmware.rules \
+"
 
-PR_append = ".1"
+PR_append = ".2"
 
 install_omap_rules() {
     install -m 0644 ${WORKDIR}/omap-tty.rules ${D}${sysconfdir}/udev/rules.d/
-- 
2.2.0


