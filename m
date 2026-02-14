Return-Path: <ivitro@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E51EF99EB
	for <webhook@archiver.kernel.org>; Sat, 14 Feb 2026 00:57:08 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3784.1771030618386220571
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Feb 2026 16:56:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hlKFt+Hg;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: ivitro@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48379a42f76so2681685e9.0
        for <meta-ti@lists.yoctoproject.org>; Fri, 13 Feb 2026 16:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771030617; x=1771635417; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A+1Xnoja+Qxg5dfJ+FEUiCks/zbczM0nXScEDLyyyXk=;
        b=hlKFt+HgFoLIU/C/3RPi6tgOtxZ5VKhlloi1Y1LGDpDC9wGGiKBGvhVg5q5EkiKpsL
         IIb0jJtUoFEvCjonAXb+/39Al7dBzifEElNANjQtWCe3kYeTx1aSvK/dJ92tG6ByfGtw
         aXNmO6t6pXMCRTamfJbeJADmrKexw9hi3NMrwXIVv9CKChLQYmIsU3TSeG8q5boE8XSg
         Osi1MyIL5vlzhcfyQH/afzQUmrolC9ob8zzJZDpTPiFv2IejEhceRPWeJ3TZ8CXyMuZK
         eY34GmdiChyXJqVUeQGaXp6v6S+xKNmuQwZ2mWc2GH5Iom5k/Nv8/7q/2eB4+BlfLboO
         NYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771030617; x=1771635417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+1Xnoja+Qxg5dfJ+FEUiCks/zbczM0nXScEDLyyyXk=;
        b=pQdJ7hQzeAYN6siy1ZUAdP3QXjuM4KIMzKd2UToJQ0tjEEjSl+Au2H/pUK9m3MHq9Z
         09buOpkm0Xu2iys2PlHFMOYhruOdanKZu/Dc9Z/NM6VYlhut0wVwVInxeSzDJfq5DVmQ
         uoFTqiDOxXlS2iknQyT29vco2JIAOS7g0bv6t0oq8vhBh5q09T2SIEs9CGtpT1jNwjpo
         rAjrd8mSY4Nf4d3jTmKmE/CFlXiD7Cp+CbrKd0tVFrqi/9Y08VRs0piy63XSQpTDhkCm
         xxSwVEYMHYOV0AaCVjRx6ogBzZwVfTmu+m3M/IMP4sWb42rGVtf7UPYMxC1Y1RLLVIqp
         Z1ZA==
X-Gm-Message-State: AOJu0YzYx4gEcmq8C3W3Hm+W0zGDZ+UFzRqZRiehziZ6KyQnUwBVruDi
	kf53DZH5GrOrKKy7oItLa5gOT1NDePl4mgR6iMW6RNhMy5x0VaMXJGClQ0VHgw==
X-Gm-Gg: AZuq6aLysG5cEf5+jUGP3N8PZDpk1mnHU/yU0YYKHH2fY9GbtEhY06fcfbvC42nSP8F
	9GOMry9/jxE/bA3c2SGBsag3yTVjGFiLDn69AGCp+V8bTaHkm5+XttQlqNPjqUGqoa75nJM9gHA
	H4zhLsgDLR3IlwCujajfarKw2IdfeqmrpVewH8nBT+rS8dwi8RdrhpaPfdkD1b9NCtpaMomggSb
	i7UJrkKiGjHZ6Uza/H6A/n1lNJRHaMN+IkWRmVhl8YuVOcqUN3lG957DDbvj1QuifRStIN3t7yJ
	pcj9gVcRZBPc8KwTOFHJAB5Gt7wusnYzvWyAXjx8cmEbYE+v4CTcewFXyVvcrJFZY0qYdIRp5cb
	EaIDa3VMQ01bDobFujhKcW42tljwbLA4DTPzceAj5EZ4yR75K1VxVLzUDJuJLpoPnxhgxJwNXJM
	tmmb6p0FCeZb38yRmiqGh4T7d5MCfY5a1rNUBNodY=
X-Received: by 2002:a05:600c:a44:b0:477:2f7c:314f with SMTP id 5b1f17b1804b1-48379bbc51bmr19350705e9.10.1771030616346;
        Fri, 13 Feb 2026 16:56:56 -0800 (PST)
Received: from vitor-nb (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dd0e15bsm198037255e9.13.2026.02.13.16.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 16:56:54 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Vitor Soares <vitor.soares@toradex.com>,
	Ryan Eatmon <reatmon@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH] j784s4: move TI_CORE_INITRAMFS_KERNEL_MODULES to j784s4-evm.conf
Date: Sat, 14 Feb 2026 00:56:51 +0000
Message-ID: <20260214005652.626783-1-ivitro@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 14 Feb 2026 00:57:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19514

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


