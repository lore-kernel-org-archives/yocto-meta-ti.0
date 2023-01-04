Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD9BC4708D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 20:07:43 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.1385.1672862854767053640
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Jan 2023 12:07:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oNcBpI68;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so35558323pjj.4
        for <meta-ti@lists.yoctoproject.org>; Wed, 04 Jan 2023 12:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kTRc+YyTdEWgQESMX52AP9USQzxk+Hu/eZbCKNNUJxU=;
        b=oNcBpI68ebM82eTd9eBA8Gq/ROMRfcYClS+0iKFWE0SZOThfOlAjtnuH7JJ/gjfb10
         fwA7Q/Efn8Er9JWBZNDtTYTajgxlMJhCEYAHeEhiA2vX0RP8Jy4+aT8WJehr5uCHl5HR
         ZWcmdogxcyG8Mmj4RApvSqXiErv13y3LhDMIHPtQyGbcGCfo/T64fxMi9jOlT+5L6fyO
         Pbb0KnaE2Wx0c4akOM1NwTh8ykFneVFihEFg+UtsmduAUt9JYsPfZxNBfoHJrjfULckA
         2+d8+DwjQPjTYncQb4o2vzbh7G8X1cFiwW26RKu4MQVLX95V/PeLjlHx2tamBA6mmLAR
         wZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kTRc+YyTdEWgQESMX52AP9USQzxk+Hu/eZbCKNNUJxU=;
        b=T++PP4yxq+gdLZl42KQ3n/ONDPUqLI2pX9iUIh5SNzcW2RuOXRWBdJJktSeLnoIbIL
         RdodXHhYsfzrp92tBb2y8RGZ4ReJmvT/L8igcb5XFFkrtBOMxAR8mqE/krY1WhAoFouV
         /mqrxRWRKmCTHxb1iNKCEFfEEfqY0yYwOdQ1sH7zGb1/kI7IkPPLReO1AFqCE734T2DK
         hn5H8X37tJ1OkE04BAnXWWfgoyfhZAUT8Uuush7LL7GxJsygqMFZTrXQTZijiZipTsBy
         qe8uTFCMl8xTYBq6Gfq8yBor1I4MB6jBakZhKOYlfOn8UA9EpmCxU4b/zzaldHg4X0vz
         oA/w==
X-Gm-Message-State: AFqh2kqBBwM9ORZ2cGw7+djN11BywLyCvnxyP/aaAWff/L/N9+D/W2gq
	Af4N8Hte+ItkdKkm9N/Cmbhfn+kYRfA=
X-Google-Smtp-Source: AMrXdXs88Wuc6fPPWOxSrjpd+FqBacXKTep4zTiqZJK7PFZ5bLti3zRFAToq/6vyGk3CgLps3hu8Dw==
X-Received: by 2002:a17:90b:1047:b0:226:5b14:4af with SMTP id gq7-20020a17090b104700b002265b1404afmr17150050pjb.38.1672862853882;
        Wed, 04 Jan 2023 12:07:33 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id d7-20020a17090ab30700b0021904307a53sm21133193pjr.19.2023.01.04.12.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 12:07:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] layer.conf: Update LAYERSERIES_COMPAT for mickledore
Date: Wed,  4 Jan 2023 12:07:31 -0800
Message-Id: <20230104200731.3003677-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Jan 2023 20:07:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15525

oe-core switched to mickedore [1]

[1] https://git.openembedded.org/openembedded-core/commit/?id=57239d66b933c4313cf331d35d13ec2d0661c38f

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Keep langdale in LAYERSERIES_COMPAT

 meta-ti-bsp/conf/layer.conf    | 2 +-
 meta-ti-extras/conf/layer.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index 39e7f9eb..25d8b990 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-bsp"
 BBFILE_PATTERN_meta-ti-bsp := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-bsp = "6"
 
-LAYERSERIES_COMPAT_meta-ti-bsp = "kirkstone langdale"
+LAYERSERIES_COMPAT_meta-ti-bsp = "langdale mickledore"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-ti-extras/conf/layer.conf b/meta-ti-extras/conf/layer.conf
index b42c1a6a..072dc000 100644
--- a/meta-ti-extras/conf/layer.conf
+++ b/meta-ti-extras/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-extras"
 BBFILE_PATTERN_meta-ti-extras := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-extras = "6"
 
-LAYERSERIES_COMPAT_meta-ti-extras = "kirkstone langdale"
+LAYERSERIES_COMPAT_meta-ti-extras = "langdale mickledore"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-- 
2.39.0


