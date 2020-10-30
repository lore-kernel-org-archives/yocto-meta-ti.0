Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.7328.1604022365502380305
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 Oct 2020 18:46:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MaBrlrOk;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id r10so3840946pgb.10
        for <meta-ti@lists.yoctoproject.org>; Thu, 29 Oct 2020 18:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hpBhOIlipyUjaPWFFAK2Sy7XCJW7vUCmUfAmy82ze/M=;
        b=MaBrlrOkIyDVk3uS9KmqB+ArXeeELD/GOC0TuOFFYBIH3VcvVvh1lsVgQ0YCq+xyof
         G/MPEaC9hwQmthjVZCdl1vhFlrtDqdMUTxl49J0NjXmDn0pAFVttEY1iSrngsWQC3GZz
         obHwXAIZJI2JoppgJ6pV09sDL5pc9MwzUIXMHwmrheg0s1AS6MZmlUKvjg4xvMwE1j/8
         OtV/IvugPjWe2IITYFOtdakvCDec/IubSS+X8rjZOuK4fXBg/tViuN2QT5cXTgImhHu9
         BsyKJ+phmeGurDnLSQzZ2DlIHvuijRQ6z7DrWTvBtcoT3Yk/285zjzY6lL9y5xHiYRFo
         ktjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hpBhOIlipyUjaPWFFAK2Sy7XCJW7vUCmUfAmy82ze/M=;
        b=FS304xhTgcQBXAff7ilsz5tdoXyvnaUtJlmkGH1Qp2ug1LMg5NrY7h2Wv3C6bofQFy
         x+9MGX1KVmhv2x40zcoJ7N9XiIfcs1ObgjBrum0dVDiiP1Boj7EljAGud4zvoSxLK8Kt
         CBWaMPds6qv8rw+eH39avjPNJqg11uRC6AR2pbx9Q+IxISgVHKecnUhycIsIl3KHC0Wx
         VOe3WoL+j2FOa7UbogL0PetAbkeOn4BycR4Ek3miic898Wz/NHxahlqm4zd0oj5VyTsq
         IE9g1ohsyikcZareMbAJOYYWn30YaqSYQ4CXnxKhOKsghUxaeAwlhrs0odxtHRuAk2gl
         L68Q==
X-Gm-Message-State: AOAM532xu3t4m8FaTxYKHrwnq7I3huXzIm2Rx5ou1CHLRi9vGqL5Ue/P
	ANBdwZ1Bycm1E+d7JoS/UogOtCMnUo4eJQ==
X-Google-Smtp-Source: ABdhPJy3Zqxjo1PMoDCVFr5Z4MVgxwDfPvPnRohUUAzCdca8SNt3IpB0SNgFg887U000GjBozefcNg==
X-Received: by 2002:a17:90a:d341:: with SMTP id i1mr2207530pjx.18.1604022364576;
        Thu, 29 Oct 2020 18:46:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4874])
        by smtp.gmail.com with ESMTPSA id m11sm4196993pfa.69.2020.10.29.18.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 18:46:03 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/2] ti-rpmsg-char-examples: Fix cross compile
Date: Thu, 29 Oct 2020 18:46:00 -0700
Message-Id: <20201030014601.395106-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes problems during cross compile where it starts to peek into
build host's include and library paths and causes errors with clang and
QA warnings with gcc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add upstream status

 ...-Remove-use-of-includedir-and-libdir.patch | 38 +++++++++++++++++++
 recipes-ti/ipc/ti-rpmsg-char-examples_git.bb  |  2 +
 2 files changed, 40 insertions(+)
 create mode 100644 recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch

diff --git a/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch b/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
new file mode 100644
index 00000000..71fca1b0
--- /dev/null
+++ b/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
@@ -0,0 +1,38 @@
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
+Upstream-Status: Pending
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

