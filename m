Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C301CE00477; Fri, 27 Feb 2015 12:14:51 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.21 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87E0CE00321
	for <meta-ti@yoctoproject.org>; Fri, 27 Feb 2015 12:14:47 -0800 (PST)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NKG0044T5KM6LE0@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 27 Feb 2015 14:14:47 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=OYkv1aXd c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=0HtSIViG9nkA:10
	a=sozttTNsAAAA:8	a=3BXHjb6cTue7x6Rz2ckA:9 a=0BD9DJaV1KNkv2EO:21
	a=BM4o0kQerbU3VOnx:21
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6AE1D203ED;	Thu,
	26 Feb 2015 17:47:22 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 26 Feb 2015 17:47:21 -0500
Message-id: <1424990841-14184-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] udev: rules for seamless transition to 8250_omap serial driver
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
X-List-Received-Date: Fri, 27 Feb 2015 20:14:51 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-core/udev/udev/omap-tty.rules | 17 +++++++++++++++++
 recipes-core/udev/udev_%.bbappend     |  9 +++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 recipes-core/udev/udev/omap-tty.rules
 create mode 100644 recipes-core/udev/udev_%.bbappend

diff --git a/recipes-core/udev/udev/omap-tty.rules b/recipes-core/udev/udev/omap-tty.rules
new file mode 100644
index 0000000..989d60f
--- /dev/null
+++ b/recipes-core/udev/udev/omap-tty.rules
@@ -0,0 +1,17 @@
+# There are a number of modifiers that are allowed to be used in some
+# of the different fields. They provide the following subsitutions:
+#
+# %n the "kernel number" of the device.
+#    For example, 'sda3' has a "kernel number" of '3'
+# %e the smallest number for that name which does not matches an existing node
+# %k the kernel name for the device
+# %M the kernel major number for the device
+# %m the kernel minor number for the device
+# %b the bus id for the device
+# %c the string returned by the PROGRAM
+# %s{filename} the content of a sysfs attribute
+# %% the '%' char itself
+#
+
+# Backward compatibility with old OMAP UART-style ttyO0 naming
+SUBSYSTEM=="tty", ATTR{uartclk}!="0", KERNEL=="ttyS[0-9]", SYMLINK+="ttyO%n"
diff --git a/recipes-core/udev/udev_%.bbappend b/recipes-core/udev/udev_%.bbappend
new file mode 100644
index 0000000..fd0d99b
--- /dev/null
+++ b/recipes-core/udev/udev_%.bbappend
@@ -0,0 +1,9 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI_append = " file://omap-tty.rules"
+
+PR_append = ".0"
+
+do_install_append() {
+    install -m 0644 ${WORKDIR}/omap-tty.rules ${D}${sysconfdir}/udev/rules.d/
+}
-- 
2.2.0


