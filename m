Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.68473.1638891186765585891
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Dec 2021 07:33:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=d/o4ar4T;
 spf=pass (domain: baylibre.com, ip: 209.85.221.48, mailfrom: aouledameur@baylibre.com)
Received: by mail-wr1-f48.google.com with SMTP id u1so30236202wru.13
        for <meta-ti@lists.yoctoproject.org>; Tue, 07 Dec 2021 07:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=vU1mhA+6a6UNZzv2BVB2fIKfdnAaj/3HMw+ZArNAdEk=;
        b=d/o4ar4TtrMGDvQAZ30RfcgQOfnzv7i7lPci2HKkyttTg3vW/SfRc3O7fc6RgPFzMM
         s78lxlkauFYh2Z2oW4pm0GP4Z/+JpzFh43w/K1WXi5PJfVI1B/q2Fd7KfiJvTuhqzjpT
         ENRhZfKsy9Po4Bk7rMMKPDGON+IbnmicXNy1Brjy2s7QuJ77UE4GIg8gZRYRbDpkFgSX
         C0hq1DPNCHQBw2wpxGlHwjYYsZ1ZdrxpenXlWxsg6/ASb8agq5MP4je4B/cjqeSsUj/D
         7S8+ZOAM8308NokvpAPxgxqB5V8bORncwzm9AObvmPbio2Mjeiz9SjGglkawerUcod5z
         qMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vU1mhA+6a6UNZzv2BVB2fIKfdnAaj/3HMw+ZArNAdEk=;
        b=U9litsWGty4Rg6yU49VBTj/YchjpeVDlgBt0ZTaW5BRPHRBI7zzGl3sca4hZwu5zsw
         EsBSVOKellQBhwJzctfVp76SPLdoMp/NcJogd3c2J0CZK8RDQOq9I0d74XgY+9si5hCx
         BhncFQTOoDc0PtyEPcG+eK+X22UC494AiW/VMoUJdLqYNY8vUoF0h8tk0x3JqScnZxHH
         kqsoktePMka1alhviWe8UkdHLBuqy3MLV1/h6N9pu6y4w98NK5HHBW80CSai0Opt+UZ6
         wFfFLGnS0tCVLi2bqRawC7KgUUwTfYQVKbpRdWmTZkITDPpA+ts/Tho5PzFN+ovlIMEN
         REnw==
X-Gm-Message-State: AOAM531LmZOrpBh+wbsuSp+oUmhGZtr27wGnafqljPO0oW+U9qPItkom
	cTtfflrDDb85YyBXNVn3vp29FZEE+8vZ+4vh
X-Google-Smtp-Source: ABdhPJxKg40GnKIRt43vLJSVpObyjsKMdDMPZrJa0e9EhJ0K3ghTOVSpiuxDrDwiJGYlrGz9TO5B6w==
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr49466793wrt.131.1638891184734;
        Tue, 07 Dec 2021 07:33:04 -0800 (PST)
Return-Path: <aouledameur@baylibre.com>
Received: from localhost.localdomain ([163.172.76.58])
        by smtp.googlemail.com with ESMTPSA id f15sm3527546wmg.30.2021.12.07.07.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 07:33:04 -0800 (PST)
From: "Amjad Ouled-Ameur" <aouledameur@baylibre.com>
To: meta-ti@lists.yoctoproject.org
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
	praneeth@ti.com,
	denys@konsulko.com,
	khilman@baylibre.com
Subject: [PATCH] Revert "conf: am437xx-evm: Remove non-existent dtb* from 5.10"
Date: Tue,  7 Dec 2021 15:32:45 +0000
Message-Id: <20211207153245.3548-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.17.1

HDMI with Audio playback is currently broken on AM437X EVM,
this is due to the fact that am437x-gp-evm-hdmi.dtb is missing.
Reverting the aforementioned commit fixes the issue by adding the
required DTB.

This reverts commit ba0ddc5ae9ebf9777d31283f272e4ed518e1f514.

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
---
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

