Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.28061.1628537975877701094
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Aug 2021 12:39:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IoL/7JDv;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id c16so17691414plh.7
        for <meta-ti@lists.yoctoproject.org>; Mon, 09 Aug 2021 12:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jCoID3vjxBtxnzs1Fd4611tCwFXulFttE+yoTCEHI1c=;
        b=IoL/7JDv51hQ/OMyknzTWVI/xIpJSTjkAH+i13yBNohhLWlBXyOdYtGeuaBrVXps+v
         iAsc973a2i7I91Vc1OGdFNDV5baB489cln5TSd1RII1LPNgRLjKcDczcS1zOQcxnrFoY
         9sqorWcmA4ajeJNUc6NpBO5J705/viphLHQojvBRo5gw/wc4RvKh44F7NBs1vjkWSDNV
         wQFFmaou1mvlLOtCpfjAtmkHJyO7t5n6nuMdDcRB7R8noquG9yUj5lZEoI7VTMDD4f/m
         otyD18Rvx6igxlVqL3taOEspGy8d4tOR0SPAKQXvhxCz4PNpJnGRRyY7Mzwg0zGhdN0A
         0ZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jCoID3vjxBtxnzs1Fd4611tCwFXulFttE+yoTCEHI1c=;
        b=sJ2tJVQ5bvIKchDrEbIEWnEeFA8ij723RTjH719GJNE39u91ovGsgY9RG2/2lw71PN
         Vmg3eVyF54+5YpaxpazqCFYkERXcY1+My+rbIqypK1gSXGoigEt9/YUlQfup11ENlJWt
         TmrHTPUPG5tqEiabv4kV0G+nV5mnhgIrNil0aikVwhFwdHCq89J/H0/TJPAni3pdBRYB
         BfWpPQeRZhrkQdEEmn/83O+94k2WZr1RsX3QXFuPVUBmqPrKPKo9UAgzDxXFdRbzib+z
         d0Te7lUEYVSlqAeM11Y5+Z2QZBNSEXz6/+6m/zITs66VDxZooJCa+LZboRMQ/IzSC/yH
         a5Uw==
X-Gm-Message-State: AOAM531qAk/ZtVPHli+uGrhnO8qjRD3ROnnmJEWDLnHQI3j1x0suyeuw
	lt35t52EaD+i99EmfDZ5zaLelX28rB9LAA==
X-Google-Smtp-Source: ABdhPJwQmaYIL553mhK7yzSmedIE9vVdtsMxEAPQSVMIXCtRIs/5Zi54TthH3S8ufnL6Ruu6SRgOQQ==
X-Received: by 2002:a62:f211:0:b029:3cd:d5e3:9e85 with SMTP id m17-20020a62f2110000b02903cdd5e39e85mr12024pfh.0.1628537975160;
        Mon, 09 Aug 2021 12:39:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1e16])
        by smtp.gmail.com with ESMTPSA id b17sm23657962pgl.61.2021.08.09.12.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 12:39:34 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] layer.conf: Drop compatibility with older than hardknott releases
Date: Mon,  9 Aug 2021 12:39:31 -0700
Message-Id: <20210809193931.1080811-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210809193931.1080811-1-raj.khem@gmail.com>
References: <20210809193931.1080811-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New override syntax requires it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 0be0ef92..f399ff03 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti"
 BBFILE_PATTERN_meta-ti := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti = "6"
 
-LAYERSERIES_COMPAT_meta-ti = "dunfell gatesgarth hardknott"
+LAYERSERIES_COMPAT_meta-ti = "honister"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-- 
2.32.0

