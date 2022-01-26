Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.21286.1643238549372377196
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 15:09:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7070440CCD;
	Wed, 26 Jan 2022 23:09:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d8_Nq3SHuJST; Wed, 26 Jan 2022 23:09:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4757740CC6;
	Wed, 26 Jan 2022 23:09:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 55FB9174731;
	Wed, 26 Jan 2022 18:09:04 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [RFC][master][PATCH 09/19] init-ifupdown: remove default /etc/interfaces file for beagleboard
Date: Wed, 26 Jan 2022 18:08:49 -0500
Message-Id: <1643238539-20686-10-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643238539-20686-1-git-send-email-denis@denix.org>
References: <1643238539-20686-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

As beagleboard platform is being deprecated.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../init-ifupdown-1.0/beagleboard/interfaces       | 27 ----------------------
 .../init-ifupdown/init-ifupdown_1.0.bbappend       |  1 -
 2 files changed, 28 deletions(-)
 delete mode 100644 recipes-core/init-ifupdown/init-ifupdown-1.0/beagleboard/interfaces
 delete mode 100644 recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend

diff --git a/recipes-core/init-ifupdown/init-ifupdown-1.0/beagleboard/interfaces b/recipes-core/init-ifupdown/init-ifupdown-1.0/beagleboard/interfaces
deleted file mode 100644
index b6935c1..0000000
--- a/recipes-core/init-ifupdown/init-ifupdown-1.0/beagleboard/interfaces
+++ /dev/null
@@ -1,27 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
-
-# Wireless interfaces
-iface wlan0 inet dhcp
-	wireless_mode managed
-	wireless_essid any
-	wpa-driver wext
-	wpa-conf /etc/wpa_supplicant.conf
-
-iface atml0 inet dhcp
-
-# Wired or wireless interfaces
-auto eth0
-iface eth0 inet dhcp
-iface eth1 inet dhcp
-
-# Ethernet/RNDIS gadget (g_ether) or LAN9514 on BeagleBoard xM
-auto usb0
-iface usb0 inet dhcp
-
-# Bluetooth networking
-iface bnep0 inet dhcp
-
diff --git a/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend b/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
deleted file mode 100644
index 461ffeb..0000000
--- a/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-${PV}:"
-- 
2.7.4

