Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web09.1459.1603217765668745320
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 11:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CSsi+fuD;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id l2so587350pjt.5
        for <meta-ti@lists.yoctoproject.org>; Tue, 20 Oct 2020 11:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lvKox8SC7Edt4ffFrD6417KDVJUnGYq+pCF/S8wTlyU=;
        b=CSsi+fuDcU5HlTbz1wAzwAMLSpWop7djFScOU2sWktP3ZsfaeuFrcGKS+JImviSQSJ
         xHYussz1KzmLRmK47+1jb2rgklLizcu1h5O3tViqUH3QUrgwgN88GOW057I3LhfziNH/
         go4cAkXFxhF3cxNbtPOHkh8HQ3/Ogazx4C8SpvVI313w4CHLrm3RAkr9KMQSyyYP+e5Y
         mFw/K5Enrcu4FIQB/4m6Hp/Mrj8yEck/EaZksVhYZA0MDxI+Gi9rtPYYeqY0FsYvCD8b
         6ExbY30FYlPKTUkktvlCxzK3xZUbP0hyxLytMtYej5+NIdz1JQ1VID1w00QsHQchx5ma
         6kNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lvKox8SC7Edt4ffFrD6417KDVJUnGYq+pCF/S8wTlyU=;
        b=R5lykAfdruCM+B3O0rmQYNkN9L96YTyiVqVDLJseMoDs6nGmmgMCHEEGFApho59MWm
         NKmuAJnfiXO38VCWxzqTeNksZvFQjx5IazwfD0enXGAdVTGCbrabMSX5gC6UloyF75IK
         0TvabcB+4AdHmKbrrt2hvFbV4KXgivVUxuhj00kgaCAS8qeHXcFgrWM+/9/a0eQU7peK
         yaRE2uIWFvLgMEjl4Syjbz4TkL9xQPBEvNjK4WaZ9SdYHzUc1X/wFFjr/wITJ7fFrlPG
         CyVPiftV40DFhF3Jb3dmEBnycxo0O55H+JVqOG5AxfHlyE4gXDonupVw/F/ZfBtErWxu
         S49g==
X-Gm-Message-State: AOAM531Tv7jC1hQ1mPTvcTqpEaLpbCxt4zHWYotUR6pC164ss1pIQZq1
	nDKUoX94qYxuSBddbpqUY/LJHydYrXiIEQ==
X-Google-Smtp-Source: ABdhPJxrzedUesQHNVzwZvQKfv5Zb71oqcdhsmLIXK+4Kt4DCaCM0D3pRP2EZwa6Tj9qHyHwFoX3wA==
X-Received: by 2002:a17:90a:8a04:: with SMTP id w4mr3931412pjn.201.1603217764758;
        Tue, 20 Oct 2020 11:16:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3958])
        by smtp.gmail.com with ESMTPSA id b128sm2754793pga.80.2020.10.20.11.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 11:16:04 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] layer.conf: Add gatesgarth to LAYERSERIES_COMPAT
Date: Tue, 20 Oct 2020 11:16:01 -0700
Message-Id: <20201020181601.29276-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 7848d196..2393e61a 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-ti"
 BBFILE_PATTERN_meta-ti := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti = "6"
 
-LAYERSERIES_COMPAT_meta-ti = "sumo thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_meta-ti = "sumo thud warrior zeus dunfell gatesgarth"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-- 
2.29.0

