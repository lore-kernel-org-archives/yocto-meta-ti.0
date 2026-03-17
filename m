Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA578F33815
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 08:37:38 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71447.1773736654976264185
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 01:37:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bk/UNVwf;
 spf=pass (domain: konsulko.com, ip: 209.85.221.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439b94a19fdso4970159f8f.0
        for <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 01:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1773736653; x=1774341453; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GJUGmDyHFjZr8C3S/ObH0GyD/e8PF106Ds0hlgpD3lU=;
        b=bk/UNVwfo4F6CDKIVv5oEAQIipXaui5Q/av7JY6b4xdaYJF/igkRfhbjDlu11/C8M6
         H1hEkVR1rr8sppu2cyQavoAzRnR1q6IjcDE/do8Gujd4hHH8aO5WTt8MCq1Bkwf1GLIo
         YmkwwU/ofBkPlF4jm3A1vyyllvkSZswEnAHBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773736653; x=1774341453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJUGmDyHFjZr8C3S/ObH0GyD/e8PF106Ds0hlgpD3lU=;
        b=HIGF0lcO++fgqBqEo0RtFHJElB/qcy6mAL5YZO3yodljQMNZHEC1Su+OxNBLex0LqG
         ilGlYpbLG3iYgwwb7Pe+LpYJt5xBaXKBkeaFtWEgPP28TuewrOCF2wj17fQslIqNeQnc
         eFlEffYPpjVoFwDsXwtUSucfKzy7yCbdI0C2Q6ECjXxyTW5K51TK3Nk7Hrb39F2Y9svE
         fbz53uPiu+I9GxACLzpOp6zNychkfiFbF6JA5KHabtQqefavWOZu+EnQ+iUyhypFo/EU
         3ma1iFbgNhTvbeJlVjDGNgnUZgms6096cpCjt03k33y2SJ8Inl7rM1sSrM+LpS6foDb9
         6KOQ==
X-Gm-Message-State: AOJu0YwaqAxCpMStfy4ZLqTHfVRHQjcJSPkmOKGBf6nP4nrpPG5Le7Xp
	yrPVvVR52sCufm3bUJgzaGJj29IacmryBk2fgt6GC8v9H0hztd+IoODjDWwb2rY8XnF/hG1UYUW
	JclgG
X-Gm-Gg: ATEYQzy9p3eGU5YmWNngm9EaierKosIw1AktYWYp9giTqVE3D27qUwrfMh5GGH4nvwm
	LayqWfYdAlUz7CiEftP0zt2SI7K/+lKcre7b06Z75hk8ZtNShZ9dNTDPBMf/6MN77VNzlW4tOhD
	1DgJEpVeenxWxvT1B44GTUn+FooibkB0+gYmoyTlEDgwMeavGFXHaelFS3DAJk1MTPGERGG4Dcu
	cj2IO8sS9m54I4iouMDMsOLCHy4ihDYbjKprRWPuTr4/q1+oHUyJ/xYQEm0WQrkxfZ12Q22i+ht
	ezeX1D/TZ+KAlwU9Y24EIj88ehrHM+ov5grkl5N4uq8CSL3lN77TzkZaq/kFSLhLnZpA0L6NJxN
	NbZmqTWlEMWNggtvAf07FxnQm5K6nEzW9t8SIR4nF5+SJ6hQnmjpxKXt05Xca3f3+w/9sHjKI4A
	wsrfzJw+/vjMxO79+Zolrn2+ldo2pAYeWre8t1gxuM6pZTmhQ=
X-Received: by 2002:a05:6000:26d0:b0:43b:4489:d450 with SMTP id ffacd0b85a97d-43b4489d53emr10266732f8f.30.1773736652849;
        Tue, 17 Mar 2026 01:37:32 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b45e51681sm10604741f8f.25.2026.03.17.01.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 01:37:32 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: meta-ti@lists.yoctoproject.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-beagle][PATCHv2] u-boot-bb.org: Add a tick-timer for PocketBeagle
Date: Tue, 17 Mar 2026 10:37:29 +0200
Message-ID: <20260317083729.1640948-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 08:37:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19732

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


