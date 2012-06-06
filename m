Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A848E01446
	for <meta-ti@yoctoproject.org>; Wed,  6 Jun 2012 08:07:49 -0700 (PDT)
Received: by mail-ee0-f48.google.com with SMTP id b45so2592017eek.35
	for <meta-ti@yoctoproject.org>; Wed, 06 Jun 2012 08:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=1XCjSBnxHGE808CGaK8SWDuT9w13Qagp+zup58cYA3U=;
	b=HQpBe3IH6n1iQwVSYSv4aKZKtUhfKqLrAMPOP9chZbKDE2v5hfg7GJqd4Vu4VNQl5d
	A0FFRKWRp4G4diHUPPgTcl/AnPzE9q4gmyIYpIuhNPjHFopF7KbTvb30bz4PgQMEJN24
	/c+Po/TzJ24zRMs7kvV/r5uTc0hwonVSY5CDuDSqIY+YAU5K64eC39OUygxMWQR/3RJd
	KoIZfRRV5A2aOCLZR8Nkdfdjc22FQYu88p0JxFR9vQ3LfbAp94rH+pK1Y3DoTpPHMWmS
	+rD8V7fqgyq/Nb1FH6QNzmTvgxFCk8ZMtDlui5uYKffMKf4smkd0m767Nm+BSt8tCp7Y
	XNLA==
Received: by 10.14.99.129 with SMTP id x1mr9214600eef.108.1338995269095;
	Wed, 06 Jun 2012 08:07:49 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id y54sm322107eef.10.2012.06.06.08.07.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jun 2012 08:07:48 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Wed,  6 Jun 2012 17:07:29 +0200
Message-Id: <1338995250-10721-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1338995250-10721-1-git-send-email-koen@dominion.thruhere.net>
References: <1338995250-10721-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlJwwYXWFopxnE6kWdaA37og1X5s0dJHyZ/HFtfdRJWid9SDLnIvA0l4GQ4KSHQVx3/XIgZ
Cc: denys@ti.com
Subject: [PATCH 5/6] beaglebone-capes: add support for 4.3" LCD cape
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
X-List-Received-Date: Wed, 06 Jun 2012 15:07:49 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/beagleboard/beaglebone-capes.bb           |    2 +-
 recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh |    3 +++
 recipes-ti/beagleboard/beaglebone-capes/cape.sh      |    4 ++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/recipes-ti/beagleboard/beaglebone-capes.bb b/recipes-ti/beagleboard/beaglebone-capes.bb
index f128924..2a9f1fb 100644
--- a/recipes-ti/beagleboard/beaglebone-capes.bb
+++ b/recipes-ti/beagleboard/beaglebone-capes.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Userspace setup for beaglebone capes"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r1"
+PR = "r2"
 
 inherit allarch
 
diff --git a/recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh b/recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh
index a08498d..4950017 100755
--- a/recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh
+++ b/recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh
@@ -5,6 +5,9 @@ for eeprom in /sys/bus/i2c/devices/3-005*/eeprom ; do
 		"BB-BONE-LCD3-01.")
 				echo "Turning off backlight for LCD3 cape"
 				i2cset -f -y 1 0x24 0x07 0x00;;
+		"BB-BONE-LCD4-01.")
+				echo "Turning off backlight for LCD3 cape"
+				i2cset -f -y 1 0x24 0x07 0x00;;
 		*)
 				echo "unknown cape: $PARTNUMBER";;
 	esac
diff --git a/recipes-ti/beagleboard/beaglebone-capes/cape.sh b/recipes-ti/beagleboard/beaglebone-capes/cape.sh
index 69accff..61240a5 100755
--- a/recipes-ti/beagleboard/beaglebone-capes/cape.sh
+++ b/recipes-ti/beagleboard/beaglebone-capes/cape.sh
@@ -6,6 +6,10 @@ for eeprom in /sys/bus/i2c/devices/3-005*/eeprom ; do
 				echo "Turning on backlight for LCD3 cape"
 				i2cset -f -y 1 0x24 0x07 0x09
 				i2cset -f -y 1 0x24 0x08 0x60;;
+		"BB-BONE-LCD4-01.")
+				echo "Turning on backlight for LCD4 cape"
+				i2cset -f -y 1 0x24 0x07 0x09
+				i2cset -f -y 1 0x24 0x08 0x60;;
 		*)
 				echo "unknown cape: $PARTNUMBER";;
 	esac
-- 
1.7.10


