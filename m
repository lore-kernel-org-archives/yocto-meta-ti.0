Return-Path: <ivitro@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA8EE83841
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 23:04:32 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.686.1771283068998160124
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Feb 2026 15:04:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ciXbBhZT;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: ivitro@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4837584120eso23508075e9.1
        for <meta-ti@lists.yoctoproject.org>; Mon, 16 Feb 2026 15:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771283067; x=1771887867; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rbWu+AbvEH3VoTnphwb3+zzkKG+DQODtKuGlndgXayI=;
        b=ciXbBhZTZzf7Y3KKWHgUVCbVmBZ0l6t77v93apai5S7BmgZ8DmDgvimMnTKYjdWMiL
         NjXLefcArmimVNz7srjVlCWSQXbrQ1F9cT66+yeG6iR6FJrF+LIGCDygpAzqeAgP7Drt
         FJI2OwvyoOhcJXbENZzm/Bt8zFJvilxBnct85JN4iYrQA1EfhLzhcU4ncnvAMxCOVUcv
         bwoXVCLRvs0+D2TeR6/nNUFkSNQLd06wlWOrqb4+PUqOmaFSDzR6DkjCibmD9ZsLs5Cy
         jlR+kJccxUlcPc3vYqir4bahVwsCdtUxG/KtcGDjf6K6zi+pH6qy7N7tMcajqMz9N69L
         rIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771283067; x=1771887867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbWu+AbvEH3VoTnphwb3+zzkKG+DQODtKuGlndgXayI=;
        b=LBYkE71rrDURc0xxYIYGa4VfC4UJYhfNwcd9zmfuDvupPueTGaQvNhzbcW3i3qVmjz
         k1s5hY1AbJzI/H+cHHeJcCzqlS8VFRzN1vNfO3gut+OP9A6yOKN/yBblK92Oi6ZZHdc2
         BMBk84cghZpI/IOk4tvcZJwpdF0QRJXlkpeVlJ8SeEbVvSouZG69OW1guQ1UIzF5y4hr
         IJT0mWukNa4LCyH30i61ty2cVS45ZtPpz6WOc/hIvoOEehtOKiYQqJ2QTUQotBx4iZBJ
         r0j7S9vr7SBNrj308Vp1nvTz0UHwoVzFaQlwH4JoPth5j5Ta+yxa1DvDCf4jG1HKf3LQ
         BDQw==
X-Gm-Message-State: AOJu0YyuojM/bH+NpP0llkWM5a+ZSCkT5tX6oKiciHP42kYKimQO6zRx
	pkpzUL2IpAt8SAwej5IUmK6aAL0rZ0f0gkCECp6LhV+iRS4WTgqmMI1qQNei4w==
X-Gm-Gg: AZuq6aJ5hf+PJOeBltDmLHKbKofzxRh497G/hcGk4a34MmEX6saCyMr/HX0WCpVdPzD
	D652Z050V9jCu+DNhLyAOv7rscsNvJoUyiXDlU4/Ryzlj4eIQFIBf/ANREFwM0CieiC2J0uj87f
	Yr+7vhT+K2sNX44dBAcqn3Nw0o20MONl4TI/hj5MRPg41t7S1xFnlZjSewiMM/wb1MsC572qkjQ
	rswvxU/ugm5dJb+MSrBmlb4OlIzqM59WeaIgWh9/lkMnIV27TtVSBkk/ABpNxLo/sry3Pqq95Xb
	I2V0Rc53U82Vh9HXTmSwa5n4xdmeWYMs48oUUiflLC3fwJfwj/fMTFpr/rzzihdcj53h/EVv0nB
	RitCozcJm/Sv0Aghtkl+tPejC3PaIg/GQ/pJEaxm1dfkan7t9MUy78k1uRkYVpDDonMB3MC1qZ6
	3y9fLiyFMNBW802AOm8o3DcMTGY7KrBshHypW/uQg=
X-Received: by 2002:a05:600c:1c25:b0:483:54cc:cd97 with SMTP id 5b1f17b1804b1-48379bfc340mr144711225e9.36.1771283067080;
        Mon, 16 Feb 2026 15:04:27 -0800 (PST)
Received: from vitor-nb (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4837b68e5adsm276082175e9.9.2026.02.16.15.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 15:04:26 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Vitor Soares <vitor.soares@toradex.com>,
	Ryan Eatmon <reatmon@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [meta-ti][master][PATCH v2] j784s4: move TI_CORE_INITRAMFS_KERNEL_MODULES to j784s4-evm.conf
Date: Mon, 16 Feb 2026 23:04:20 +0000
Message-ID: <20260216230422.635024-2-ivitro@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Feb 2026 23:04:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19518

From: Vitor Soares <vitor.soares@toradex.com>

TI_CORE_INITRAMFS_KERNEL_MODULES is set in j784s4.inc, causing all
machines based on the J784S4 SoC to unconditionally build and deploy
an initramfs. The cdns-pltfrm and ti-j721e-ufs modules are required
by the EVM to access UFS storage and are not a SoC-level requirement.

Moving it to j784s4-evm.conf scopes initramfs creation to the board
that needs it, allowing other integrators to rely on the empty default
without explicit overrides.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
Changes in v2:
- Added project + branch specifier to subject line

Tested on Toradex Aquila AM69 with bsp-mainline. EVM not tested.

 meta-ti-bsp/conf/machine/include/j784s4.inc | 3 ---
 meta-ti-bsp/conf/machine/j784s4-evm.conf    | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
index 4dc3a71b4444..f29cd69bf9f5 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -14,6 +14,3 @@ OPTEEMACHINE = "k3-j784s4"
 
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw cnm-wave-fw ti-eth-fw-j784s4"
 
-TI_CORE_INITRAMFS_KERNEL_MODULES = "kernel-module-cdns-pltfrm kernel-module-ti-j721e-ufs"
-TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-ti-6_6 = ""
-TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-ti-6_12 = ""
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index bf53b07c33f4..333bd24d938a 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -27,3 +27,7 @@ KERNEL_DEVICETREE = " \
 "
 
 UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
+
+TI_CORE_INITRAMFS_KERNEL_MODULES = "kernel-module-cdns-pltfrm kernel-module-ti-j721e-ufs"
+TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-ti-6_6 = ""
+TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-ti-6_12 = ""
-- 
2.52.0


