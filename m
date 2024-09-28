Return-Path: <radian.dc@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD0DCF6491
	for <webhook@archiver.kernel.org>; Sat, 28 Sep 2024 19:10:16 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.19353.1727550611481553707
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 28 Sep 2024 12:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mTcvqWAM;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: radian.dc@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37cd1ccaf71so1409199f8f.0
        for <meta-ti@lists.yoctoproject.org>; Sat, 28 Sep 2024 12:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727550610; x=1728155410; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oq8Kfw9cBjBehIwdlzJoso7EUC2Nr4EtC4aU0CNIVqo=;
        b=mTcvqWAMVHDEbn6uBhdXByMYn69NXUe2+XTa9XklwaZ0iieFPULNBNCOWDGjLPCxzn
         2oVtL9uvQM3GD3vODxVlpB/E5OHgv6oLGmPy9rYZlZyi8zm6I3/Z0jfllNINpw3IySOb
         yz0izX13rRiS5M2NUT+f4Nxk0YdIB0s/PIisvtp6WIhdrGIDAsO6Wnph/HPHo1KwIGYu
         VuBJ7OpOEGT+Q0SjUfvIJLNH2VcCvrwfw+Sr6uGa6xh5S0mLmUZIRKUDdhpxR4nCLN5o
         MkXvAsYpVsZ6Lykr7mVJ0dc0j3XCnUOAUyT8CGgxQ74evS9r1gAc4UyXtQ94uynN32MQ
         i3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727550610; x=1728155410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oq8Kfw9cBjBehIwdlzJoso7EUC2Nr4EtC4aU0CNIVqo=;
        b=Klyjx2hm3v3XnsHEWxCldWupZEYRQy9LmVdTqRwgLfwn8o0t+5IofmgsmZnuPDSpWI
         YHl9kdxKGaJNrv94cXhAX77vb17KRI/ye8pCgORsEK/Ey/MRFTc1wjxNxZbUIC0gfBiM
         uvlpnas/CK66gSXnHAXvlKO2eXe4+WLcxAVCgtXwkgIgHZy9czDEvsilZvr44ltKYHxz
         F/gTNAFODkmgXdoRaVENtIGBRo8rYa+idmAg1dxQhR/AkSkW32G1w7JRW/cEHfItslB7
         xg3cX02Ko5vzxyKFcxISME9jAMNYcoM1TokKMzNOsepkbFV9E9a2Tb6mFmUK760t7yac
         r2Yw==
X-Gm-Message-State: AOJu0Yz9VsAxQ3j26YGfS03orhpSpYRqtLKFgfOg/+ocOaBr+TmTQzwy
	XhqZbMFDiqquAZDlzF+SefrIXhM7uF+weR8wDRGxw1jryHmT9EFCBKrH9U0F
X-Google-Smtp-Source: AGHT+IEsZr8SC9eUNvEVz+myWKdiEnFKs7m9rC3giBXe7q6acPat9lDb14aR1VEd53Q7RpwQjoN53g==
X-Received: by 2002:a5d:6748:0:b0:371:8685:84c with SMTP id ffacd0b85a97d-37cd5696ad3mr3786878f8f.15.1727550609576;
        Sat, 28 Sep 2024 12:10:09 -0700 (PDT)
Received: from dell-f2yjyx3.. ([185.32.209.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd56e89b4sm5403676f8f.53.2024.09.28.12.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 12:10:09 -0700 (PDT)
From: Adrian DC <radian.dc@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Adrian DC <radian.dc@gmail.com>
Subject: [PATCH] meta-ti-bsp: ti-dm-fw: declare files installed in 'DEPLOYDIR'
Date: Sat, 28 Sep 2024 21:09:42 +0200
Message-ID: <20240928190942.2291734-1-radian.dc@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 28 Sep 2024 19:10:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17976

Errors: ... is trying to install files into a shared area
        when those files already exist.
Tests: Build clean, rebuild, rebuild clean with sstate
---

Signed-off-by: Adrian DC <radian.dc@gmail.com>
---
 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
index 1ad236ce..39e0eb8c 100644
--- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
@@ -77,6 +77,8 @@ do_deploy() {
     done
 }
 
+FILES:${PN} += "${INSTALL_DM_FW_DIR}"
+
 # Set up names for the firmwares
 ALTERNATIVE:${PN}:am62xx  = "am62-main-r5f0_0-fw"
 ALTERNATIVE:${PN}:am62pxx  = "am62p-main-r5f0_0-fw"
-- 
2.43.0


