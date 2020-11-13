Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web09.14402.1605229992968191343
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 17:13:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H+HaXO1S;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id i7so5743016pgh.6
        for <meta-ti@lists.yoctoproject.org>; Thu, 12 Nov 2020 17:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wIpBWkHA2ui4jYqaSFbnOWJECNfEvGxchiO7lfbrF9s=;
        b=H+HaXO1SRMETjTWoDXaGcM9VT0jdQpq5ehxt7EdTM6DLH/nDXu+4IOh8m7PuPVPxFq
         7s4bZwtjyOJnMcnT+vqss4mXC1hnPFvhE5BaL7e5yGpxnEwG43pQpJIxWFd77JkY8T4C
         LLtqbVOWF79Vi8iciRh7e79+UhAnI4wY1je9qzypdfm1zgNS49dPLXX51lDJRhKDRGWK
         SvdrUug7LhvqGyjikuOAx+NMyfPrO05cOlR3bUhbmNl/ZNCphwkuFFe9KlqPPiDi2BnO
         XO0jTAAeR/dH/v6nBG2BTOmoz2A9eAftxt5phu4Ti4DkhrYShehbE35loWkGT2XlRtkx
         MMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wIpBWkHA2ui4jYqaSFbnOWJECNfEvGxchiO7lfbrF9s=;
        b=HnIMgUXyQ67PVxTyQbeG6B9vt8ayYP0xyf9HoNfepyQAh0xfyPwWTsFznKbMskP4KM
         tTPA1SOwmH1X536WnTpcGi521esiTxqhxxeBt/Oyrpd3j50Op0/9mtc1Imdk7BblIbzU
         cQLZInQtxMi5ENYrExD4+mzGYJZ8UUjwKuu4mc9FGv31Is7NcWulZXV0JcMDMf1RJ3QJ
         aSMyYMK3NrElwq95cenyPtbulbcPsMIhLkKw3NchUjJxmfWCLvOy9bTtn4fKqD2Ls9v3
         LbdJDXaX2jccnO72wj/hIUrmHC4Sp17KhFR51rX+1IE4n+nDtf66W2W2WWkz9TjpH0Hi
         PF/A==
X-Gm-Message-State: AOAM532zMDT2QH6+5Hu27wkAHCPqBtJ+CAgXoTLdAh5JIRzNnUO5ZWKY
	AcEI5BOBI4DmTntQsNJvUL3NbYO6P5SBrg==
X-Google-Smtp-Source: ABdhPJyZvyjcCU9Gv1Lk4kgpOZsBwJECNavJSILQoCc6hY+7YPWpf5kPXrL5Kc1z2RqcTCyCgtFgTw==
X-Received: by 2002:a17:90a:ca0b:: with SMTP id x11mr571357pjt.155.1605229992080;
        Thu, 12 Nov 2020 17:13:12 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id j15sm7833655pfn.43.2020.11.12.17.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 17:13:11 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] u-boot-ti-staging_2020.01: Fix build on hosts with gcc10 on them
Date: Thu, 12 Nov 2020 17:13:08 -0800
Message-Id: <20201113011308.604936-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Backport a patch from upstream to fix build on distros with gcc10+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-redundant-YYLOC-global-declaration.patch | 28 +++++++++++++++++++
 .../u-boot/u-boot-ti-staging_2020.01.bb       |  4 ++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 recipes-bsp/u-boot/files/0001-Remove-redundant-YYLOC-global-declaration.patch

diff --git a/recipes-bsp/u-boot/files/0001-Remove-redundant-YYLOC-global-declaration.patch b/recipes-bsp/u-boot/files/0001-Remove-redundant-YYLOC-global-declaration.patch
new file mode 100644
index 00000000..4973ea9d
--- /dev/null
+++ b/recipes-bsp/u-boot/files/0001-Remove-redundant-YYLOC-global-declaration.patch
@@ -0,0 +1,28 @@
+From b436a29de12d3f1da579edf3e3d4d42a60b9e58a Mon Sep 17 00:00:00 2001
+From: Peter Robinson <pbrobinson@gmail.com>
+Date: Thu, 30 Jan 2020 09:37:15 +0000
+Subject: [PATCH] Remove redundant YYLOC global declaration
+
+Same as the upstream fix for building dtc with gcc 10.
+
+Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/018921ee79d3f30893614b3b2b63b588d8544f73]
+Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
+---
+ scripts/dtc/dtc-lexer.l | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l
+index fd825ebba6..24af549977 100644
+--- a/scripts/dtc/dtc-lexer.l
++++ b/scripts/dtc/dtc-lexer.l
+@@ -38,7 +38,6 @@ LINECOMMENT	"//".*\n
+ #include "srcpos.h"
+ #include "dtc-parser.tab.h"
+ 
+-YYLTYPE yylloc;
+ extern bool treesource_error;
+ 
+ /* CAUTION: this will stop working if we ever use yyless() or yyunput() */
+-- 
+2.29.2
+
diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
index 991ba0ca..29fa6ee6 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,9 @@
 require u-boot-ti.inc
 
-PR = "r22"
+PR = "r23"
 
 BRANCH = "ti-u-boot-2020.01"
 
 SRCREV = "3c9ebdb87d65aacc4ec302be8bef3df15364bacd"
+
+SRC_URI += "file://0001-Remove-redundant-YYLOC-global-declaration.patch"
-- 
2.29.2

