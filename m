Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21B9C4332F
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 15:31:25 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.24872.1664983878180235270
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 08:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=peWaCnDR;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id c7so15531888pgt.11
        for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 08:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=9zgaaFM/C7saKUnttHIDa/leJJDfbrW/Pj2XnEYKoQ0=;
        b=peWaCnDRlRDGxjmNamUtPZMJpdSV+m/JNXoFq2iGp2gJJzW6kLqVI9wmmng0g5OGkq
         ProMYs3dyioTPeDiRWB9xAnrfviVr+cflFXCqDdsS/i3VHdULG6IuPBHT2TQqGwpC/El
         DGbvd4encWVoGUjgrgo0IyU+H1VboXW1b9TqtxJ4uQIQAUKT5HG5cvFr+9ZuB1In8alV
         ky6NZaOuudKsHGqtLlWRNdIbHdpbtcFTas7PDBSzf8W/grgzp1aJQ4HH/NxkKHh4v/F5
         9Kx7gLW6TJy80JkCplPILr24NmpDwtqSbeMMiNGO8AJIakG6hZydfSeKt+uA+PnlD0zc
         uKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=9zgaaFM/C7saKUnttHIDa/leJJDfbrW/Pj2XnEYKoQ0=;
        b=KCat8akSKb7EzgHBr+ozMpcHbB9rqxDDFMK6ATrKaUWMwNebQdFXWaIvCoQIzYr/kK
         RpTtRPb205P+nYIVU10Fy3vWMLvhYrj0SPQ++ShDr1RZetYOwmkjWXSViApX9agHfSN6
         05ou72qnwjqgvZ0tcXVIBjgFEZcjuYmWCS48zEvcLNla31ffDqrBPYLG9M8moG1znfEl
         HJBoXhIQ7kdvCG4yby5na4t/OXqof1eoSq6+kmllh/oX1m6U51w4VQTxlMv9UM/kOUxv
         IypnwFJDlV2PF7UGTrB3Awqng2rYYiTTjlcDfxr4onvYPZGEsBnOfnV5+ucZXCIueKyX
         BGyg==
X-Gm-Message-State: ACrzQf3aPIfXms2EaC7hOS+TQz/nqHXnd0H4SKRdYl0bdGjr6QEdu4e5
	1G0zRcdUpzhWv+U62te1n4LAIQAbkBXfXQ==
X-Google-Smtp-Source: 
 AMsMyM5LjsSQYyXRneDJMNe9NZMEWu9sTS/dr+voR5FeqcqQg1CV1EdDxJbw+RMO50VajstWobOpOA==
X-Received: by 2002:a63:5a63:0:b0:42f:e143:80d4 with SMTP id
 k35-20020a635a63000000b0042fe14380d4mr342810pgm.456.1664983877070;
        Wed, 05 Oct 2022 08:31:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::32cd])
        by smtp.gmail.com with ESMTPSA id
 i7-20020a170902c94700b00177f32b1a32sm10760913pla.271.2022.10.05.08.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:31:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/2] layers: Bump layer compatibility to langdale
Date: Wed,  5 Oct 2022 08:31:13 -0700
Message-Id: <20221005153114.265420-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Oct 2022 15:31:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15111

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Replace kirkstone instead of adding just langdale

 meta-ti-bsp/conf/layer.conf    | 2 +-
 meta-ti-extras/conf/layer.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index e3542f50..76c1af2f 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-bsp"
 BBFILE_PATTERN_meta-ti-bsp := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-bsp = "6"
 
-LAYERSERIES_COMPAT_meta-ti-bsp = "kirkstone"
+LAYERSERIES_COMPAT_meta-ti-bsp = "langdale"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-ti-extras/conf/layer.conf b/meta-ti-extras/conf/layer.conf
index 1fb77e2a..96d5e315 100644
--- a/meta-ti-extras/conf/layer.conf
+++ b/meta-ti-extras/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-extras"
 BBFILE_PATTERN_meta-ti-extras := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-extras = "6"
 
-LAYERSERIES_COMPAT_meta-ti-extras = "kirkstone"
+LAYERSERIES_COMPAT_meta-ti-extras = "langdale"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-- 
2.38.0


