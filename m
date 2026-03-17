Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B85F33812
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 08:24:48 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71330.1773735879133180696
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 01:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=B7oBdZdy;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4856cd3f1ffso12757195e9.3
        for <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 01:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1773735877; x=1774340677; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yu7HEjDdtZUYiU8s3MCNuNDlcgrf02q9oFnF2n689K0=;
        b=B7oBdZdylBD22imA4p8XiEDuQ9n4js0xIJimcH50mOVb2yGIlCdIz6skdf/MF3btQI
         HZoHGy9tJQ+Or4XoNmJS4EONNbgA5eF6b2bxAD+FAsxq4yqBfPAKNh4EnyaVtnwTJaUn
         avz6sva1FLCXqcQ0V5rGltw0EZIBBVlpuw82g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773735877; x=1774340677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yu7HEjDdtZUYiU8s3MCNuNDlcgrf02q9oFnF2n689K0=;
        b=PWVXXllFllkkUo2UctRuvCATeX6x6gGz7zhI3GpJpCPUL0Tc1DYioo62j2dpUIHAQ0
         r3su0NHshonKa6w2Avt3+rblEjujLrbGPzFtoyfM+s3iHOuH8Qze8lU5R0SYnafzeivO
         vWtTdW9RqEWrvEdumP/QfbF+KM0bdCrVHlBjAzD3upn43OUK1xWiUgiE+CiG93MLAZxg
         YlEdKrWVBsvnJEsDL7I7PqvyZEdrKYmvA03m5tEcOszCTF71cEIZ4K3pftyuwA0bmlsT
         JlGypCpFyollGso9nVLyszUK+S6XpvWZKnkv7mRNX2OyaiNo1wZH/StGTlZh9Mz2cA1m
         Yj0A==
X-Gm-Message-State: AOJu0Yxanu39vdAuX9vPR1Da3BGj4Sj2bBJivvBpRLTqTySH/1T4nzIk
	v1WXMzmKPmqRvUm4K8FRIaREv3GLlxLd46kvgT8zB0hzRZkIK6SZxVQmwdB5GfekirHypoeHaF+
	Xk9ya
X-Gm-Gg: ATEYQzxNXJFSo9fJ17+FsKe5KTuu6OhKeIimo/rzeJZ0dmblZ77got77yeix/XfmW+0
	5azWFTXd2i+DnnnqGR7DbQXHQWaI9FBpzATlf8hLjHHUKmPAvC51XZNOovLR6s+sQf8dqwkWoNM
	dGMGq6r70uwk1/D9LaC3FpQyDuV35komA5yGr9qMvxmkG6M8WI/euXNh5K2QaPUArW7tKpVlFZ/
	ICHiMJPbMP0Kdnln9CbBNLxvQ1iFFuGpOLi5qpxs7hRG6u40P4cUHIAfUjr4EJXcgOkyFliEysd
	q1FTPkBfAG5uVs6At21DWkVk8Z84Fm47iU9nbPkcP/+BRM5EWDxR2NsNKIXLZ00AySgHmylLUnI
	UGU2u3T4Mlx62RdMWDtTllmasUPncyQ9hs/ynz3Sg24IY7wdHegNCRLKlj1diaUL1aGaVgBmnvm
	VDebacBE+eJIP/fYwyPGVmyYynmDvPLOjiK7KX
X-Received: by 2002:a05:600c:8b46:b0:485:3171:7845 with SMTP id 5b1f17b1804b1-485566ca8femr280970905e9.4.1773735876962;
        Tue, 17 Mar 2026 01:24:36 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c89186sm277799035e9.1.2026.03.17.01.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 01:24:36 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: meta-ti@lists.yoctoproject.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-beagle][PATCH] u-boot-bb.org-2025.10+git: Fix PocketBeagle
Date: Tue, 17 Mar 2026 10:24:33 +0200
Message-ID: <20260317082433.1640889-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 08:24:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19730

Add chosen tick-timer to boot on PocketBeagle.

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
 1 file changed, 29 insertions(+)
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
-- 
2.47.3


