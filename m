Return-Path: <fra.schnyder@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB56F419A4
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 13:05:34 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18464.1776258327198790351
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Apr 2026 06:05:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TOKa8FxJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: fra.schnyder@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cfe71e5d3so5236342f8f.0
        for <meta-ti@lists.yoctoproject.org>; Wed, 15 Apr 2026 06:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776258325; x=1776863125; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GgLMBx68G1vJEqCdJRlaIPZhkPkNLYUzKcj1B7QvHpk=;
        b=TOKa8FxJQF3ncXEI0U6eFesxqf+VPvj1EaCYVCDxsbCu8BQHwx3USOsOyV1TjuP62W
         gsdAQ03GqkmHPbTt4JmtcDrysMlY/M61MbZKOfiMsxnWnPCTTlel7DvVUOHJk53laGg2
         w+pVnCTXtA50mc31RR95VlmMzheHmpH2xwX56RYmzOM/xGCLegYrdzYDwIIEPX3e5swd
         Wj4WMt4QBaqKjr/T8Q0LinBMP/25zxdEl6eIwtAgvmQTv2hzFVmN17R4ggichwWcQhmv
         oP+LFb03dGqqJhKWC/Lgg2k+QZCSyjKuwtR2rfYqzk1PFXhrHzFy0WFFw9txBL2tORPf
         B/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776258325; x=1776863125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgLMBx68G1vJEqCdJRlaIPZhkPkNLYUzKcj1B7QvHpk=;
        b=DuceYi6Tet/P2sB4U1pNAID0X8SuLGvLijkACnLWR9odzt2A/0eWxRxN+tj4teYi3t
         qQZLPPGpUgLePjOBtm1AZxxZ9E6hUPGhbD2ghHnWTWNDhEJoRHbOmnHftcFrlEiuoYN4
         TNDDbiY0z7UOL1EAXgrUC1yUMKNc/wQBrZovYrX1WjSPXB9zQhjIQOPGh4k0x06yg2mU
         5ghqapHN/GPJIs83+5GBEhePIbCkxqrNQHS+2t0tvZZ1iCHM2i1U1pWriqzyS8fz+DuK
         Nnf8aILCjid82urpOTk0pQgN3QXYXHE/Lk0ebJuFp83F92lYk3cCFRtl5IJih4/lA1ol
         FsHQ==
X-Gm-Message-State: AOJu0YwiqI2BiHW4bqYzcZPib/ZQ1SFyDjPpxM3eyHf6IkgVCAc96lpJ
	Gw2xN8H5Uzd6Iw/Bzts3s7T/QRwtTBRgMtHOcsmK0zkzl4DWq26hy57TMKJdIjj+
X-Gm-Gg: AeBDievbpKxYVwDPOvw8xt6KxR35/VSnyUwBnToHAUrdEYBv4Sb49O4wfb1TXXcurvT
	wCsEeKBCRk4FhizFi5xkH9MyPuYVXO4D4UB/M2AalElfAD+h9e/5114Rd3Po6vomtPoulNLvPon
	JUBEwx/UKBURPLLsCpxG5zupZ6Zpc3wfvBTZBwKN6KHchUcgWmlVRRjz3qGnFSPfRQtWFlmgL7r
	F3D4dcFkC5n5s2dtXUCt6jvsynYDClwEa25JXlT6OVxEhhANtzIqeXjf0j7MSxEy+WSAG5mXI+m
	O+wIU5gzGIn6y3x54PvR2gAmwXs14RaErsrTpmfFsyiOYKZ3tojh+MiHv8rFdFKU3xrbLCrPJMb
	jLAXFblq6OzABwUxqpw178luknxRanK/Mj2qovC3rTMUsfbflAx++P7oYdNuhFz5Gvg36W7fKix
	43DoFYlQk8c/eGbX+vFYHT78UBegTxIgWIdsec8zBHBJ4rBkt03yxcG5EB3wBBNwgU+c0Hwb0Fy
	qgNJV+gt8NKENrss9mad1V3JbnU45Q6Pd44ctTK0NtUj/zKvz4xGDTK6eNeT9Q/almYENUsBZHZ
	m2tAZF2MIX2LfCEf6rWt
X-Received: by 2002:a5d:584d:0:b0:43d:7ef:552f with SMTP id ffacd0b85a97d-43d642a79b3mr31331297f8f.25.1776258325066;
        Wed, 15 Apr 2026 06:05:25 -0700 (PDT)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3553d7sm5090634f8f.9.2026.04.15.06.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:05:24 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Franz Schnyder <franz.schnyder@toradex.com>,
	Ryan Eatmon <reatmon@ti.com>,
	Andrew Davis <afd@ti.com>,
	Francesco Dolcini <francesco@dolcini.it>
Subject: [meta-ti][master][RESEND PATCH v1] conf: machine: j784s4: Move ti-eth-fw-j784s4 to EVM conf
Date: Wed, 15 Apr 2026 15:05:11 +0200
Message-ID: <20260415130514.1660759-1-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Apr 2026 13:05:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19846

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


