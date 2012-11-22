Return-Path: <ndec13@gmail.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 011C1E003DA
	for <meta-ti@yoctoproject.org>; Thu, 22 Nov 2012 06:36:32 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAMEaWLd016542
	for <meta-ti@yoctoproject.org>; Thu, 22 Nov 2012 08:36:32 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAMEaW9M029694
	for <meta-ti@yoctoproject.org>; Thu, 22 Nov 2012 08:36:32 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 22 Nov 2012 08:36:32 -0600
Received: from localhost.localdomain (lncpu06.tif.ti.com [137.167.138.194])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAMEaG1j000479;
	Thu, 22 Nov 2012 08:36:31 -0600
From: Nicolas Dechesne <ndec13@gmail.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 22 Nov 2012 15:35:59 +0100
Message-ID: <1353594959-18237-4-git-send-email-ndec13@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1353594959-18237-1-git-send-email-ndec13@gmail.com>
References: <1353594959-18237-1-git-send-email-ndec13@gmail.com>
MIME-Version: 1.0
Cc: Nicolas Dechesne <n-dechesne@ti.com>
Subject: [PATCH 3/3] conf/machine: omap4: update configs after xorg upgrade
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
X-List-Received-Date: Thu, 22 Nov 2012 14:36:33 -0000
Content-Type: text/plain

From: Nicolas Dechesne <n-dechesne@ti.com>

There were some changes in the xserver-xorg upstream project that need
to be reflected here too:
 * extmod module was removed completely as it became empty;
 * DRI1, DRI2, DBE (among others) were made built-in;

(see poky rev: 5cea09e3d010d4799eab296b2a0cb83a0af09c76)

Signed-off-by: Nicolas Dechesne <n-dechesne@ti.com>
---
 conf/machine/include/omap4.inc |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/conf/machine/include/omap4.inc b/conf/machine/include/omap4.inc
index ecd23c4..5ee5f9d 100644
--- a/conf/machine/include/omap4.inc
+++ b/conf/machine/include/omap4.inc
@@ -8,9 +8,6 @@ PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
 
 PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
 XSERVER = "xserver-xorg \
-           xserver-xorg-extension-dri \
-           xserver-xorg-extension-dri2 \
-           xserver-xorg-extension-glx \
            xserver-xorg-module-exa \
            xf86-input-evdev \
            xf86-video-omap"
-- 
1.7.0.4


