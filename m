Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B6F68E0030B
	for <meta-ti@yoctoproject.org>; Tue,  1 May 2012 12:07:21 -0700 (PDT)
Received: by wibhr14 with SMTP id hr14so3467742wib.11
	for <meta-ti@yoctoproject.org>; Tue, 01 May 2012 12:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=s1eqVlazETkxjw7VSAjkv8Mse+kfnFlE/a+8WMcsAJU=;
	b=kDEPDX3FG/1Syfoh8MFAF2CxvZIxCVl9h9Wy9+NyqRIusZdnRSi4Y086SMO7BysfFU
	2UNXWY9BC6F3JRty5GJhun8bjqvDhITO5F9QVif04YYz5I6wS3WU3ZSn8lzai6+vb2+g
	By/PzsDe/McxUTtSWPaO0Tq+hfDZTqfPWZKfCA8PFOX6j4+GTSd2qgT54mP1qsx76XHE
	TUUWSA/vwxGKhmAS0fCKS+e/lb8T4GOhvU38+oMjVaCkmBMR86uLg8nFJKKKdVgnci7G
	KJkW5p9ye8FpFUWU6rvKCUwlHtB7Uup0at4vu8NKo5/2MtK9bl1JQRLRgtmYJH+VZHAf
	sWjA==
Received: by 10.180.77.233 with SMTP id v9mr7237876wiw.22.1335899240038;
	Tue, 01 May 2012 12:07:20 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id e6sm38504863wix.8.2012.05.01.12.07.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 12:07:19 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Tue,  1 May 2012 21:06:49 +0200
Message-Id: <1335899212-29869-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1335899212-29869-1-git-send-email-koen@dominion.thruhere.net>
References: <1335899212-29869-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmCwC/hLYGsEVP9KTTnbQCZVDhu3w75tG4jlQ7kZFEqwtGPcujNO/hau18JqG7mEH+VTQa/
Subject: [RFC][PATCH 2/5] beagleboard: switch to linux-mainline and drag in more modules
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
X-List-Received-Date: Tue, 01 May 2012 19:07:22 -0000

also bump MACHINE_KERNEL_PR to force rebuild of external modules like sgx and dsp.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 conf/machine/beagleboard.conf  |    5 ++++-
 conf/machine/include/omap3.inc |    2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
index 0043a70..a9029d1 100644
--- a/conf/machine/beagleboard.conf
+++ b/conf/machine/beagleboard.conf
@@ -17,7 +17,7 @@ require conf/machine/include/omap3.inc
 # SPL build
 EXTRA_IMAGEDEPENDS = "u-boot"
 
-PREFERRED_PROVIDER_virtual/kernel = "linux"
+PREFERRED_PROVIDER_virtual/kernel = "linux-mainline"
 
 IMAGE_FSTYPES += "tar.bz2 ubi"
 EXTRA_IMAGECMD_jffs2 = "-lnp "
@@ -46,3 +46,6 @@ UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
 
 # and sdio
 MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa"
+
+# For a modularized kernel we want to drag in networking, sound, rtc etc."
+MACHINE_EXTRA_RRECOMMENDS = "kernel-module-smsc95xx kernel-module-snd-soc-twl4030 kernel-module-rtc-twl"
diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 9903856..c5b1979 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r119"
+MACHINE_KERNEL_PR = "r120"
 
 KERNEL_IMAGETYPE = "uImage"
 
-- 
1.7.10


