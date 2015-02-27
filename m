Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9DB4E008DD; Thu, 26 Feb 2015 17:33:09 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E4EA5E008CD
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 17:33:01 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 46B8852A04; Fri, 27 Feb 2015 01:33:01 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150227013301.46B8852A04@arago-project.org>
Date: Fri, 27 Feb 2015 01:33:01 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : udev: rules for seamless transition to 8250_omap serial driver
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
X-List-Received-Date: Fri, 27 Feb 2015 01:33:09 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 92d21a95b5813ed98786cd3555d89d9f23aeb508
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=92d21a95b5813ed98786cd3555d89d9f23aeb508

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Feb 26 14:51:40 2015 -0500

udev: rules for seamless transition to 8250_omap serial driver

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-core/udev/udev/omap-tty.rules |   17 +++++++++++++++++
 recipes-core/udev/udev_%.bbappend     |    9 +++++++++
 2 files changed, 26 insertions(+), 0 deletions(-)

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


