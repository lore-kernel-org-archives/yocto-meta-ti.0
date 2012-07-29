Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A84FE0144D
	for <meta-ti@yoctoproject.org>; Sun, 29 Jul 2012 10:09:12 -0700 (PDT)
Received: by mail-ey0-f176.google.com with SMTP id b14so971369eaa.35
	for <meta-ti@yoctoproject.org>; Sun, 29 Jul 2012 10:09:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=HbdOa/KkkM2OGXFdpaEPD03FI4HRKccbjJO7JoC8x8U=;
	b=KGFZiJ8w/pgmvXp3EgnR5VLQkddqZhaQUknFr0uqDzsL3vN00AddkvUzoO5H7QKkW5
	+j2twwv8eJPo0LBW0eDzFGIYS+Djl8r8PNm5Eekbi0tDUzaQksjzo08H1blfeRNVhc3I
	kFYukZJE2sQKTbRTdh9iNoawfVuwIVj4M9fyhcvuy3+jv3esSjkHDw/eekCecAmASy5O
	vbNIFB8q4cSe75Hmz3dj3ptmWyywOHdIU5GYK1SHxehbBonQFblTPwzYOTscJGL51a4c
	sIJIm86Ex9Otm6D1qLdzBhFCS/RszG+qIDUftDMpSBIssQcJqut12ux4eTl/ulWzpIkN
	/Dyg==
Received: by 10.14.218.5 with SMTP id j5mr3507256eep.16.1343581752038;
	Sun, 29 Jul 2012 10:09:12 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id t6sm21523401eeo.17.2012.07.29.10.09.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Jul 2012 10:09:10 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Sun, 29 Jul 2012 19:08:26 +0200
Message-Id: <1343581714-20397-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1343581714-20397-1-git-send-email-koen@dominion.thruhere.net>
References: <1343581714-20397-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnZ6xfQxIoHeFhplj6oEW6j21h84aLiJ/Jsu0k/s0uwgavdjsqwFTQh+Mn9zDcrTQJe6i9P
Subject: [PATCH][for-denzil 04/12] linux-ti33x-psp 3.2: fix audio/spidev clash on beaglebone
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
X-List-Received-Date: Sun, 29 Jul 2012 17:09:12 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../0072-beaglebone-fix-audio-spi-clash.patch      |   25 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    3 ++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0072-beaglebone-fix-audio-spi-clash.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0072-beaglebone-fix-audio-spi-clash.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0072-beaglebone-fix-audio-spi-clash.patch
new file mode 100644
index 0000000..a916ad5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0072-beaglebone-fix-audio-spi-clash.patch
@@ -0,0 +1,25 @@
+From 45ddec832968e3c1e31cf38a891372ba80027e2d Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 26 Jun 2012 08:39:04 +0200
+Subject: [PATCH] beaglebone: fix audio/spi clash
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index f6559b6..d0681a2 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -2910,6 +2910,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		
+ 		beaglebone_leds_free = 0;
+ 		dvileds_init(0,0);
++		beaglebone_spi1_free = 0;
+ 		mcasp0_init(0,0);
+ 	
+ 		if (!strncmp("00A1", cape_config.version, 4) || !strncmp("000A", cape_config.version, 4)) {
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 645d4dc..ab42c44 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -15,7 +15,7 @@ PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", "3.2.21", d)}"
 
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
-MACHINE_KERNEL_PR_append = "a+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -1536,4 +1536,5 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0069-beaglebone-add-support-for-LCD3-rev-A1.patch \
 	file://beaglebone/0070-beaglebone-fix-buttons-spidev-clash-when-using-mcasp.patch \
 	file://beaglebone/0071-beaglebone-fix-LCD3-led-key-overlap.patch \
+	file://beaglebone/0072-beaglebone-fix-audio-spi-clash.patch \
 "
-- 
1.7.10


