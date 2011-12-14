Return-Path: <schnitzeltony@gmx.de>
Received: from mailout-de.gmx.net (mailout-de.gmx.net [213.165.64.22])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id A3AA5E00305
	for <meta-ti@yoctoproject.org>; Wed, 14 Dec 2011 02:26:32 -0800 (PST)
Received: (qmail invoked by alias); 14 Dec 2011 10:26:30 -0000
Received: from ip-95-222-156-232.unitymediagroup.de (EHLO
	zera-git-ew.zera.local) [95.222.156.232]
	by mail.gmx.net (mp062) with SMTP; 14 Dec 2011 11:26:30 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19ZsP95LXRZqGICM7VaH+hRScPIkoAytUACBXGWH9
	kZYqQLzU5OvT5y
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: meta-ti@yoctoproject.org
Date: Wed, 14 Dec 2011 11:26:41 +0100
Message-Id: <1323858401-15332-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.6.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [PATCH] omap3.inc: adjust UBOOT_ENTRYPOINT and UBOOT_LOADADRESS to u-boot SPL changes
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Dec 2011 10:26:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 conf/machine/include/omap3.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 4530ae1..2198281 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -7,8 +7,8 @@ MACHINE_KERNEL_PR = "r113"
 
 KERNEL_IMAGETYPE = "uImage"
 
-UBOOT_ENTRYPOINT = "0x80008000"
-UBOOT_LOADADDRESS = "0x80008000"
+UBOOT_ENTRYPOINT = "0x80010000"
+UBOOT_LOADADDRESS = "0x80010000"
 
 EXTRA_IMAGEDEPENDS += "u-boot x-load"
 
-- 
1.7.6.4


