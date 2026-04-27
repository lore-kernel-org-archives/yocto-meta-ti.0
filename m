Return-Path: <fra.schnyder@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2212FF8860
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 16:25:00 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71.1777307092533599459
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 27 Apr 2026 09:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eIqHw1Q5;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: fra.schnyder@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b0046078so95651715e9.1
        for <meta-ti@lists.yoctoproject.org>; Mon, 27 Apr 2026 09:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777307091; x=1777911891; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sr/2dUgH4TaQVOxNt5LgmdgzwpX35PiqNHahYfkoMWQ=;
        b=eIqHw1Q50ugX3VmKIima1nudHIhyQY64luNaZQ0T9wxtVqmTTpyhGpofBy7ANfdeyW
         Arlcxk368BYlyac/Z9Y/uFHAZ27XqMUPvks0yqoDq/Nb5/D59Z/mpqRcYcrhZfLGHCoC
         LuSOMR5gVdpHYFr7JGCnKSRpAAZxi+ZKA0E7HHSlua9H4xzOVI0Y6nmoDDrf17xVZD4z
         d4All3w7u/fUc3I6Yt5gav5nrmTwfzOJLjeZR/MfpMjQBp9bkR5YAtxaJQMC3WGfDzVv
         +M2bVkEcW6TUQS9JUl+vgF3KAoa3DUN75P+knGeFH3EWvH77ednP8CRac4i3WGpnYctN
         lFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777307091; x=1777911891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sr/2dUgH4TaQVOxNt5LgmdgzwpX35PiqNHahYfkoMWQ=;
        b=LebjY+21T6FCbkQqy2icqZ59ZAKhgQMyPYZGRQGqKPh85l9Krrnjd3awxVNvfvMQQE
         9xrnzVEHCWrz0Jc3Bl9/qhKidZwdaW/UH4nUa3a0grvUWEreEWlUWJT+zM4P+HIrtBM5
         dDWtRNNSIoYlSs0fgQcqNZ0Wev3Q4Z65fQRWaux9nvFgXYzG4F3LdkqZWTAUxFoe5CwO
         RKplIshC/vIHW/MzcJwnhge0yFHRLyRo7SbNhdfT48CUwJbchi41AXbWMK4pGyUb6mKB
         UA8Py3WQpcNcq8o4tgyh98isXkTrt7GzAcuWGYnYJId0/lX0ZkOOTn/FP9JsarG+kx6S
         Yarg==
X-Gm-Message-State: AOJu0Yz7qo1KTo2W2omPU/ygjpKVFm03TE5RttP2IpgG3sHSqzoSSmmB
	fzzsiSgVc0uAb+lXzbb/lruzzFz615C5SIaSCTlJBjtTxtKAcCjcpvg/DtM7D0g0
X-Gm-Gg: AeBDiesnmMhDYJ3hZ33k0SA3gVg3b44RNLFvdrtjH1LGasUCEJkiQpfPRDGXdhK30LV
	FL0I6g8K0qodcJTtzWvGb2pIW4drSKQzofV440zHZrpJzpi2whtq+ch9g1c0MKdDG/I+hwjjC33
	qeWmeCxgFlr4NnEJ5edCIrfdJNsDNQst2lAoHzhbXEWV2Ef9dHeWsS7q/XDnWzvbi35JDHFj0c6
	iyffPu28P27HhXZR3JhGJDuY+X/n8quHOisTKt79zmj1ua1ifxfPC9urLs3ZBqt/UkGoKCPpK53
	v//3Ljr7Vb/j0Jfv6JCsp7y88SIKMcgy7PFB/+pFB3W03Xrafa32O8v4+m6850nl64J93bCV5+S
	d5JMEW0H+l7BKUDCZWyMZlYRT6bZv6PDTyPZbbSbZij0qCug8HOkpk0KUIqF7oP1iJDhzOWOjzG
	qtkluRlBmbfVzUv/JANKdB6NLkf35xYw+3qdm4pESBBOtpv+af2UDPfZVs1L/hB30TobWdBQq24
	5LUrsDBTcY5rZC7UtbyEDDy3J5Gi+MF6k1nr28C+MBHVRBFJFc/n1YXQAr0PXa5/CB++7V9iNOq
	JjmgiOU9aySPfGzlFpedM2yrVd3PhY+idhQ6BQ==
X-Received: by 2002:a05:600d:8:b0:48a:5339:ef0e with SMTP id 5b1f17b1804b1-48a76f4b36cmr1319895e9.3.1777307090574;
        Mon, 27 Apr 2026 09:24:50 -0700 (PDT)
Received: from franzs-nb.clients.bit.guest.onway.cloud (mob-194-230-144-174.cgn.sunrise.net. [194.230.144.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb78d1bcsm353532095e9.5.2026.04.27.09.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 09:24:50 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Franz Schnyder <franz.schnyder@toradex.com>,
	Ryan Eatmon <reatmon@ti.com>,
	Francesco Dolcini <francesco@dolcini.it>
Subject: [meta-ti][master][PATCH v1] conf: machine: Move ti-eth-fw-j784s4 to AM69-SK conf
Date: Mon, 27 Apr 2026 18:23:46 +0200
Message-ID: <20260427162430.24979-1-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 27 Apr 2026 16:25:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19877

From: Franz Schnyder <franz.schnyder@toradex.com>

The board specific firmware is added in the generic AM69 SoC include
instead of the AM69-SK board configuration. This follows the changes
already made for the J784s4 SoC and EVM board in
commit 27615406 ("conf: machine: j784s4: Move ti-eth-fw-j784s4 to EVM conf")

Move the machine-essential recommend from the SoC include
to the AM69-SK configuration.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 meta-ti-bsp/conf/machine/am69-sk.conf     | 2 ++
 meta-ti-bsp/conf/machine/include/am69.inc | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/am69-sk.conf b/meta-ti-bsp/conf/machine/am69-sk.conf
index 9531cc27..3785dca6 100644
--- a/meta-ti-bsp/conf/machine/am69-sk.conf
+++ b/meta-ti-bsp/conf/machine/am69-sk.conf
@@ -22,3 +22,5 @@ KERNEL_DEVICETREE = " \
 "
 
 UBOOT_MACHINE = "am69_sk_a72_defconfig"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-eth-fw-j784s4"
diff --git a/meta-ti-bsp/conf/machine/include/am69.inc b/meta-ti-bsp/conf/machine/include/am69.inc
index 7956e355..aaed2f61 100644
--- a/meta-ti-bsp/conf/machine/include/am69.inc
+++ b/meta-ti-bsp/conf/machine/include/am69.inc
@@ -12,4 +12,4 @@ TFA_BOARD = "j784s4"
 
 OPTEEMACHINE = "k3-j784s4"
 
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw cnm-wave-fw ti-eth-fw-j784s4"
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw cnm-wave-fw"
-- 
2.43.0


