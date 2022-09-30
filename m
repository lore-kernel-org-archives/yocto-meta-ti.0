Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B9DCC433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 11:15:18 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.4377.1664536509481639961
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 30 Sep 2022 04:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DaK+8TOb;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id bq9so6339457wrb.4
        for <meta-ti@lists.yoctoproject.org>;
 Fri, 30 Sep 2022 04:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=pJkcvE1XCFqQWj+nnKqHQEhFlhUZ6nwqXO8pkqoUXUs=;
        b=DaK+8TObNInfziAgasnhSt7G29kvBk2YQMAMrXVmbOgClSHVbsnbgSV/k44jNTvxI2
         xzPEtRB29HqpgpjgNWv0XF3/2gN8pJlp56eCbmqUFA2cOsDQRS6mlOg6i7Z1r5JG9bYI
         ecxSqYkQuCyye4XBi2qV10Jv16dmUUKBcw/a7Kp435L/bvRVYlTbnM67i6MFP1CdN4vK
         5L1tnLM2DU9FR8IhkofNybDcESTvW7cWZRop82By2JaW91NvxqNEOAm9SpBGyd2gMD0C
         vFvFfxEls6F4QOg6+o1A0SjI6YObX/gqhdzIYbZaUkLOsXkvBkvTKa555s0uzuOLrioE
         hIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=pJkcvE1XCFqQWj+nnKqHQEhFlhUZ6nwqXO8pkqoUXUs=;
        b=eTvfDID6GUqmk0E8dPIznankKQBEjUVPwWH3C4+gcU/GP8dgbsSB9mPXkCeDPn7ba5
         MquroEYEYRGt37hjKQZttFNgX8eRWS91wXqnRVQ5UAsrtokYhrzk858cTV0+eu2kO3GA
         /SpHnWGohOkUJI9IYG2ET2tECUOV3xm1Q9LztSPGzCKSDdsywtiYY/POJx5UjqVfNthB
         nlpU8UMZkOiAeSaa5pQYa/7qq5/cC1sKcRJ3GqEuuW6xyK2a9itW2oynh7Sw0ErK9p3j
         vbHBA4hnnJSrj7Ep1ku8yD6MW8ofwAL90h4Dbuy4LfQKoA93EI3zhizYJtC2NfdVXh+t
         b8jQ==
X-Gm-Message-State: ACrzQf3qQbLKMEAl5TxZr8Dji5Ybw8I53+5qu2WPGgm18zZwtPY9qSAQ
	RVsZ2V5QEaVSLp3j4vzRt2Kcv7xu5s2yJQ==
X-Google-Smtp-Source: 
 AMsMyM5RwSGC7JFovcM3I/wn6Vyz72Z9A7T+DdXG3OxgcQZclxdws+BP+kLXAO1SA8S+xmnVgzsJWA==
X-Received: by 2002:a05:6000:1c18:b0:22b:13e3:19d3 with SMTP id
 ba24-20020a0560001c1800b0022b13e319d3mr5569321wrb.699.1664536507115;
        Fri, 30 Sep 2022 04:15:07 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net
 (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id
 u12-20020adfc64c000000b00225307f43fbsm1881853wrg.44.2022.09.30.04.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 04:15:06 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-ti@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH] meta-ti: set layer compatibility with langdale
Date: Fri, 30 Sep 2022 11:14:43 +0000
Message-Id: <20220930111443.2520958-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 30 Sep 2022 11:15:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15104

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
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
2.34.1


