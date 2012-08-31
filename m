Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3226AE002A5
	for <meta-ti@yoctoproject.org>; Fri, 31 Aug 2012 14:54:39 -0700 (PDT)
Received: by obbtb18 with SMTP id tb18so8256540obb.35
	for <meta-ti@yoctoproject.org>; Fri, 31 Aug 2012 14:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=R3XE89sOqjmwnjhoobqXnB8W2G3SREDCLSxAT7GCo6Q=;
	b=P5j0uBUIWCo6ajiez9KtxX82DnH1mv/IK9c9LqnohGFuCJQKLy6RM3Bm+vWIf36lhk
	J26pzV/Ev54/xytD5xJDe9CepVZ+L1MnITVEuc3y50bY0D1jKh5sUz1U/p4SgZ2E2gy7
	ZeWz7GbdkNepyECmLZAjB5O/vkBtrLAwERHLHA6RMtwjsfffHEc+6/h3FTQ/NxIZoYWS
	yJ4LaQzztDRF4iZPSnWrht+E9pJohl3WBc2gmAWPZk+j08F04bDT6U2uSTcUIFULMn8X
	TGmoAWOgV4zIGsaf7IeXRSyVSZHhU65SMq4oUSakYSlPeaMGZo5GV6DOI+VpFA57g4mV
	Qg/A==
Received: by 10.182.111.74 with SMTP id ig10mr9378910obb.14.1346450078778;
	Fri, 31 Aug 2012 14:54:38 -0700 (PDT)
Received: from ubuntu.am.dhcp.ti.com (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id l10sm3789512oeb.13.2012.08.31.14.54.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 31 Aug 2012 14:54:38 -0700 (PDT)
From: fcooperjr27@gmail.com
To: meta-ti@yoctoproject.org
Date: Fri, 31 Aug 2012 16:54:21 -0500
Message-Id: <1346450061-6913-2-git-send-email-fcooperjr27@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1346450061-6913-1-git-send-email-fcooperjr27@gmail.com>
References: <1346450061-6913-1-git-send-email-fcooperjr27@gmail.com>
Subject: [master][PATCH v3] netbase: Update interfaces files
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

* Update interfaces files based on changes made to the interfaces file
  in arago

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 recipes-core/netbase/netbase-5.0/omap3/interfaces  |   12 +++++++-----
 .../netbase/netbase-5.0/omapl138/interfaces        |   12 +++++++-----
 recipes-core/netbase/netbase-5.0/ti33x/interfaces  |   12 +++++++-----
 3 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/recipes-core/netbase/netbase-5.0/omap3/interfaces b/recipes-core/netbase/netbase-5.0/omap3/interfaces
index 0acf4cf..15bc31c 100644
--- a/recipes-core/netbase/netbase-5.0/omap3/interfaces
+++ b/recipes-core/netbase/netbase-5.0/omap3/interfaces
@@ -11,20 +11,22 @@ iface wlan0 inet dhcp
 	wpa-driver wext
 	wpa-conf /etc/wpa_supplicant.conf
 
+iface tiwlan0 inet dhcp
+	wireless_mode managed
+	wireless_essid any
+
 iface atml0 inet dhcp
 
 # Wired or wireless interfaces
 auto eth0
 iface eth0 inet dhcp
+        pre-up /bin/grep -v -e "ip=[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" /proc/cmdline > /dev/null
+
 iface eth1 inet dhcp
 
 # Ethernet/RNDIS gadget (g_ether)
 # ... or on host side, usbnet and random hwaddr
-iface usb0 inet static
-	address 192.168.7.2
-	netmask 255.255.255.0
-	network 192.168.7.0
-	gateway 192.168.7.1
+iface usb0 inet dhcp
 
 # Bluetooth networking
 iface bnep0 inet dhcp
diff --git a/recipes-core/netbase/netbase-5.0/omapl138/interfaces b/recipes-core/netbase/netbase-5.0/omapl138/interfaces
index 0acf4cf..15bc31c 100644
--- a/recipes-core/netbase/netbase-5.0/omapl138/interfaces
+++ b/recipes-core/netbase/netbase-5.0/omapl138/interfaces
@@ -11,20 +11,22 @@ iface wlan0 inet dhcp
 	wpa-driver wext
 	wpa-conf /etc/wpa_supplicant.conf
 
+iface tiwlan0 inet dhcp
+	wireless_mode managed
+	wireless_essid any
+
 iface atml0 inet dhcp
 
 # Wired or wireless interfaces
 auto eth0
 iface eth0 inet dhcp
+        pre-up /bin/grep -v -e "ip=[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" /proc/cmdline > /dev/null
+
 iface eth1 inet dhcp
 
 # Ethernet/RNDIS gadget (g_ether)
 # ... or on host side, usbnet and random hwaddr
-iface usb0 inet static
-	address 192.168.7.2
-	netmask 255.255.255.0
-	network 192.168.7.0
-	gateway 192.168.7.1
+iface usb0 inet dhcp
 
 # Bluetooth networking
 iface bnep0 inet dhcp
diff --git a/recipes-core/netbase/netbase-5.0/ti33x/interfaces b/recipes-core/netbase/netbase-5.0/ti33x/interfaces
index 0acf4cf..15bc31c 100644
--- a/recipes-core/netbase/netbase-5.0/ti33x/interfaces
+++ b/recipes-core/netbase/netbase-5.0/ti33x/interfaces
@@ -11,20 +11,22 @@ iface wlan0 inet dhcp
 	wpa-driver wext
 	wpa-conf /etc/wpa_supplicant.conf
 
+iface tiwlan0 inet dhcp
+	wireless_mode managed
+	wireless_essid any
+
 iface atml0 inet dhcp
 
 # Wired or wireless interfaces
 auto eth0
 iface eth0 inet dhcp
+        pre-up /bin/grep -v -e "ip=[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" /proc/cmdline > /dev/null
+
 iface eth1 inet dhcp
 
 # Ethernet/RNDIS gadget (g_ether)
 # ... or on host side, usbnet and random hwaddr
-iface usb0 inet static
-	address 192.168.7.2
-	netmask 255.255.255.0
-	network 192.168.7.0
-	gateway 192.168.7.1
+iface usb0 inet dhcp
 
 # Bluetooth networking
 iface bnep0 inet dhcp
-- 
1.7.0.4


