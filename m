Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web11.2010.1588360452626488385
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 May 2020 12:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VfYS109V;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id y25so1967341pfn.5
        for <meta-ti@lists.yoctoproject.org>; Fri, 01 May 2020 12:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CNijAwN/ffPpFnkxoWiWztQyxUrhWeM6s9AqiYI9jG4=;
        b=VfYS109Vf2kZgSHNjaIxdDgrVBteagmVN5Y0gHmNim900Hl0hJzbUu5r0APh/pCK/S
         1hHKnZrCd/45K+xmFub1zUgDZ7YgnhKWJIwm58D7dXlqzqWbLQLC0lswn2UxCgNekDdf
         4cW91+hfdeaOO+gl4Td0ZnmKaO9q2wHmhT0ybPL2EWnHuOMib18+SMLwlzX8WaO8LY/a
         kVYbPdS3r1e6P9lAdVBNr57Hzm+1pYJ98sUgIZfayXLFl7/nr1OV5AoUbuolUV11cj8T
         3IuMcHMviGbnbHc7Ii6Cgd1+NdRlBT2QidpVENN1tdjulUErhS+RfXDFQHk7oxfW/gBo
         96hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CNijAwN/ffPpFnkxoWiWztQyxUrhWeM6s9AqiYI9jG4=;
        b=Fy5HNpwo1kyPfDTKIvFjfEsUB0CtRHdvWSE1RB1GQRDcQt3SpBj8zq/saQYhXW2JYx
         VJNMVCcQWCLLV8XGlFYM8p0PjbmJebYKwEPOrPO4nr5eLy/1QL34AlCPmh5EynUJFgfU
         +tYdc1L0TDuRcbsDCorza7Q45VMZt1HtNXaXXcaXrlAL/A7PwJ70sU4OZBhuRshJeGg+
         eZEt5PYC5esnKGVMEsD9wE65pd37sb9Y/lS3XjtIc0e/7XD827SrRchG2Ao8mb4jcEZR
         T+AH1BzlQ6e0Ph/sDP+U+ur98t4XFdfaiyheX83cJfmfWCur8aMD7XenL9BsBjGfbFPY
         oxYg==
X-Gm-Message-State: AGi0PubS5jdK8FBMgHU6TNzoCsKTAVSDhNTe+FMsWG0yXv/+KMjKjkhz
	7fwqn6y/9ziCL3oAJgjfGqCfHU+hink=
X-Google-Smtp-Source: APiQypLpOMNg87h2V+YvA2sARtrRKC2Zx0sFO1duceri2FKU/LdKmf6A1KVTQmUXyjOR6iMD4BM5Fw==
X-Received: by 2002:a63:1e18:: with SMTP id e24mr5339304pge.296.1588360451534;
        Fri, 01 May 2020 12:14:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b3aa])
        by smtp.gmail.com with ESMTPSA id o1sm322925pjs.35.2020.05.01.12.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 12:14:10 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] u-boot-ti: Limit compatibility to TI SOCs
Date: Fri,  1 May 2020 12:14:09 -0700
Message-Id: <20200501191409.43178-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-bsp/u-boot/u-boot-ti.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 736efc0e..04ff559d 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -38,6 +38,8 @@ PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}/boot/bl32.bin,,optee-os"
 
 PACKAGECONFIG_append_aarch64 = " atf optee"
 
+COMPATIBLE_MACHINE = "(ti-soc)"
+
 EXTRA_OEMAKE += "${PACKAGECONFIG_CONFARGS}"
 
 PROVIDES += "u-boot"
-- 
2.26.2

