Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.943.1636046978441636424
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Nov 2021 10:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MpTxd2/Y;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id p18so8314064plf.13
        for <meta-ti@lists.yoctoproject.org>; Thu, 04 Nov 2021 10:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/RotQQUZEfsXpgfa78BUPcRzZT7b1gNnOZdxs4ZEgO4=;
        b=MpTxd2/YgzIPdM7qQNMuYPZSY6EL4ZliTANghGp9JFMC68Mpw+lFWL4OxRgFSSVX96
         bD7iz91xh+Ygnsv9yRJLDcp0k9SVfgpCQs24jaheRsp8HugWjJebZeqCwWviAnhoAEbh
         O8PYlxx+HZnoV6DUl7nRC8SK3svqff0CFuSDJjlCCUGPOIFMapNJGPMvXEoLpPkr/sYT
         nVgUuCONDfmdWI/mDPjNI8YSpQcTgpX7uVDX/oXwiDAclkQojqRt7duc1chrLQzB4ZfX
         rATBSVwVfTW45grd6SCvl0326b7kLJpC01X7V47n0iJQqYTscNi9EIfwxtmcCQqOUZOE
         A8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/RotQQUZEfsXpgfa78BUPcRzZT7b1gNnOZdxs4ZEgO4=;
        b=ZSBk2mxrIM36FTGAPbV6aa6lN6b1AwN52M3K5bP8hZpCYyLmY4AojADNRjuStFS7eK
         usVhBJXQAuCdu2F7e2yIiOzhPeq4mvuQSASQtY6vMa1336AoXJDdH6wmKtCx+a/0AJqi
         jQ4tQqdFdt3lytd2Xuz6IQAIT1d+pgrA3/CvYWY0gMaW5zhsG3zjCEHTkUEu5Mm+MSRz
         yQCplSjMK+ogJfkJ2HmSnqv75sFdwSs7Qh9uUsUdA10ww/cPH7D02qOJ2OhPHPEXmT6G
         ZzcXzpB8qDcqMbAk9zWCMskpSztOuxNcBbqYaoKZb53v+LEPEVkWupTzO31fY8FkBQ+D
         RcLg==
X-Gm-Message-State: AOAM533dXMytVVurHt5p4fkvJiio06tRP/r6vOxWnO3hQP20FFwd6mgZ
	B1a90t0DVSIpnwvs/216IfAwE6ESDSA=
X-Google-Smtp-Source: ABdhPJyc25LGzeMqJEpdzB3hvg2RhefPMUJ1ts6DmsoNrYJrAC3cgA3Vcf5znJ0Xo+uEDa4dOxebKA==
X-Received: by 2002:a17:902:a584:b0:142:3599:5544 with SMTP id az4-20020a170902a58400b0014235995544mr4444125plb.30.1636046977600;
        Thu, 04 Nov 2021 10:29:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id b13sm5599199pfv.186.2021.11.04.10.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 10:29:36 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] mpm-transport: Do not use append with += operator
Date: Thu,  4 Nov 2021 10:29:34 -0700
Message-Id: <20211104172934.4088591-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this is undefined behaviour, mant times devs used them together to get
the missing space at the beginning of string which append/prepend needs
but thats not intended behaviour

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-ti/mpm-transport/mpm-transport_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
index 38aefc24..3b80af34 100644
--- a/recipes-ti/mpm-transport/mpm-transport_git.bb
+++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
@@ -21,8 +21,8 @@ PR = "r0"
 
 CC += "-fcommon"
 EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
-EXTRA_OEMAKE:append:k2hk += "HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"
-EXTRA_OEMAKE:append:k2e += "HYPLNK_TRANSPORT=true"
+EXTRA_OEMAKE:append:k2hk = " HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"
+EXTRA_OEMAKE:append:k2e = " HYPLNK_TRANSPORT=true"
 INSANE_SKIP:${PN} += "ldflags"
 
 S = "${WORKDIR}/git"
-- 
2.33.1

