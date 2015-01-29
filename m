Return-Path: <ashcharles@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BBEFBE0080C; Wed, 28 Jan 2015 18:55:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (ashcharles[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.48 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B0E0E006AF
	for <meta-ti@yoctoproject.org>; Wed, 28 Jan 2015 18:54:59 -0800 (PST)
Received: by mail-pa0-f48.google.com with SMTP id ey11so33053221pad.7
	for <meta-ti@yoctoproject.org>; Wed, 28 Jan 2015 18:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Qqmx2G4Dg26sZ7CSDZP+Xw9bm0KTBm9k9orA4F6JUL8=;
	b=wetpNvPY3br4XkGh42uWe+YfRgbm32XB+MOiR2roDnOfsVgw/ZF2XFamfaBet0igId
	L5p/VkV8W0GcMeTyhOdOqyPJoDvjmXbwWjHYDoNV7RDKsPg2JTtQsFN//z+T5Q/UMOFd
	1QH8ycPbfYGVkjBHf3wVONtgD22Gm7ZEbXZKpUfLea5HvCK1u7azLhbAp+PIs0zhI2PQ
	DYZxdVjePwZMc8BAKf5JJunBZCcp376GR9+VmXe+i+AvHFOBC4Vm4UBn2Xevby4jyckb
	w2pNMxPF+diddxoLFzrn6uo3li1+Uureo87cJFM3ukdWriiSKKvciE0gWZs/0xA6ZZMR
	yS5Q==
X-Received: by 10.68.232.104 with SMTP id tn8mr10741536pbc.31.1422500099423;
	Wed, 28 Jan 2015 18:54:59 -0800 (PST)
Received: from localhost.localdomain (104-37-60-13.dyn.novuscom.net.
	[104.37.60.13])
	by mx.google.com with ESMTPSA id pr7sm6098487pdb.23.2015.01.28.18.54.58
	for <meta-ti@yoctoproject.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 Jan 2015 18:54:58 -0800 (PST)
From: Ash Charles <ashcharles@gmail.com>
To: meta-ti@yoctoproject.org
Date: Wed, 28 Jan 2015 18:54:56 -0800
Message-Id: <1422500096-20695-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1422496819-20863-1-git-send-email-ashcharles@gmail.com>
References: <1422496819-20863-1-git-send-email-ashcharles@gmail.com>
Subject: [PATCH v2] uim: allow argument for sysfs path
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
X-List-Received-Date: Thu, 29 Jan 2015 02:55:05 -0000

This updates uim to match the version included in meta-arago.  It
includes a useful patch to allow the sysfs node to be passed via
command line argument.

Note: don't set the target prefix so it works for both hard and softfp
      setups.

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 ...mand-line-args-for-passing-sysfs-node-pat.patch | 135 +++++++++++++++++++++
 recipes-connectivity/uim/files/uim-sysfs           |  33 +++++
 recipes-connectivity/uim/uim_git.bb                |  30 +++--
 3 files changed, 187 insertions(+), 11 deletions(-)
 create mode 100644 recipes-connectivity/uim/files/0001-uim-Add-command-line-args-for-passing-sysfs-node-pat.patch
 create mode 100755 recipes-connectivity/uim/files/uim-sysfs

diff --git a/recipes-connectivity/uim/files/0001-uim-Add-command-line-args-for-passing-sysfs-node-pat.patch b/recipes-connectivity/uim/files/0001-uim-Add-command-line-args-for-passing-sysfs-node-pat.patch
new file mode 100644
index 0000000..ad6f95f
--- /dev/null
+++ b/recipes-connectivity/uim/files/0001-uim-Add-command-line-args-for-passing-sysfs-node-pat.patch
@@ -0,0 +1,135 @@
+From 0df5f6766722a844162e96777980feee146a3c86 Mon Sep 17 00:00:00 2001
+From: Roger Monk <r-monk@ti.com>
+Date: Tue, 1 Oct 2013 17:17:25 +0100
+Subject: [PATCH] uim:  Add command line args for passing sysfs node path
+
+   * pass -f <sysfs path> and/or -b <bd address>
+   * re-mapped DEFINEs to strings
+      * minimal code changes for minimal instrusion
+      * could be rewritten for cleaner implementation in the future
+   * default path (no args) remains the same
+   * users passing bd address via uim <addr> will need to add -b
+
+Signed-off-by: Roger Monk <r-monk@ti.com>
+---
+ uim.c |   61 +++++++++++++++++++++++++++++++++++++++++++++++++++++--------
+ uim.h |   10 +++++-----
+ 2 files changed, 58 insertions(+), 13 deletions(-)
+
+diff --git a/uim.c b/uim.c
+index 3775dda..4dfdbd7 100644
+--- a/uim.c
++++ b/uim.c
+@@ -38,6 +38,11 @@ static int exiting;
+ static int line_discipline;
+ static int dev_fd;
+ 
++static char install_sysfs_entry[48];
++static char dev_name_sysfs[48];
++static char baud_rate_sysfs[48];
++static char flow_cntrl_sysfs[48];
++
+ /* BD address as string and a pointer to array of hex bytes */
+ char uim_bd_address[BD_ADDR_LEN];
+ bdaddr_t *bd_addr;
+@@ -455,9 +460,17 @@ bdaddr_t *strtoba(const char *str)
+         return (bdaddr_t *) ba;
+ }
+ 
++void usage(void)
++{
++	UIM_ERR("Invalid arguments");
++	UIM_ERR("Usage: uim [ -f <path-to-sysfs-kim> ] [ -b <bd address XX:XX:XX:XX:XX:XX> ]");
++}
++
+ /*****************************************************************************/
+ int main(int argc, char *argv[])
+ {
++	int opt;
++	char *arg_kim_path = NULL, *arg_bd_addr = NULL, *temp_path = KIM_SYSFS_BASE;
+ 	int st_fd, err;
+ 	unsigned char install;
+ 	struct pollfd 	p;
+@@ -466,18 +479,50 @@ int main(int argc, char *argv[])
+ 	err = 0;
+ 
+ 	/* Parse the user input */
+-	if ((argc > 2)) {
+-		UIM_ERR("Invalid arguements");
+-		UIM_ERR("Usage: uim <bd address>");
+-		return -1;
++	while ((opt = getopt (argc, argv, "f:b:")) != -1) {
++		switch (opt) {
++			case 'f':
++				arg_kim_path = optarg;
++				break;
++			case 'b':
++				arg_bd_addr = optarg;
++				break;
++			default:
++				usage();
++				return -1;
++		}
++	}
++
++	if (arg_kim_path != NULL) {
++		temp_path = arg_kim_path;
++		if( strlen(temp_path) > (sizeof(install_sysfs_entry)-10) ) {
++			UIM_ERR("Path to sysfs node too long");
++			return -1;
++		}
+ 	}
+-	if (argc == 2) {
+-		if (strlen(argv[2]) != BD_ADDR_LEN) {
+-			UIM_ERR("Usage: uim XX:XX:XX:XX:XX:XX");
++	strcpy(install_sysfs_entry, temp_path);
++	strcpy(dev_name_sysfs, temp_path);
++	strcpy(baud_rate_sysfs, temp_path);
++	strcpy(flow_cntrl_sysfs, temp_path);
++
++	strcat(install_sysfs_entry, "/install");
++	strcat(dev_name_sysfs, "/dev_name");
++	strcat(baud_rate_sysfs, "/baud_rate");
++	strcat(flow_cntrl_sysfs, "/flow_cntrl");
++
++	UIM_DBG("install = %s", install_sysfs_entry);
++	UIM_DBG("dev_name = %s", dev_name_sysfs);
++	UIM_DBG("baud_rate = %s", baud_rate_sysfs);
++	UIM_DBG("flow_cntrl = %s", flow_cntrl_sysfs);
++
++	if (arg_bd_addr != NULL) {
++		if (strlen(arg_bd_addr) != BD_ADDR_LEN) {
++			usage();
+ 			return -1;
+ 		}
++		UIM_DBG("Address = %s", arg_bd_addr);
+ 		/* BD address passed as string in xx:xx:xx:xx:xx:xx format */
+-		strncpy(uim_bd_address, argv[2], sizeof(uim_bd_address));
++		strncpy(uim_bd_address, arg_bd_addr, sizeof(uim_bd_address));
+ 		bd_addr = strtoba(uim_bd_address);
+ 	}
+ 
+diff --git a/uim.h b/uim.h
+index a8ef699..32a8fe0 100644
+--- a/uim.h
++++ b/uim.h
+@@ -65,11 +65,11 @@
+ /* the sysfs entries with device configuration set by
+  * shared transport driver
+  */
+-#define INSTALL_SYSFS_ENTRY "/sys/devices/platform/kim/install"
+-#define DEV_NAME_SYSFS "/sys/devices/platform/kim/dev_name"
+-#define BAUD_RATE_SYSFS "/sys/devices/platform/kim/baud_rate"
+-#define FLOW_CTRL_SYSFS "/sys/devices/platform/kim/flow_cntrl"
+-
++#define KIM_SYSFS_BASE		"/sys/devices/platform/kim"
++#define INSTALL_SYSFS_ENTRY	install_sysfs_entry
++#define DEV_NAME_SYSFS		dev_name_sysfs
++#define BAUD_RATE_SYSFS		baud_rate_sysfs
++#define FLOW_CTRL_SYSFS		flow_cntrl_sysfs
+ 
+ #define VERBOSE
+ /*Debug logs*/
+-- 
+1.7.9.5
+
diff --git a/recipes-connectivity/uim/files/uim-sysfs b/recipes-connectivity/uim/files/uim-sysfs
new file mode 100755
index 0000000..0891768
--- /dev/null
+++ b/recipes-connectivity/uim/files/uim-sysfs
@@ -0,0 +1,33 @@
+#! /bin/sh
+
+NODE=`cd /sys; find . | grep kim | grep install`
+if [ $NODE ]
+then
+    echo UIM SYSFS Node Found at /sys/$NODE
+else
+    echo UIM SYSFS Node Not Found 
+    exit 0
+fi 
+
+uim="/usr/bin/uim"
+uim_args="-f `dirname /sys/$NODE`"
+
+test -x "$uim" || exit 0
+
+case "$1" in
+  start)
+    echo -n "Starting uim-sysfs daemon"
+    start-stop-daemon --start --quiet --pidfile /var/run/uim.pid --make-pidfile --exec $uim -- $uim_args & 
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping uim-sysfs daemon"
+    start-stop-daemon --stop --quiet --pidfile /var/run/uim.pid
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/uim-sysfs.sh {start|stop}"
+    exit 1
+esac
+
+exit 0
diff --git a/recipes-connectivity/uim/uim_git.bb b/recipes-connectivity/uim/uim_git.bb
index c8265e9..53414f8 100644
--- a/recipes-connectivity/uim/uim_git.bb
+++ b/recipes-connectivity/uim/uim_git.bb
@@ -1,19 +1,27 @@
-DESCRIPTION = "User Mode Initialization Manager for wl12xx devices"
+DESCRIPTION = "Shared Transport Line Discipline User Mode initialisation Manager Daemon"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://uim.c;startline=4;endline=12;md5=16a9d6e829218481f8a61797fe2be2e2"
+LIC_FILES_CHKSUM = "file://uim.c;beginline=1;endline=18;md5=9f0bbfbc10c67689e81a523e2976c31e"
 
-# Doesn't have a version, so we'll make one up
-PV = "0.0"
+PV = "1.0"
+PR ="r1"
+PR_append = "+gitr${SRCPV}"
+
+INITSCRIPT_NAME = "uim-sysfs"
+INITSCRIPT_PARAMS = "defaults 03"
+
+inherit update-rc.d
 
 SRCREV = "c73894456df5def97111cb33d2106b684b8b7959"
-SRC_URI = "git://gitorious.org/uim/uim.git"
+SRC_URI = "git://gitorious.org/uim/uim.git \
+	   file://0001-uim-Add-command-line-args-for-passing-sysfs-node-pat.patch \
+	   file://uim-sysfs \
+"
 
-S= "${WORKDIR}/git"
+S = "${WORKDIR}/git"
 
 do_install() {
-	oe_runmake install DESTDIR=${D}
+	install -d ${D}${bindir}
+	install -m 0755 uim ${D}${bindir}
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/uim-sysfs ${D}${sysconfdir}/init.d
 }
-
-# connman has a plugin to handle all this
-RCONFLICTS_${PN} += "connman-plugin-tist"
-RRECOMMENDS_${PN} = "linux-firmware-wl12xx"
-- 
2.1.0


