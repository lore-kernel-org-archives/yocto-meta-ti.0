Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06484E00283
	for <meta-ti@yoctoproject.org>; Fri, 31 Aug 2012 14:54:38 -0700 (PDT)
Received: by obbtb18 with SMTP id tb18so8256447obb.35
	for <meta-ti@yoctoproject.org>; Fri, 31 Aug 2012 14:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=2W+261A4RZ/Ayt/edzExT0HpivkC8jTRus+I5NthQpQ=;
	b=G7qPPYwNgiBcgorlxT/EpMYCIUMbRku379X/xG/w5CNH25LXZlrJ87QWPJunLfS63F
	7GT5O9cDCViyN3d5P7CeHTrVc+ehzvv7/AcE9DGhd7bub/taJeIybMRk+c1bznjmHIm+
	vrojIk0wOKMx+guU8eIhYSRrX/fDPM2sLp+EnxuiKPjfXk2ryN2l/RRBccajvUAfyGn4
	h2rzhftSLsrREXvSk4oI8PwTYyYB4ymNRJ+EwFa8ypghn3OW8oTUjF+8UNbuDhb8ChI2
	JkrWIn64qUsLvz2bGbNBFrOgZg0nm5iaKmM6qb45RsdWbyMY8qcGl5VbFdNWEnvkS3CK
	npxA==
Received: by 10.182.216.99 with SMTP id op3mr8960200obc.85.1346450076115;
	Fri, 31 Aug 2012 14:54:36 -0700 (PDT)
Received: from ubuntu.am.dhcp.ti.com (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id l10sm3789512oeb.13.2012.08.31.14.54.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 31 Aug 2012 14:54:35 -0700 (PDT)
From: fcooperjr27@gmail.com
To: meta-ti@yoctoproject.org
Date: Fri, 31 Aug 2012 16:54:20 -0500
Message-Id: <1346450061-6913-1-git-send-email-fcooperjr27@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [master][PATCH v3] netbase: Add base interfaces file
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
X-List-Received-Date: Fri, 31 Aug 2012 21:54:39 -0000

From: Franklin S Cooper Jr <fcooper@ti.com>

* Add PRINC
* Create copies of the interfaces file that was grabbed from oe-core
  and copy it into TI SOC families specific directories
* Update to use the new syntax for extending the file search path

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 recipes-core/netbase/netbase-5.0/omap3/interfaces  |   31 ++++++++++++++++++++
 .../netbase/netbase-5.0/omapl138/interfaces        |   31 ++++++++++++++++++++
 recipes-core/netbase/netbase-5.0/ti33x/interfaces  |   31 ++++++++++++++++++++
 recipes-core/netbase/netbase_5.0.bbappend          |    5 ++-
 4 files changed, 96 insertions(+), 2 deletions(-)
 create mode 100644 recipes-core/netbase/netbase-5.0/omap3/interfaces
 create mode 100644 recipes-core/netbase/netbase-5.0/omapl138/interfaces
 create mode 100644 recipes-core/netbase/netbase-5.0/ti33x/interfaces

diff --git a/recipes-core/netbase/netbase-5.0/omap3/interfaces b/recipes-core/netbase/netbase-5.0/omap3/interfaces
new file mode 100644
index 0000000..0acf4cf
--- /dev/null
+++ b/recipes-core/netbase/netbase-5.0/omap3/interfaces
@@ -0,0 +1,31 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+ 
+# The loopback interface
+auto lo
+iface lo inet loopback
+
+# Wireless interfaces
+iface wlan0 inet dhcp
+	wireless_mode managed
+	wireless_essid any
+	wpa-driver wext
+	wpa-conf /etc/wpa_supplicant.conf
+
+iface atml0 inet dhcp
+
+# Wired or wireless interfaces
+auto eth0
+iface eth0 inet dhcp
+iface eth1 inet dhcp
+
+# Ethernet/RNDIS gadget (g_ether)
+# ... or on host side, usbnet and random hwaddr
+iface usb0 inet static
+	address 192.168.7.2
+	netmask 255.255.255.0
+	network 192.168.7.0
+	gateway 192.168.7.1
+
+# Bluetooth networking
+iface bnep0 inet dhcp
+
diff --git a/recipes-core/netbase/netbase-5.0/omapl138/interfaces b/recipes-core/netbase/netbase-5.0/omapl138/interfaces
new file mode 100644
index 0000000..0acf4cf
--- /dev/null
+++ b/recipes-core/netbase/netbase-5.0/omapl138/interfaces
@@ -0,0 +1,31 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+ 
+# The loopback interface
+auto lo
+iface lo inet loopback
+
+# Wireless interfaces
+iface wlan0 inet dhcp
+	wireless_mode managed
+	wireless_essid any
+	wpa-driver wext
+	wpa-conf /etc/wpa_supplicant.conf
+
+iface atml0 inet dhcp
+
+# Wired or wireless interfaces
+auto eth0
+iface eth0 inet dhcp
+iface eth1 inet dhcp
+
+# Ethernet/RNDIS gadget (g_ether)
+# ... or on host side, usbnet and random hwaddr
+iface usb0 inet static
+	address 192.168.7.2
+	netmask 255.255.255.0
+	network 192.168.7.0
+	gateway 192.168.7.1
+
+# Bluetooth networking
+iface bnep0 inet dhcp
+
diff --git a/recipes-core/netbase/netbase-5.0/ti33x/interfaces b/recipes-core/netbase/netbase-5.0/ti33x/interfaces
new file mode 100644
index 0000000..0acf4cf
--- /dev/null
+++ b/recipes-core/netbase/netbase-5.0/ti33x/interfaces
@@ -0,0 +1,31 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+ 
+# The loopback interface
+auto lo
+iface lo inet loopback
+
+# Wireless interfaces
+iface wlan0 inet dhcp
+	wireless_mode managed
+	wireless_essid any
+	wpa-driver wext
+	wpa-conf /etc/wpa_supplicant.conf
+
+iface atml0 inet dhcp
+
+# Wired or wireless interfaces
+auto eth0
+iface eth0 inet dhcp
+iface eth1 inet dhcp
+
+# Ethernet/RNDIS gadget (g_ether)
+# ... or on host side, usbnet and random hwaddr
+iface usb0 inet static
+	address 192.168.7.2
+	netmask 255.255.255.0
+	network 192.168.7.0
+	gateway 192.168.7.1
+
+# Bluetooth networking
+iface bnep0 inet dhcp
+
diff --git a/recipes-core/netbase/netbase_5.0.bbappend b/recipes-core/netbase/netbase_5.0.bbappend
index 4b8d0e6..80e3a16 100644
--- a/recipes-core/netbase/netbase_5.0.bbappend
+++ b/recipes-core/netbase/netbase_5.0.bbappend
@@ -1,3 +1,4 @@
-THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
-FILESPATH =. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
+# look for files in this layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 
+PRINC = "1"
-- 
1.7.0.4


