Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web11.1101.1585085254835250767
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Mar 2020 14:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eCxAJGSS;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id v23so3898323ply.10
        for <meta-ti@lists.yoctoproject.org>; Tue, 24 Mar 2020 14:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oyEqUKUnvFhDg6brXCNXNl+EkMhgR+nmmKVARNgGGJA=;
        b=eCxAJGSSj26qhsCoxZu61KKoBzaHsJZCx3wdottz8NY3ceIxZIiVVu9SZgAMqpsNlC
         uucRk6/nLAMeqJx9GQTxbiyA4jhmivFwTDB6etjZkA+mo29tIH2nt/7aRsVmNbKNfLUR
         6vY9okk3fkZrecgXdhLE5hNviA0LQQm2kCuLztTUSjl74tU/YlQ+VoPfsMGQwYWOcdMk
         T+c/AXe1sR5eSjOSr8sbzeCtLfV6qZpx0zxUSiwMLzaEIEnbD0Vw2gIP3MPVV7dVA9MB
         /e1dR5dpFAPQTQ2O7uA0iy9EDIM+HlnWRsZHbUvRdsPWEfL24qL52ocL+ezqemRfZPsa
         TWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oyEqUKUnvFhDg6brXCNXNl+EkMhgR+nmmKVARNgGGJA=;
        b=WND5BwgJF47wEMTwlKZLTkZssO24NHJaWiTRTD8YwehyQpgNDlZ8TgGD66xKMW3p1f
         etTIPsWbdRkQerw4+4YLsB1ZIxjmED7H/mjwcmE0FDrpLttk+e3GxRxzMHdNLheXLYgz
         X+6nyipOzVez17BIxwSMF8aG0Hia/lhxItl+NbioAh+pXjFrQd6Zm9egGMOdcvGhneXJ
         EIzU1QLlHhkulU9tkYStyi51VRbdR6Zl54kiJlJiLUtTUTuYLeLlnOZu/dfFb11+6gWX
         uLY2a9algImBEH6i3sONWIw37fFkpXqJzfQiBIMI460Lk7sVSn/eG+xOLHCpBJSdK7Xd
         70TQ==
X-Gm-Message-State: ANhLgQ0AcR3LRpyKfMa8BcWmS910l3c5rAVkoKj+s/YEOIgVME3gQpn8
	ZUJoyvt+RosqTA9dH8//1UV7pP38jKs=
X-Google-Smtp-Source: ADFU+vsnps0sJ8orRuxbmtPdOVXnwc7O2RfjWtIm2PQVhfpblWsSiC++YhlYfruKh2AFE/ppufzLFg==
X-Received: by 2002:a17:90a:d3d5:: with SMTP id d21mr7731785pjw.27.1585085253827;
        Tue, 24 Mar 2020 14:27:33 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6809])
        by smtp.gmail.com with ESMTPSA id o18sm1188498pfe.58.2020.03.24.14.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:27:33 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] layer.conf: Mark layer dunfell release compatible
Date: Tue, 24 Mar 2020 14:27:45 -0700
Message-Id: <20200324212745.54997-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index cf00d48d..33a74070 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-ti"
 BBFILE_PATTERN_meta-ti := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti = "6"
 
-LAYERSERIES_COMPAT_meta-ti = "sumo thud warrior zeus"
+LAYERSERIES_COMPAT_meta-ti = "sumo thud warrior zeus dunfell"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-- 
2.26.0

