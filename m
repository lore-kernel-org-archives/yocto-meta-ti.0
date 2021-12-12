Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.2105.1639338234494013495
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 12 Dec 2021 11:43:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=Q/sOGjfM;
 spf=pass (domain: baylibre.com, ip: 209.85.221.41, mailfrom: aouledameur@baylibre.com)
Received: by mail-wr1-f41.google.com with SMTP id a9so23748456wrr.8
        for <meta-ti@lists.yoctoproject.org>; Sun, 12 Dec 2021 11:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=mJH6AExDhhA3F1RHlMopqixEDQ8VB8c3QHp85ngARVw=;
        b=Q/sOGjfMMWokScV00pfVbJjboNXBo0z7JNoM9PUAqH/LsuP09gw733At8lmBuymSVb
         /zcPrzgEFQotCFwv2EhxJgp/rlvXpOPtzx4AVS0dcHdk5EeESkO18qKxVIl6I8DA3b+A
         L6UnRVIYFrcF2igqcelU8ZsskaW1XXs9FxcRZLlN/6ti4SM4hfMwRv8Zg42lZhZ/Qi76
         O2GKzFRFjj7RsfDNXaU+aTOYtNox0Y5imoqYCsCp9B306hEz+x1Mv/MhqlcN+Fr3/Q5e
         F5+Wb8s2HcBA/o2SyeLVbqobQ2HLXCW4tu8+2ideXq6skOFVa1nu57xDFRuXXq1pjHnu
         QELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mJH6AExDhhA3F1RHlMopqixEDQ8VB8c3QHp85ngARVw=;
        b=HrUN79zx4cLtPQlrhckveKyuJSkaGQta4T3+pbJNKVFCpb1SSbI5ajZj/WxaZthi6Y
         iKCzwddMhFoD+ttzF3kpxXCZf5JzV26zJwZi5mkuLKOFxQiVHbmWLbz23n0tuI3sIc/3
         LA9fpTaGJhJ2bON2pJCt9Aq5EoQusb+JeLicqqSfpWOQondKEp/0AcYYXasr8eFt9FOa
         2/QFCbATziuttOhrNjrBLTbxPFI0rL8jC/2/o/ACMynMZk7NlZTC6z5HT0Zd3SgCs2Ue
         u6HOXFpkDhjMzyb0cyj5nNMulKs8TktMAllblZ1bVKoWcj3N2KaV92ZhxuuVwcAnaOhn
         UTRw==
X-Gm-Message-State: AOAM530jJXp11JihUvRqqi6sXMyBucbCJYdqghXEyqG3Z2BnRaFfxZ3k
	zQgELGPLO+Czqx7xBtXSWJzLLYLrvopCNA==
X-Google-Smtp-Source: ABdhPJyA+ENl8q9xfmfwv/wWfoPMFU/fshEYXTYrCSHLQESHn4MGIcVUV1LZotndhIZayQDPFz+Dxg==
X-Received: by 2002:a05:6000:1862:: with SMTP id d2mr28059688wri.251.1639338232439;
        Sun, 12 Dec 2021 11:43:52 -0800 (PST)
Return-Path: <aouledameur@baylibre.com>
Received: from localhost.localdomain ([163.172.76.58])
        by smtp.googlemail.com with ESMTPSA id n7sm8961785wro.68.2021.12.12.11.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 11:43:52 -0800 (PST)
From: "Amjad Ouled-Ameur" <aouledameur@baylibre.com>
To: meta-ti@lists.yoctoproject.org
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
	praneeth@ti.com,
	denys@konsulko.com,
	khilman@baylibre.com
Subject: [PATCH v2] conf: am437xx-evm: re-introduce required DTBs for HDMI support
Date: Sun, 12 Dec 2021 19:43:39 +0000
Message-Id: <20211212194339.37606-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.17.1

commit ba0ddc5ae9eb ("conf: am437xx-evm: Remove non-existent dtb* from
5.10") removed all non-existent dtb* for am437xx-evm as they were not
available on linux 5.10 branch at that time.

This patch reintroduces following HDMI DTBs.
- am437x-gp-evm-hdmi.dtb
- am43x-epos-evm-hdmi.dtb

The required dts have been added to the 5.10LTS by these two following
commits:
- https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/arch/arm/
boot/dts/am437x-gp-evm-hdmi.dts?h=ti-linux-5.10.y&id=25434078d3f93d1346af5
e52e0f150f9083321d8
- https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/arch/arm/
boot/dts/am43x-epos-evm-hdmi.dts?h=ti-linux-5.10.y&id=c5114144b568e470a8f6
e613f7c6e8b88ad19d7e

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
---
Changes in V2:
- Reworked commit message.

V1: https://lists.yoctoproject.org/g/meta-ti/topic/patch_revert_conf/875669
71?p=,,,20,0,0,0::recentpostdate/sticky,,,20,2,0,87566971,previd=1639144992
271923805,nextid=1638294245910532029&previd=1639144992271923805&nextid=1638
294245910532029

Fixes: LCPD-24285

 conf/machine/include/ti43x.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index 75b745b37839..6376a27830f8 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -27,9 +27,9 @@ PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 KERNEL_IMAGETYPE = "zImage"
 
 KERNEL_DEVICETREE = " \
-    am437x-gp-evm.dtb \
+    am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb \
     am437x-sk-evm.dtb am437x-idk-evm.dtb \
-    am43x-epos-evm.dtb \
+    am43x-epos-evm.dtb am43x-epos-evm-hdmi.dtb \
 "
 
 KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am437x-idk-pru-excl-uio.dtb', '', d)}"
-- 
2.17.1

