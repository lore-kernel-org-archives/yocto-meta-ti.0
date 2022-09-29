Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C54DC433FE
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 23:41:35 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.53.1664494894424756407
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 16:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FYkPgb87;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 8-20020a17090a0b8800b00205d8564b11so2734322pjr.5
        for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 16:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=nQ4YYVU5Lf3JkkIQAFVSxNZAb9ssrtge+yNX7/5Um+c=;
        b=FYkPgb87aHBw/Le0TlMzIKqj0WSV+QNoVWjIZ/1UoWfyuzhFkwGzomqQMOI47pK6Bb
         DvEFLFr3nmR7+xHGGRHrGlmg1fmecflayvmxwLnHBubGcb9mwR3AQ/kF1Cedxo/LxxZg
         DbaYto6n39KUoRYdZ6nsV8AWxTQKeOeDILeFvREV5P8ouF33TcU0pdIS4E6L+Q+QsEg0
         GZ0lTls0hMIMyi9hN8CnkvTgBzYFEJv5lZnOHPL9H3o41XFQZ+BLUOV7j7qV98mPDTjg
         1RZFJ2y7ajMHrIOt313maa9n7fV8+2Kdbh8zWRmtIYgxkPearI20T0R+8uTJd1Nfz3VK
         3bMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=nQ4YYVU5Lf3JkkIQAFVSxNZAb9ssrtge+yNX7/5Um+c=;
        b=Qf0Kb+mvm+AybVTCZk7Brl0KNasnENMs27frz14jgINmmGiKU2giEuMwNQx90SWZeM
         U0N4MNqfWpu0jZJOBoCfYw6Fts06C4R7I1CGEjGSfnUlkrdilPvVuTOUogZSO1vIQDBB
         BtAEhwcX4mEACy3+/LzRgfcE2KebcqJfUVoFdEEkkZPlknl67YYQB46kdvws/xu0Qgn9
         2l65vxuXJKWbe020MsurGo77kencSl8SzmhjTrrZCScq0gpQhKNFKuw5BqfWgkfgY5KN
         K0u2y/N/do5NekduyDfxUKp3oujyBPcxRVjLDc/1mQGXYBwsg43fykwnRk6BSU82Je1E
         Z7tg==
X-Gm-Message-State: ACrzQf0QKkpIzKBNmr6+pk2770J01FSPTwJk2bIWGmhrT/lg+7hk+BwJ
	ynykVstK1LkUzvT1DUpwTukF4Ga+yr24Vg==
X-Google-Smtp-Source: 
 AMsMyM7BSkdzv/oXovvVJqq5ozJKd2F8vAF1wNDEk1bfz3WIf/kC3laj4j0fMwhB4RG5HF5jgwTwxA==
X-Received: by 2002:a17:90b:4a4f:b0:202:8d29:c188 with SMTP id
 lb15-20020a17090b4a4f00b002028d29c188mr6292689pjb.199.1664494893747;
        Thu, 29 Sep 2022 16:41:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::dee7])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a626d03000000b0052dfe83e19csm269641pfc.16.2022.09.29.16.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 16:41:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] layers: Add langdale to LAYERSERIES_COMPAT
Date: Thu, 29 Sep 2022 16:41:30 -0700
Message-Id: <20220929234130.3622999-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 29 Sep 2022 23:41:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15103

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-ti-bsp/conf/layer.conf    | 2 +-
 meta-ti-extras/conf/layer.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index e3542f50..39e7f9eb 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-bsp"
 BBFILE_PATTERN_meta-ti-bsp := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-bsp = "6"
 
-LAYERSERIES_COMPAT_meta-ti-bsp = "kirkstone"
+LAYERSERIES_COMPAT_meta-ti-bsp = "kirkstone langdale"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-ti-extras/conf/layer.conf b/meta-ti-extras/conf/layer.conf
index 1fb77e2a..b42c1a6a 100644
--- a/meta-ti-extras/conf/layer.conf
+++ b/meta-ti-extras/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-extras"
 BBFILE_PATTERN_meta-ti-extras := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-extras = "6"
 
-LAYERSERIES_COMPAT_meta-ti-extras = "kirkstone"
+LAYERSERIES_COMPAT_meta-ti-extras = "kirkstone langdale"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-- 
2.37.3


