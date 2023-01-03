Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D616C4708D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 18:36:18 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.1422.1672770971749281077
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 Jan 2023 10:36:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aZnP/NDE;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d15so33540341pls.6
        for <meta-ti@lists.yoctoproject.org>; Tue, 03 Jan 2023 10:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L6EyHAoNY1gJ8y5fstgJP4pdqc9szyCArcspixF4JwE=;
        b=aZnP/NDE61pbTPKQQKuYGHq/yQZFY5MDo/KzlkuLRBsE1lmSQfYXIX7WwMoxWBb4zZ
         0f6wRdls1lU0rG5Yk+YnbPmKVVT/V44m/xHOz45doe+ZnpKdpF2O/eMqQdTqoJGoYVXH
         g1/MfLwvE3hEsnuGF6YDIn4S6D3NbdUC3U9TTd7b+c0GWe36fVizft7iNJtYgG+A9sO6
         hU49/F/SElVhsHUSafPe+yNgrC+AurWm0X84H7X//iCfxHNW9+pGUkICUFIuywOS0fI7
         Ysht4XAVMMEdLVGp7CH36DJzFvSIV89aeF7uUYl0Rqpt8qSFErA+O0xd+//mDiA+5Ln5
         9b3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6EyHAoNY1gJ8y5fstgJP4pdqc9szyCArcspixF4JwE=;
        b=Rc0HJd5RyXMN01V+J6+cedq+4PFEeyPBIAzrxyaTfBI8KlbGRUi70gFIM4oHu89Uhi
         VopITXOu9Oq2/CVzDYYhrxzi28u5SVoHvHYJwWJRGeJMrsVIPU91BBlO+hLbqnZs0LIb
         qfYKCWSP6ypyUgFPtXgG4sfupLVMktrPGyRy50XLqVQfdGKPNfEMo3mDoI3qmWBwaryH
         WM9rezH/hV4lFo68Gl3y+LdgDf384qvgarQ4JbuakSffeB9MyicmUPOdpF+jQGYYXdX2
         4M6b+MKTB96rHvN7XCadU9ipSdR03kS62gw78z5cWidsaLXa4QKD3ok9KuZOaLxyP3Tn
         QR2Q==
X-Gm-Message-State: AFqh2krFdF6yPaieIAl4Xn+bgLYswE94J5jgjFdX/vUDIOCWMMA4mmZw
	89ffMfQwr+wIEJMmuBqYcMKjN88KySk=
X-Google-Smtp-Source: AMrXdXskRqTlQfQx/vqu92cN74ScvrOoit3YWrHxbMunCSBJ1GPSUIXuFmhUwLNRlc5+hVC9z4HI4w==
X-Received: by 2002:a17:902:ed93:b0:192:ab25:45c2 with SMTP id e19-20020a170902ed9300b00192ab2545c2mr16498553plj.54.1672770970663;
        Tue, 03 Jan 2023 10:36:10 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id b17-20020a170902d51100b0017f5ad327casm16281526plg.103.2023.01.03.10.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 10:36:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] layer.conf: Update LAYERSERIES_COMPAT for mickledore
Date: Tue,  3 Jan 2023 10:36:07 -0800
Message-Id: <20230103183607.1256069-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 03 Jan 2023 18:36:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15512

oe-core switched to mickedore [1]

[1] https://git.openembedded.org/openembedded-core/commit/?id=57239d66b933c4313cf331d35d13ec2d0661c38f

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-ti-bsp/conf/layer.conf    | 2 +-
 meta-ti-extras/conf/layer.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index 39e7f9eb..f3d43eee 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-bsp"
 BBFILE_PATTERN_meta-ti-bsp := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-bsp = "6"
 
-LAYERSERIES_COMPAT_meta-ti-bsp = "kirkstone langdale"
+LAYERSERIES_COMPAT_meta-ti-bsp = "mickledore"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-ti-extras/conf/layer.conf b/meta-ti-extras/conf/layer.conf
index b42c1a6a..cbe9d83a 100644
--- a/meta-ti-extras/conf/layer.conf
+++ b/meta-ti-extras/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-extras"
 BBFILE_PATTERN_meta-ti-extras := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-extras = "6"
 
-LAYERSERIES_COMPAT_meta-ti-extras = "kirkstone langdale"
+LAYERSERIES_COMPAT_meta-ti-extras = "mickledore"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-- 
2.39.0


