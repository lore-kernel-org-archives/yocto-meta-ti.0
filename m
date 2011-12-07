Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f181.google.com (mail-ey0-f181.google.com
	[209.85.215.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F0AF4E00735
	for <meta-ti@lists.yoctoproject.org>;
	Wed,  7 Dec 2011 06:42:24 -0800 (PST)
Received: by mail-ey0-f181.google.com with SMTP id l13so631929eaa.26
	for <meta-ti@lists.yoctoproject.org>;
	Wed, 07 Dec 2011 06:42:24 -0800 (PST)
Received: by 10.213.28.8 with SMTP id k8mr3614461ebc.61.1323268944457;
	Wed, 07 Dec 2011 06:42:24 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id c9sm6337171eeb.0.2011.12.07.06.42.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 06:42:23 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Wed,  7 Dec 2011 15:42:14 +0100
Message-Id: <1323268934-11949-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1323268934-11949-1-git-send-email-koen@dominion.thruhere.net>
References: <1323268934-11949-1-git-send-email-koen@dominion.thruhere.net>
Subject: [PATCH 3/3] omap4430-panda: switch to u-boot-spl
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
X-List-Received-Date: Wed, 07 Dec 2011 14:42:25 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 conf/machine/omap4430-panda.conf |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/conf/machine/omap4430-panda.conf b/conf/machine/omap4430-panda.conf
index 8f9f86e..d6572ee 100644
--- a/conf/machine/omap4430-panda.conf
+++ b/conf/machine/omap4430-panda.conf
@@ -4,10 +4,7 @@
 
 require conf/machine/include/omap3.inc
 
-EXTRA_IMAGEDEPENDS = "x-load u-boot-sakoman "
-
-XLOAD_MACHINE = "omap4430panda_config"
-XLOAD_LOAD_ADDRESS = 0x40304350
+EXTRA_IMAGEDEPENDS = "u-boot "
 
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-sakoman"
 UBOOT_MACHINE = "omap4_panda_config"
-- 
1.7.2.5


