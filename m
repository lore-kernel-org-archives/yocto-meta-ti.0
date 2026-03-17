Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 026E5FD876B
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 13:38:00 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76083.1773754669947970307
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 06:37:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=lSj8zlW6;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso66158205e9.0
        for <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 06:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1773754668; x=1774359468; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kL3KIVYYkv1wgUhoW51qpubrdqTE309mUldVQL6CrLA=;
        b=lSj8zlW6CLBnHzsXLMkkxW/D0cL8P95JxQTXndtJLkg8TYWTaAzkicvEbsHt6wrOXh
         Ty4t7ikSI6liWi7OhiXZR7bejdmbkkinxK5cWeTfaWalXt3qqIVKf7A+D6mOy7WQ529C
         Wx3+A6eCnU06Dg9egdcIGZYfMmKJVPDU4s5ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773754668; x=1774359468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kL3KIVYYkv1wgUhoW51qpubrdqTE309mUldVQL6CrLA=;
        b=rDQL2/UeX2IqlBSR9BA0rRbAsE9BXaXWVwPex3mil5oNjhQ1p31pOa24xiyDENqVwt
         KBkmSPgIXOjMhUsiYxam+ZBGUckOwvJk6nSjoznIzRb+osJGPXywR86JYvS3Vowu+oRe
         rxQG0Hwb6ciSL/4ZOkQF4suAGbx2TDV5gAFphVgaDB/ljH2HYseSrYztgk4f4Jjd5Tzn
         snQWJswbdhZSRfinD82BmmhxiMiih2zEdc88wgocuM49Qy5bj/hKnR3oVT6bzvcc842R
         M0J6hE1MojWp4/smuudf10+feVkqet6ZG7Lhz3kElMvfWfQOWfcAkATSH5YE4m0xcJTB
         2o0A==
X-Gm-Message-State: AOJu0YxBVnwj4Y5MMSCvlTaMbWcZ6G/cLFD22qUJL+sMwR9fraqejIeR
	7bkOYLbKS3tXm/pBd0Q1Rx14cblyr36bKJQQU12xhRlGGLKEDIOMlPp5A4yKhGMRXvFkqax5yD/
	tGnip
X-Gm-Gg: ATEYQzyOFH6LAySU3TMjPsAXgF+L3ByDg2GSaTXO93Fv/5TlWpjUD04gkyY5garErkM
	F2AfpA8Ai45Lz3aP+7tqDd9UiQEcGFGJHnoRCMtWiN6TRW2dr54kWIfemRKKotZ4GtMBZsH8q2h
	LfSBK63EMOSoARUgucOd21jO4lRhACXS6JFL0I5F/CInODAmJ1mWbYiN3KT8ZkWulhYWzfUdFPS
	KqLiV4mCpsB8ALwihbOEYRflQLj3ThbOYT6uk2h1iRcq9oDACMiCKPjluh8zxpCnXM7frvopjCG
	kmaNyQzYbibtcCXgOyfQoVzgmXAM1QRCWvXMMM9GjUvE6jtNjc2BYFhwymYio/IJAToSstegfOE
	ty+TCI2cbG3xE20z+SzCe/HPQeHnbYifdBEr6ip5M3GP8s5cc7jKKdWctpnPxe3e2V5tTyP9Uue
	RsDCsSh7O2ifBt6XhY0KRk1Tohz+AdQs5cKj7J
X-Received: by 2002:a05:600c:8b46:b0:477:b734:8c53 with SMTP id 5b1f17b1804b1-485566d7092mr280506825e9.12.1773754667673;
        Tue, 17 Mar 2026 06:37:47 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea98070sm65979105e9.6.2026.03.17.06.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 06:37:46 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: meta-ti@lists.yoctoproject.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-beagle][PATCHv3] u-boot-bb.org: Add a tick-timer for PocketBeagle
Date: Tue, 17 Mar 2026 15:37:43 +0200
Message-ID: <20260317133743.419092-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 13:38:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19736

Add a chosen tick-timer in version 2025.10 to boot on PocketBeagle.

Fixes:

CPU  : AM335X-GP rev 2.1
Model: TI AM335x PocketBeagle
DRAM:  512 MiB
Core:  155 devices, 16 uclasses, devicetree: separate
Could not initialize timer (err -19)

The patch is based on the following related discussions:

- arm: dts: am335x-*-u-boot: Add chosen tick-timer
https://lists.denx.de/pipermail/u-boot/2026-January/608684.html

- pocketbeagle stuck in boot loop with timer error
https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=269124

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...s-am335x-pocketbeagle-Add-tick-timer.patch | 29 +++++++++++++++++++
 .../u-boot/u-boot-bb.org_2025.10.bb           |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.10+git/0001-arm-dts-am335x-pocketbeagle-Add-tick-timer.patch

diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.10+git/0001-arm-dts-am335x-pocketbeagle-Add-tick-timer.patch b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.10+git/0001-arm-dts-am335x-pocketbeagle-Add-tick-timer.patch
new file mode 100644
index 00000000..424a4bb3
--- /dev/null
+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.10+git/0001-arm-dts-am335x-pocketbeagle-Add-tick-timer.patch
@@ -0,0 +1,29 @@
+From 55ee5fecd68d0858ba6743137162252adedf2f72 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Mon, 16 Mar 2026 18:34:58 +0000
+Subject: [PATCH] arm: dts: am335x-pocketbeagle: Add tick-timer
+
+Add a binding for the tick-timer for PocketBeagle.
+
+Upstream-Status: Pending [https://lists.denx.de/pipermail/u-boot/2026-January/608684.html]
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ arch/arm/dts/am335x-pocketbeagle.dts | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/arm/dts/am335x-pocketbeagle.dts b/arch/arm/dts/am335x-pocketbeagle.dts
+index b379e3a5570..02e3aac5606 100644
+--- a/arch/arm/dts/am335x-pocketbeagle.dts
++++ b/arch/arm/dts/am335x-pocketbeagle.dts
+@@ -15,6 +15,7 @@
+ 
+ 	chosen {
+ 		stdout-path = &uart0;
++		tick-timer = &timer2;
+ 	};
+ 
+ 	leds {
+-- 
+2.53.0
+
diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb
index 5a8abec0..1c4f0691 100644
--- a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb
+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb
@@ -17,3 +17,4 @@ SRCREV:pocketbeagle2 = "4e0b6294a1185029d34eff6ed91f3ad1734b643f"
 SRCREV:pocketbeagle2-k3r5 = "4e0b6294a1185029d34eff6ed91f3ad1734b643f"
 
 SRC_URI:append:pocketbeagle2 = " file://bootcmd-ti-mmc.cfg"
+SRC_URI:append:beaglebone = " file://0001-arm-dts-am335x-pocketbeagle-Add-tick-timer.patch"
-- 
2.47.3


