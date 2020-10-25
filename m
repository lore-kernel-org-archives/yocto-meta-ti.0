Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web09.23659.1603609178901134865
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 24 Oct 2020 23:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YXVb8EV2;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id g12so3400009pgm.8
        for <meta-ti@lists.yoctoproject.org>; Sat, 24 Oct 2020 23:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JV/gpuBol8Q6dM/pvmt+sXHpfPhkSoGnn9Y6THpH1Xk=;
        b=YXVb8EV2ZAM/0kY9YPC92JwGYM/TD90r8r94jhYKLc/7JJUYremgV27Ei8e0rorvgP
         3d2Y69Sm7ZPVRM8wOyyiePsiw/ovUX99j8Gqw4cCyTSgK1WHM6zX6yXdSvqsZMlqIhOm
         Epx3KS25ERKcv3oHDgSk+lujHaG4PBzcUTxglLlsQyoiTT7vcq83L/4HA95p6+jv4DMk
         9KW+eVqYDx5bl6Wzphm4GGTRhdGz0w0FxieH8ykIiztHJoGm9lTCBazenwrQZhyr7m8D
         Ev8YS/kSksa42ZB+lR2d0gzYbmoJSlcEvLBnfqiiS0FTUNSUFnSTXr8yUDik9TydKMgA
         WGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JV/gpuBol8Q6dM/pvmt+sXHpfPhkSoGnn9Y6THpH1Xk=;
        b=kV6UGlJLLUG1qOg1wLY0vyVUiCtGAb5i99jBg11sk4hrNp7cTump5g9BE716FzOs8S
         jLpJGAV/c+e6EcQYLaVNjthf9qgsUOcIyRCn9kxwTX52jphrALyh1tPfhF1xI/JlitIh
         Z8keMrXQ2YV2HeVqSo2+ZFC/HfaFEyeQVw5fBpfUL2ACEbG+YwdKHsbs3Q79+hrs2El2
         ACJoInSZh0sexAsBkeO3B4EgwmZsjfE6VBSDOQQuioRgMf7VuWIlMZ7rL3zizlj2M/Lj
         H/lcoZsb7ghiHSUZrwvIx1rCrdtl6K0RZ+f6atjHhFeRrNUeF0Xgj9NekDwsCbPXCAZn
         S08Q==
X-Gm-Message-State: AOAM533qLfvfjXh1VT/FlUSFdnazYNOy5QMUH/1ompyhNLzw30ulY94x
	5Pa99HspxCnvcb9MnvVYMZlDnWth7bQzjA==
X-Google-Smtp-Source: ABdhPJy3Ln+VItm4Llf+EUQjRwnX6nE3Pia1Ihtv1h3t+iuz0xwtocoZUkdGstE5rCk3aGmifpVBEQ==
X-Received: by 2002:a63:1c14:: with SMTP id c20mr233698pgc.82.1603609178030;
        Sat, 24 Oct 2020 23:59:38 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3958])
        by smtp.gmail.com with ESMTPSA id x1sm8916837pjj.25.2020.10.24.23.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2020 23:59:37 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] ti-rpmsg-char-examples: Fix cross compile
Date: Sat, 24 Oct 2020 23:59:33 -0700
Message-Id: <20201025065934.3308920-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes problems during cross compile where it starts to peek into
build host's include and library paths and causes errors with clang and
QA warnings with gcc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Remove-use-of-includedir-and-libdir.patch | 37 +++++++++++++++++++
 recipes-ti/ipc/ti-rpmsg-char-examples_git.bb  |  2 +
 2 files changed, 39 insertions(+)
 create mode 100644 recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch

diff --git a/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch b/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
new file mode 100644
index 00000000..34807152
--- /dev/null
+++ b/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
@@ -0,0 +1,37 @@
+From 1a26cb577ba54dd9214eeb94fed0ce3a0f4603b6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 24 Oct 2020 23:46:39 -0700
+Subject: [PATCH] examples: Remove use of includedir and libdir
+
+These point to standard include and library paths which already are used
+from sysroot relative paths secondly, they use absolute paths which
+means we are asking to add -I/usr/include which might be ok in a native
+build but not in cross build. This helps mitigate QA errors found with
+OE build system since it finds it adding host include and library search
+paths to linker/compiler commandline
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ examples/Makefile.am | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/examples/Makefile.am b/examples/Makefile.am
+index 5a9bedb..d547e41 100644
+--- a/examples/Makefile.am
++++ b/examples/Makefile.am
+@@ -1,6 +1,4 @@
+-INCLUDE = -I${includedir}
+-
+-AM_CFLAGS = -Wall -g -O2 $(INCLUDE)
++AM_CFLAGS = -Wall -g -O2
+ 
+ bin_PROGRAMS = rpmsg_char_simple
+ 
+@@ -8,4 +6,3 @@ bin_PROGRAMS = rpmsg_char_simple
+ rpmsg_char_simple_SOURCES = rpmsg_char_simple.c
+ rpmsg_char_simple_CPPFLAGS = $(AM_CFLAGS)
+ rpmsg_char_simple_LDADD = -lpthread -lti_rpmsg_char
+-rpmsg_char_simple_LDFLAGS = -L${libdir}
+-- 
+2.29.1
+
diff --git a/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb b/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
index 142e5bf0..cbe4d7fd 100644
--- a/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
+++ b/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
@@ -2,6 +2,8 @@ SUMMARY = "TI RPMsg Char Sample Applications and Tests"
 
 require ti-rpmsg-char.inc
 
+SRC_URI += "file://0001-examples-Remove-use-of-includedir-and-libdir.patch"
+
 DEPENDS = "ti-rpmsg-char"
 
 inherit autotools pkgconfig
-- 
2.29.1

