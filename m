Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.5455.1616048301698189103
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Mar 2021 23:18:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fUHLrlFk;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id q11so760106pld.11
        for <meta-ti@lists.yoctoproject.org>; Wed, 17 Mar 2021 23:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VRZGtT5bsBWqsL2vbswNC8y37RpQDqiUxf7O7qun1Gg=;
        b=fUHLrlFk30hKwgxtRcyyENUi+JMDB+HWUMfTfhfQX57SOBTNYWpmjQpityonh2WmbI
         Z54pkunNTXc9bkP9wVawVXXzk2ow7bRwzUmOb3fBT5vz9e94s8AWlMmQxhKpLwZfZCkD
         e4OwpXKbqVSON91ry8euKxzAcdtLDsUHbmw0PkNkvcm8RUIW4mzQUa7Z4SCGUDljOA1k
         bxbfQ5WG1n3wAR9aX/JN2xeoxDEGlNe1WLRqr6JS2LMx9NxGJkVO++kSrbcE0aRrG/vE
         lqPdQ6KmHEUdScS6UafKNqTxZx+5Oqf7rvO//uBFtMYoyO9mnuzoaAWa07NGaIglDWtI
         ZtHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VRZGtT5bsBWqsL2vbswNC8y37RpQDqiUxf7O7qun1Gg=;
        b=XinT6PcW1KulqJvJzjCDDaPhE8cSDpXCyEWOCPfHYX4k6IqtNaOtWaAVUhfb8C0bvb
         XhBU9IwbdSvIlk36zEKsg9Uo2pviMRPubH5eHYc9hqI8sO81Y46jD/tyJQIiRp35RTfp
         +V+DEIstbEZAZHeQ5sdc3Ui6H6CFcYxGWqnsoYf1fbCO81PUdPtseUMeLTVGz7SBzMgx
         Kw0j6j65hvNpPv1mkBm0nHKdN1aXQQx/t+RkG+l2ejwKKWdeYW2iFkIFeAMdRmDrZLVm
         WiXKfSlOrb0xSTHjDHtIMfvQFLg//C+d5Bj6vMDCqqRLzNYWUhXuI4Yzbtb3nn0u5/k+
         ZnhQ==
X-Gm-Message-State: AOAM532xMPtKHkiCfDQlkL2NEqTOqpBrG9mDPv4vT/SfPElXuCkuCuRA
	m6kWGfX3qFc7wP1Ul/9VIOugzDXxBS++og==
X-Google-Smtp-Source: ABdhPJz4XMk1JUzzVZb3UYhkQSI9k8FOTGLNINizfpHsUhds9IKDOVNYBuvZrYhGq6PFQphzwLg4Ow==
X-Received: by 2002:a17:902:b94b:b029:e6:819f:2d80 with SMTP id h11-20020a170902b94bb02900e6819f2d80mr8093725pls.30.1616048301014;
        Wed, 17 Mar 2021 23:18:21 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id b3sm1012722pjg.41.2021.03.17.23.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 23:18:20 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] layer.conf: add hardknott to compatible release branches
Date: Wed, 17 Mar 2021 23:18:16 -0700
Message-Id: <20210318061816.1562693-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 2393e61a..6fb214c6 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-ti"
 BBFILE_PATTERN_meta-ti := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti = "6"
 
-LAYERSERIES_COMPAT_meta-ti = "sumo thud warrior zeus dunfell gatesgarth"
+LAYERSERIES_COMPAT_meta-ti = "sumo thud warrior zeus dunfell gatesgarth hardknott"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-- 
2.31.0

