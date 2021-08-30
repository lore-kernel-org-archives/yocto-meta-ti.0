Received: from egress-ip33a.ess.de.barracuda.com (egress-ip33a.ess.de.barracuda.com [18.185.115.192])
 by mx.groups.io with SMTP id smtpd.web08.14370.1630311894991675513
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 30 Aug 2021 01:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=PFEDtMDL;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.192, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199]) by mx-outbound9-92.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 30 Aug 2021 08:24:52 +0000
Received: by mail-pl1-f199.google.com with SMTP id z10-20020a170903018a00b00134def0a883so72535plg.0
        for <meta-ti@lists.yoctoproject.org>; Mon, 30 Aug 2021 01:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zSynt642PkR5Yh9l2mjC/t1bOt+amz6W4kQUViIWhyc=;
        b=PFEDtMDLuzDeQPSWhyTeUcShIZBBoYlfXpGV7FqRNbNCzE0M1u04/rQNyVT9n01ZY2
         TA3thzory3zhkCrkiqRqv5uj7jYd8VB8Tn30eg69UXh4cmtnbXhy21Lbs1tGJ6QthiH5
         We4op3JNmleV9lPyRr0zBLDtT77jwTPkMSByE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zSynt642PkR5Yh9l2mjC/t1bOt+amz6W4kQUViIWhyc=;
        b=TzSC29uweq0GB3/asjmevkNk5Fl6umJjDWMBnxOVhBizchDMbcVitkJxQDuASxTrjj
         Cf/8Wh3uAL6hspSboteaM0KkX4/mKwX5Zx3kcDLbCrXKoPoHaMtBx/nGqB6MEpzKQnWt
         z9ZxGuDILZA2DVFKRtQtV1QPDsC58lU2rrTzMCJM1GnpU/O016az3Nz9JIbRiNDbDgP/
         ageg/XfyWXskRG0FuiNAO6em4xa6ZUvtF3sq/QNZ7o5juiY5Jkrcbrms+EWzsZ+eKbtP
         ZtIZljnP/TgEdOvJ4CeeKkyTuS47MLjjupWfBbwB/bMHAVJ4RcuyD3PXfGmU55DHkNMa
         f7Bg==
X-Gm-Message-State: AOAM533IYEcLgpskahQfA7vRaCeYQ3FscKXGE61qm0nESbT1Dfpi36ft
	HaliVZqFH9jUL248L3rztmZrblNXSMk6Jg++1FBULi3Ilj0hn0ufpjfYjaFqSpmalsQppGPFJBa
	px7jxF4Uj/0k+6N0MDmmi+lcgpEA29OdwWA6E066HLDKjWj9y+DDHGFdZjvS2jiA=
X-Received: by 2002:a17:902:8d8b:b0:138:e09d:d901 with SMTP id v11-20020a1709028d8b00b00138e09dd901mr3137003plo.34.1630311890705;
        Mon, 30 Aug 2021 01:24:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCwaILBFYXN3OKDxncuCalBghlBDW7n6Jo1qRHhp0STLKCjiURSEIcnUqh0NLwZBy+X1I1ng==
X-Received: by 2002:a17:902:8d8b:b0:138:e09d:d901 with SMTP id v11-20020a1709028d8b00b00138e09dd901mr3136977plo.34.1630311890377;
        Mon, 30 Aug 2021 01:24:50 -0700 (PDT)
Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id g3sm16218242pgj.66.2021.08.30.01.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 01:24:49 -0700 (PDT)
From: "Sinthu Raja M" <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: meta-ti@lists.yoctoproject.org
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Yogesh Siraswar <yogeshs@ti.com>,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-ti][dunfell/master][PATCH] ti-uboot-staging: Update to the latest ti-u-boot-2021.01
Date: Mon, 30 Aug 2021 13:54:42 +0530
Message-Id: <20210830082442.4064-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-BESS-ID: 1630311891-302396-1343-106433-1
X-BESS-VER: 2019.1_20210826.1922
X-BESS-Apparent-Source-IP: 209.85.214.199
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.234167 [from 
	cloudscan14-95.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit

From: Sinthu Raja <sinthu.raja@ti.com>

Update to the latest commit of ti-u-boot-2021.01

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index 53a95f201..6901dcb50 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r11"
+PR = "r12"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "53e79d0e89f975eeb874366dd9a92f68b3a599d1"
+SRCREV = "d77252021a85c72d7ff9a4e151b81c4b4b9e1205"
-- 
2.31.1

