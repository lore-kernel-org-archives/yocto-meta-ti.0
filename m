Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.4736.1636414668349450061
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Nov 2021 15:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=QFPQJ6wm;
 spf=pass (domain: baylibre.com, ip: 209.85.221.53, mailfrom: aouledameur@baylibre.com)
Received: by mail-wr1-f53.google.com with SMTP id s13so29787678wrb.3
        for <meta-ti@lists.yoctoproject.org>; Mon, 08 Nov 2021 15:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=mb9z9Ozj4Lmgio94IEmmgYXm1QmogN2y98BbytZs/8A=;
        b=QFPQJ6wmvZcNY2vqW+dD48dL2qGkZOyp8jiaJaYHanvKd+3KXHLG9Nxd1zibJZGlOv
         JzwYRdNaRf4hbLJSfoSZQPqLlFRVwCJjDccTWLqUAoTPJJ0lBwf08/kNW2zzGjzVnDpb
         yPeqXNx+SPAV6mZR/0hK7rXsvuloXFsJmG4F8wyVvzLgUlbzcfeePUy2H81P4NfqJpAB
         v5i5O4Y+75QgEtTH5SlxgL6UO3zgWPPOhtr0PNhi4RnDXgTIfUWFBDYX/DEjHFilveW6
         087KABr4Mn+7ZWB1wuW4L6Y0s1dyTmKHtMwBhxIUTbgV2UNI7qrGO4hhhsOAux3MUZat
         /v2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mb9z9Ozj4Lmgio94IEmmgYXm1QmogN2y98BbytZs/8A=;
        b=T4NqZL0P1uRSaHmdcok+Wg1V8B71NBrJz5gCYqDv/dfNE+nElbGoKI8ofHBOz4lRxm
         D8Co90yhoPBswI6NFBR0UKUpuIa+qQg7o6M6J6gN2dL/HwB7AOTz/rMsDvYjBlh3UEAn
         NKw270FJR0B3xZZZgSqpodktVZfJbDgJaGubljOpmCDtPa9S5g3Bf7s8XzJB30Vl2xLQ
         MuHVFWXuIqE0aIbVFeZws2ghpVzEPdRG9nRN4SDc2PgOXxIdkeXpMKd4RE9rk3RSn1hs
         E/K8uduMHFv/+ukRvfFbaCTPfof8SXDDt/0LoyXDwX7dw15ncd6Lp6eqSY/Fv4MWIdKr
         k43w==
X-Gm-Message-State: AOAM530/5bDXXHhoQMa1Xb+hSxdoH5VUXjgqCQCnHfie/2UJ4e3EZffS
	meP7SjU7dS7kZK0V4poh4/Q2aZSJb7v0TBsJhi4=
X-Google-Smtp-Source: ABdhPJyyoCn5f8iRR8yNWZaUT+Xm8D7CmhZB3gwzIhaY1GczuIzUQDa2B83ub89bijgo3q13Q/kJLw==
X-Received: by 2002:adf:f947:: with SMTP id q7mr3730965wrr.260.1636414666526;
        Mon, 08 Nov 2021 15:37:46 -0800 (PST)
Return-Path: <aouledameur@baylibre.com>
Received: from localhost.localdomain ([163.172.76.58])
        by smtp.googlemail.com with ESMTPSA id f8sm1252303wmf.2.2021.11.08.15.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 15:37:46 -0800 (PST)
From: "Amjad Ouled-Ameur" <aouledameur@baylibre.com>
To: meta-ti@lists.yoctoproject.org
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
	khilman@baylibre.com,
	dfustini@baylibre.com,
	denys@konsulko.com,
	praneeth@ti.com
Subject: [PATCH] recipes-bsp: u-boot-ti-mainline: Update to v2021.10 release
Date: Mon,  8 Nov 2021 23:37:41 +0000
Message-Id: <20211108233741.34788-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.17.1

This introduces a critical fix for both AM335X EVM and AM43XX EVM, which
can no longer boot because "uuid" is undefined.

v2021.10 has these two fixes, one for each platform:
- commit ff8f277e9121 ("ti: am335x_evm: Switch to DISTRO_BOOT only")
- commit e0c91ae24e5b ("ti: am43xx_evm: Switch to DISTRO_BOOT only")

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
---
 recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index 2db9899609d0..76aaa4b24ac0 100644
--- a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
 PR = "r0"
 
-PV = "2021.07"
+PV = "2021.10"
 
 # For the un-initiated:
 # The actual URL you'd use with a git clone for example would be:
@@ -15,4 +15,4 @@ PV = "2021.07"
 # b) and we want git fetcher to use https protocol, hence GIT_PROTOCOL as https
 UBOOT_GIT_URI = "git://source.denx.de/u-boot/u-boot.git"
 UBOOT_GIT_PROTOCOL = "https"
-SRCREV = "840658b093976390e9537724f802281c9c8439f5"
+SRCREV = "d80bb749fab53da72c4a0e09b8c2d2aaa3103c91"
-- 
2.17.1

