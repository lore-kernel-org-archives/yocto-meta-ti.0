Return-Path: <fra.schnyder@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244BEFA0C23
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:40:41 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7480.1776321639654345921
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Apr 2026 23:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ncmljMEr;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: fra.schnyder@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d7605ec91so3748631f8f.3
        for <meta-ti@lists.yoctoproject.org>; Wed, 15 Apr 2026 23:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776321638; x=1776926438; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I/05wK2LvgIuoH1LmW0duYX9HL3W+x5l5meMcY2wntg=;
        b=ncmljMErspMYOOlW0FOG2uK0Z6gJBpRgikOqIHsRtZxRtx2iHc0EYZN7ef+2CJqGdd
         J5aencHhIeY4DOZuXEcbZMoHWLr733Fxb6FMLs8kfgiiAuldVm7Z8b7g6JzqJd71mh1A
         Gr+2+YtZpVshIQY/xG1Cw2dJO2JXt723XpNdvyJK/HIfHhbfZWOAD2SgBDGZokrDNWDq
         bsupXxWi7UyFJj7Stml/b+uJzC36PBKuKwtWkyussLwnS1nwHxWbT12/cfL0z7EW4CSg
         dxQa77I/x3YA9iqwiFnj/YzyQtxzAT5fyRs9ZtV2eolYkjU7sTfwgIxxZpkarxrSHEhb
         U7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776321638; x=1776926438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/05wK2LvgIuoH1LmW0duYX9HL3W+x5l5meMcY2wntg=;
        b=dYxV0zmqJWeZuzUeJpQY6jx2w79xOG2AFFyr63otUCXK/j9zTwf7FpWSqQ/fXvqpYX
         +aLfolPapK4Qqg3mXS2AHW3pvV0LobIZvCmTWo8k0sDbibVTPRDq0VjkvBc6VqqG7L2i
         IW7zXyVjZePq+gHdrhj6uMOU77DuK3H2jwUGu7q1tl2JmR5s5mL0N7G0z9ewaqs7YER6
         JL83oz1kL7YzqWLEk9DPmdec9jNwMeiceW3Bm4hJTx4KwNeyBhObCo9yQLKF0HBO2CRK
         Rr6J7RSEGt7Rtw7uwgi9esl5Ioz9qHyVnlnYSSFNCAqlS48ADKkfkWgSiL44h5rqVk9G
         Z9Rw==
X-Gm-Message-State: AOJu0YwrvjJJ9GMacRx6Z7ePNqLH87lfUGo83yZ3Y4x5Goez32HZvngx
	t4lVOz1V+k+DVHKRVGAlXRg6Qy4m922D0QTc6/pI2778t7wnpkqTXeOWGCJPMU2F
X-Gm-Gg: AeBDievRRke0aOub9Ig9OmpOE6ylEsvyLJJ13IbJbFN1NXDAhvpgmFmeshwDY9LfxxP
	ipVERkAA9+P7AFffMzIvpRV3RrQtvzH2ZYPLUYpBuZKuUNNw7VmKlQ2dNU/tLzp/PIQGEcxUPo2
	IpEYngIUIub36QF26opM24kQYPvisMO8hZ1plBQzMFy8wPNcKYPW9oPOqeuG6q5WAYIB0tPxI04
	BFPf8BtrFNoG9+YyIiqNxflU89k1uK8czKvyTZXtAd49HbS0AuRvgqc2qfgrYnNmPCL68h7001+
	6oAkEkaknYMnybPxmo0Cj1vlUJLVM3vvx1LYQhJzvwf1giyaltA2qt3K5ZH93e8luRs2afi6egL
	bZY0TzVnZh3arCdxuDjTr5lRnB9mVSRN2MFyIpupWYv5nOCGMZl7lgMbcoMx43KTCdVEFvMpRnL
	aq1XrSPY0al8XaPrZvPUQqUlsHJmbgYlidco3GsUqNHcwukvSfUMqY4b3/wJ/B9gGzkxg7GhkT2
	mDMCky+zg/paZhUyt452lWzxpZQAoE9/BcjuUEc2bWkLsoAp5BNCK2Pl0crg8IPDlewPe0cKt8E
	46FK4kcUdPb7AAD6GYt+
X-Received: by 2002:a05:6000:22c5:b0:43d:73ff:fd59 with SMTP id ffacd0b85a97d-43d73fffe60mr26559559f8f.10.1776321637682;
        Wed, 15 Apr 2026 23:40:37 -0700 (PDT)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3e263csm10657178f8f.29.2026.04.15.23.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:40:37 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Franz Schnyder <franz.schnyder@toradex.com>,
	Ryan Eatmon <reatmon@ti.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Andrew Davis <afd@ti.com>,
	Denys Dmytriyenko <denis@denix.org>
Subject: [meta-ti][master][PATCH v2] conf: machine: j784s4: Move ti-eth-fw-j784s4 to EVM conf
Date: Thu, 16 Apr 2026 08:40:22 +0200
Message-ID: <20260416064023.1762200-1-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Apr 2026 06:40:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19854

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
v2: Change in EVM conf to "+=" so the value is appended at parse time.
v1: https://lore.kernel.org/all/20260415114107.1643556-1-fra.schnyder@gmail.com/
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
index bf53b07c..a88f6f69 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -27,3 +27,5 @@ KERNEL_DEVICETREE = " \
 "
 
 UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-eth-fw-j784s4"
-- 
2.43.0


