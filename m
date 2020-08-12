Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web11.6048.1597195035161508885
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Aug 2020 18:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ci9Shso8;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id ep8so301598pjb.3
        for <meta-ti@lists.yoctoproject.org>; Tue, 11 Aug 2020 18:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ou3CfC3c7Ab7IdEoyCm5RyxwLdIzZgDw8aD5EBrtRFQ=;
        b=ci9Shso8RBNI4S+994VEwlytrJ/xuQwWoBk76D18RfXVhLXEHir+HvGXrjLsG+dv/F
         bxPAwY52EUN5uPR/I9XjFxeMUEhd2BKuX5k3IMkWX9koHzaBILlz/2Pq/oofT5qKkQTF
         djXivtj4yQWiCDQ0Vmw1XL1lE2T67bg21Z8P7oQjRD/z53RjQ/Qbn84JYxHnYe85ac/s
         5mJi/cP9eDZFYs8w70TkGFMvZs+omuNZOq8PlIpzWYefu5RObdGPwsExJAPTiNHWhMR6
         aBHXEvUeZaH3GX0BZEhtCN59f6mH0Ps5PmzCcO5jz0msCrSFflDH6L6Lq8Cqxvg/NdhT
         Gf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ou3CfC3c7Ab7IdEoyCm5RyxwLdIzZgDw8aD5EBrtRFQ=;
        b=Y2TGgEbdtGt8TtkLTenpJISFI6jcOka/+tKQlr8BC/S76Xor09Efgi57ByfuxmmB6x
         Y9TrgJtYGcgZyak7GW2qe3OiN8Qk6V+b9g4Ag+S0+e1IgghSDL7dwt6vxEZPwMOyqWwq
         i461CsDuuDQk6Fd8f4Zda0lM2VRTQUSPQ569c9pqXWe/xMT1xSSutOQMKb6xMsOW7lN8
         5DH/3HsJzHmJGMf5w5aFSHJ44xl2Vf/S5CgRDFLwfkBdQSQOWwYEMRVviC5bV5IDGrJ1
         bh2XZJK7anjPizAoXY+dNIy9EzKTklR1l81/B5GLtGOzr9wsJvIYC9FUj5qCd5nK30sW
         nXpg==
X-Gm-Message-State: AOAM530mgXXtpZFdpLFlruIxixih8pTfGJgvk20HStp8xktuhFt7z9/W
	+2oWD5M+5u8JemOduIvXJX6HTTYzHtY=
X-Google-Smtp-Source: ABdhPJwHXjOYcrssHedn9HX+9ALWpI8CuNfkCOvNs54JnAABbwpx4aDX1y9oYlzHY3rZa1SGm9TNSQ==
X-Received: by 2002:a17:902:123:: with SMTP id 32mr3035643plb.143.1597195034067;
        Tue, 11 Aug 2020 18:17:14 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id k29sm312096pfp.142.2020.08.11.18.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 18:17:13 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] wl18xx-calibrator: Fix build with -fno-common
Date: Tue, 11 Aug 2020 18:17:11 -0700
Message-Id: <20200812011711.1595431-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ine-EFUSE_PARAMETER_TYPE_ENMT-type-e.patch | 35 +++++++++++++++++++
 .../wl18xx-calibrator_8.7.3.bb                |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator/0001-plt.h-Do-not-define-EFUSE_PARAMETER_TYPE_ENMT-type-e.patch

diff --git a/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator/0001-plt.h-Do-not-define-EFUSE_PARAMETER_TYPE_ENMT-type-e.patch b/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator/0001-plt.h-Do-not-define-EFUSE_PARAMETER_TYPE_ENMT-type-e.patch
new file mode 100644
index 00000000..fc5542e0
--- /dev/null
+++ b/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator/0001-plt.h-Do-not-define-EFUSE_PARAMETER_TYPE_ENMT-type-e.patch
@@ -0,0 +1,35 @@
+From e3f694496322d3679dd9b007dc3caa4343f0f376 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 11 Aug 2020 18:12:58 -0700
+Subject: [PATCH] plt.h: Do not define EFUSE_PARAMETER_TYPE_ENMT type enum in
+ header file
+
+gcc10 uses -fno-common by default and this causes multiple definitions
+of this enum in all files including plt.h file, therefore just define
+the type in header file
+
+Fixes
+arm-yoe-linux-musleabi-ld: misc_cmds.o:/usr/src/debug/wl18xx-calibrator/8.7.3-r0/git/./plt.h:402: multiple definition of `EFUSE_PARAMETER_TYPE_ENM'; nvs.o:/usr/src/debug/wl18xx-calibrator/8.7.3-r0/git/./plt.h:402: first defined here
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ plt.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/plt.h b/plt.h
+index 8b534a9..43d5dbc 100644
+--- a/plt.h
++++ b/plt.h
+@@ -399,7 +399,7 @@ enum EFUSE_PARAMETER_TYPE_ENMT {
+ 	TX_BIP_PD_BUFFER_VBIAS_ERROR_E,
+ 	EFUSE_NUMBER_OF_PARAMETERS_E,
+ 	EFUSE_LAST_PARAMETER_E = (EFUSE_NUMBER_OF_PARAMETERS_E - 1)
+-} EFUSE_PARAMETER_TYPE_ENM;
++};
+ 
+ int get_mac_addr(int ifc_num, unsigned char *mac_addr);
+ 
+-- 
+2.28.0
+
diff --git a/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb b/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
index 8a759ed8..f9a4448f 100644
--- a/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
+++ b/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
@@ -7,7 +7,9 @@ RDEPENDS_${PN} = "wl18xx-fw"
 
 #Tag: R8.7_SP3 (8.7.3)
 SRCREV = "5048b59a444ac59ba7171d6e122d5a84581aebf2"
-SRC_URI = "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git"
+SRC_URI = "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git \
+           file://0001-plt.h-Do-not-define-EFUSE_PARAMETER_TYPE_ENMT-type-e.patch \  
+          "
 
 S = "${WORKDIR}/git"
 
-- 
2.28.0

