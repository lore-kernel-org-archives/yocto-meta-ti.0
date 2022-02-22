Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.8790.1645503199092440823
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:13:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 95D7840C52
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 33mAynAorDGX for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:13:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 95F7D40C86
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:15 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 558D7174774
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:13:15 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 10/19] formfactor: remove beagleboard-specific configs
Date: Tue, 22 Feb 2022 04:13:05 +0000
Message-Id: <20220222041314.2840028-11-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041314.2840028-1-denis@denix.org>
References: <20220222041314.2840028-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

As beagleboard platform is being deprecated.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/formfactor/formfactor/beagleboard/machconfig | 3 ---
 recipes-bsp/formfactor/formfactor_0.0.bbappend           | 1 -
 2 files changed, 4 deletions(-)
 delete mode 100755 recipes-bsp/formfactor/formfactor/beagleboard/machcon=
fig
 delete mode 100644 recipes-bsp/formfactor/formfactor_0.0.bbappend

diff --git a/recipes-bsp/formfactor/formfactor/beagleboard/machconfig b/r=
ecipes-bsp/formfactor/formfactor/beagleboard/machconfig
deleted file mode 100755
index a46859f1..00000000
--- a/recipes-bsp/formfactor/formfactor/beagleboard/machconfig
+++ /dev/null
@@ -1,3 +0,0 @@
-# Assume a USB mouse and touchscreen are connected
-HAVE_TOUCHSCREEN=3D0
-HAVE_KEYBOARD=3D1
diff --git a/recipes-bsp/formfactor/formfactor_0.0.bbappend b/recipes-bsp=
/formfactor/formfactor_0.0.bbappend
deleted file mode 100644
index 4fc41d05..00000000
--- a/recipes-bsp/formfactor/formfactor_0.0.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
--=20
2.25.1

