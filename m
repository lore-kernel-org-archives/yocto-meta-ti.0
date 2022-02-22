Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.8966.1645503198250058033
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:13:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8C96240C5D
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aUJCAWu7gUFf for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:13:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8FAA940C7F
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:15 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 5387C174738
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:13:15 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 09/19] init-ifupdown: remove default /etc/interfaces file for beagleboard
Date: Tue, 22 Feb 2022 04:13:04 +0000
Message-Id: <20220222041314.2840028-10-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041314.2840028-1-denis@denix.org>
References: <20220222041314.2840028-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

As beagleboard platform is being deprecated.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../init-ifupdown-1.0/beagleboard/interfaces  | 27 -------------------
 .../init-ifupdown/init-ifupdown_1.0.bbappend  |  1 -
 2 files changed, 28 deletions(-)
 delete mode 100644 recipes-core/init-ifupdown/init-ifupdown-1.0/beaglebo=
ard/interfaces
 delete mode 100644 recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend

diff --git a/recipes-core/init-ifupdown/init-ifupdown-1.0/beagleboard/int=
erfaces b/recipes-core/init-ifupdown/init-ifupdown-1.0/beagleboard/interf=
aces
deleted file mode 100644
index b6935c11..00000000
--- a/recipes-core/init-ifupdown/init-ifupdown-1.0/beagleboard/interfaces
+++ /dev/null
@@ -1,27 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
-=20
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
diff --git a/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend b/reci=
pes-core/init-ifupdown/init-ifupdown_1.0.bbappend
deleted file mode 100644
index 461ffebe..00000000
--- a/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-${PV}:"
--=20
2.25.1

