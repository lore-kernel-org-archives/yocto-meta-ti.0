Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0667DF419BA
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 13:47:26 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17030.1776253745759311241
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Apr 2026 04:49:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HZYewai9;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: fra.schnyder@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so103660695e9.2
        for <meta-ti@lists.yoctoproject.org>; Wed, 15 Apr 2026 04:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776253744; x=1776858544; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GgLMBx68G1vJEqCdJRlaIPZhkPkNLYUzKcj1B7QvHpk=;
        b=HZYewai96Lxf4B4A3cY7qPvaJKiPpk/Qskq/mfRve7Z0Ni8VhPpUJcwE7B1l2XEhUT
         wm54o1RqPdVBtoVHmyOZLfWjODZMFjn2SIvulTyeipoRi5J1iRRyTm2XTLKrn97IFZKc
         yzKTO5qtR6zpW3MVCphEyZ+vJYRjxW1MZAxJaXgTCrGLdrkqBCPDCRy+xL0jW4pRwqlp
         ep/4Tg1GjwaRy3c/y/HGA84Z0YQcj4v4xMl/10j5AzjZTdWJt99LOzYTF7SIs2JGU9WH
         EbYbzJu+cEIV4foFMMcHf7ZVzg0TgIo7ceWT5anqV3turBkXur8xyNUsj6oacte1PBN/
         Ztzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776253744; x=1776858544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgLMBx68G1vJEqCdJRlaIPZhkPkNLYUzKcj1B7QvHpk=;
        b=ZBXOEl5xNga230BEuRyun+3Mxw8cqQVibktQkno6oi8he1WsUpAEycVhq5GvfoG+66
         SiaKQbiZKKSKu6b5p2J+69tQHgwlQB7SIRdaGc2ZsBwyXMY2Jju64fN28WMm3BODMxSl
         gi4ZnIlwkI9wqW+ILlnCp6RkF8R/hGMyzxgPOnsKQBl6GANowrOdxAoM6FxPVNN6tgdj
         QRMY6Ua5wPzIiR4HqhpZE4+dyrtae16N4wavDyO9iEhsX4W6Xy06UfEh00v5I+wbgE7c
         rW2YzbmrbFOWcmqg3yMkQCQMf2FXxvdxJtNtaazFHZ0zE8aoV0wMto6MqXRv6KH/I5z+
         BvWA==
X-Gm-Message-State: AOJu0YxyNMWYh8hZT85jN6QP+lW69ChsgXhVqnAoi1RCZhSBMIOOikmK
	IvpzoezWGh/YdqVj6rYaLesFa/kJGUXV7TB81iNn87rbUog4KvTw0VXv7parrA==
X-Gm-Gg: AeBDiesl44ctOZa8Z/AGwIlXq1kY8oXKC/sHINKjHAUM4ibLOn/rpFMKF7yJeyW4fBz
	4itRyN+2FsBiac1AnBSUaKp5301QmFJexivLlw2Rx2wLqq1ZK+sqinckdj+qfZXd7ea0TIGQ2oI
	EOcfHFO9/oJHUOzzNtFwx9wDueCeVWFwLpbcdyoJrsGHP2zoR+NMH9YJvo67yIti8zQRTDcwhGE
	1i81nanvbZEdUZnqthOUTpH5BSkoJy5JesX8C1O+LhjwA9kk88IK08LEOi0pVsdUBn3+UIdLk59
	21XiO9YD2o4raQ00m8f4aeRnEjbMTMAY7QI2l0wYyFrMQ6HkrtNcxkGXtc4DLYhaordv//8pfAI
	jsoYvkLhuXFlbeAZP7woTRtHGa8ez7diUuZVJAjdc+UVanluaANh9Qr/d/jZLM4RwDBkI0jVXbi
	7tQTO2iA8vfxK7AaC8TQzt/nehoylsHZwDviywTdNeTdFV/pnURC+w1MoNU4Rvb7jeaf0T7+ejC
	UcCR/EuvE/pLjNIs3ElpOf0wjHVqsQeRnRfSNF6b9shQOQUv53EqRwvEenpyaG0mVJGfL1rMq8G
	fZP2Nw6v+O9uBM67cQiS
X-Received: by 2002:a05:600c:1c0a:b0:485:4388:3492 with SMTP id 5b1f17b1804b1-488d67f4e67mr295333535e9.11.1776253271447;
        Wed, 15 Apr 2026 04:41:11 -0700 (PDT)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ede1df12sm281951575e9.4.2026.04.15.04.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 04:41:10 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Franz Schnyder <franz.schnyder@toradex.com>,
	Ryan Eatmon <reatmon@ti.com>,
	Francesco Dolcini <francesco@dolcini.it>
Subject: [meta-ti][master][PATCH v1] conf: machine: j784s4: Move ti-eth-fw-j784s4 to EVM conf
Date: Wed, 15 Apr 2026 13:41:04 +0200
Message-ID: <20260415114107.1643556-1-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Apr 2026 13:47:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19848

From: Franz Schnyder <franz.schnyder@toradex.com>

The `ti-eth-fw-j784s4` firmware is added in the generic J784s4 SoC
include, which is therefore used for all the J784s4-based machines.
That firmware seems to be developed specifically for the EVM, as it
takes control of pins used for the Ethernet board setup on the EVM. On
non-EVM boards, like the Aquila-AM69, those signals are used for other
functions, so enabling the firmware in the SoC include is too broad
and breaks functionality.

Move the machine-essential recommend from the SoC include
to the EVM configuration.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 meta-ti-bsp/conf/machine/include/j784s4.inc | 2 +-
 meta-ti-bsp/conf/machine/j784s4-evm.conf    | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
index 4dc3a71b..e0ce81b5 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -12,7 +12,7 @@ TFA_BOARD = "j784s4"
 
 OPTEEMACHINE = "k3-j784s4"
 
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw cnm-wave-fw ti-eth-fw-j784s4"
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw cnm-wave-fw"
 
 TI_CORE_INITRAMFS_KERNEL_MODULES = "kernel-module-cdns-pltfrm kernel-module-ti-j721e-ufs"
 TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-ti-6_6 = ""
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index bf53b07c..f80e030f 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -27,3 +27,5 @@ KERNEL_DEVICETREE = " \
 "
 
 UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS:append = " ti-eth-fw-j784s4"
-- 
2.43.0


