Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E593EE0140C
	for <meta-ti@yoctoproject.org>; Tue,  1 May 2012 12:07:24 -0700 (PDT)
Received: by wgbfg15 with SMTP id fg15so613313wgb.11
	for <meta-ti@yoctoproject.org>; Tue, 01 May 2012 12:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=/Zfa+yXQGFnnTBHwadvdhVq6qxfnHXH8FHdpSyt4Ie0=;
	b=Nvjcyxvopt9VQh5YsTYMcLs91YB1sVXqNIU/gky0xhF1X1NOrYpQt8d0YhiS9NRLY/
	j6c3fpC04tTfXeKZEGb8xwGFZivRwN7IExdUm0WiZZfVjbrRBU20070JFyo3nRIqa/w4
	AvV3IrbxmsgaYuTbEpSWbtb+60Fx+LNl9VOHQJlPoxQVK5wyaGQB1A9kuk/e8xHbwqk5
	TcH4JifTWlgCNW17ll2zZ87Uv/IPr6jDH4l8Rlc3uSee/0CmacNEHbgBOmxLB4gEzG7c
	gYSq28Qi2Zmn6E/yg3+yEs5NkF8bFF/OvhQyfyFpFjHQfVZyau/t3pbP45nSL2PcDDsW
	TJZA==
Received: by 10.216.137.100 with SMTP id x78mr16069764wei.72.1335899243991;
	Tue, 01 May 2012 12:07:23 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm60754844wib.8.2012.05.01.12.07.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 12:07:23 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Tue,  1 May 2012 21:06:51 +0200
Message-Id: <1335899212-29869-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1335899212-29869-1-git-send-email-koen@dominion.thruhere.net>
References: <1335899212-29869-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlo2sAL3UATxShqZZgtOrMto8HyR8Rf0CDcrJAmFzCpDTeHSkdr//j+M1NmlruvGrtymnVD
Subject: [RFC][PATCH 4/5] u-boot 2011.12: don't poke at uLCD7 settings from u-boot, it's handled in the kernel now
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
X-List-Received-Date: Tue, 01 May 2012 19:07:25 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../0003-beagleboard-add-support-for-scanning-loop-through-ex.patch  |    2 +-
 recipes-bsp/u-boot/u-boot_2011.12.bb                                 |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot/2011.12/0003-beagleboard-add-support-for-scanning-loop-through-ex.patch b/recipes-bsp/u-boot/u-boot/2011.12/0003-beagleboard-add-support-for-scanning-loop-through-ex.patch
index 71dd2bb..1bbe14e 100644
--- a/recipes-bsp/u-boot/u-boot/2011.12/0003-beagleboard-add-support-for-scanning-loop-through-ex.patch
+++ b/recipes-bsp/u-boot/u-boot/2011.12/0003-beagleboard-add-support-for-scanning-loop-through-ex.patch
@@ -62,7 +62,7 @@ index 9c2e6d0..5ea50d1 100644
 +		printf("Recognized BeagleBoardToys uLCD-lite board\n");
 +		setenv("buddy2", "bbtoys-ulcd");
 +		setenv("defaultdisplay", "lcd");
-+		setenv("uenvcmd", "i2c dev 1 ; i2c mw 40 00 00; i2c mw 40 04 80; i2c mw 40 0d 05; i2c mw 40 0d 15");
++		//setenv("uenvcmd", "i2c dev 1 ; i2c mw 40 00 00; i2c mw 40 04 80; i2c mw 40 0d 05; i2c mw 40 0d 15");
 +		break;
 +	case BEAGLE_NO_EEPROM:
 +		printf("No EEPROM on expansion board\n");
diff --git a/recipes-bsp/u-boot/u-boot_2011.12.bb b/recipes-bsp/u-boot/u-boot_2011.12.bb
index 9bbd31e..9616a05 100644
--- a/recipes-bsp/u-boot/u-boot_2011.12.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.12.bb
@@ -6,7 +6,7 @@ UBOOT_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
 UBOOT_SYMLINK = "u-boot-${MACHINE}.img"
 
 PV = "2011.12"
-PR = "r6"
+PR = "r7"
 
 # No patches for other machines yet
 COMPATIBLE_MACHINE = "(beagleboard|pandaboard|hawkboard|am3517-evm|am37x-evm|omap3evm)"
-- 
1.7.10


