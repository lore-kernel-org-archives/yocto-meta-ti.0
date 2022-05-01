Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FCAC433F5
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 16:49:30 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.410.1651423763865418338
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 01 May 2022 09:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TMqyKJZx;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so2428010pjv.4
        for <meta-ti@lists.yoctoproject.org>;
 Sun, 01 May 2022 09:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d9dK5JfqsjCaQMpZfGSGCi2aSXQ3rHJjYFGsMyea010=;
        b=TMqyKJZxQ5VhX8nPcSom2j/Hh6VtaMdLK1m7/IIKtvySOnMHjuK5xiiCy0BpRAtWm/
         GVFAxaiCgjseposPbdHQUo8RMFG322U4Qd/gM3n1BBLiJwnO3IG/BEl3xb/gvl6xUi7B
         bKBgWPdFvapyO+kdQOhWcIXtFSdbLs/rXPxSa3UeOHklQbtVdkR6Af5eNozN7P1x5y7n
         gJbOCDjsDH6P1T2lJiMyVAlceYC3CsbZZnfOn2G3usX7k8qjvsub2WE3R8PnQwqemS4n
         QBwRBa+WER15ggNZ/cfWcHKCLYNv0HI4HskqiAy+4ZRLEi2Pv7enIi8PMgfpIO6Mjwjo
         f7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d9dK5JfqsjCaQMpZfGSGCi2aSXQ3rHJjYFGsMyea010=;
        b=rewsIcJiUt/wto1AXNKBQ7qPUH9a6+bFS5NO44RmP7PljaoF8NP8n4yEVedGSN3Whb
         Zg13waUsN66fcBhQftKTR0LlqW30SpuSPx64ZD6WFtgpDOogebYufe2TAPbIYN9Q3sgz
         oN3mGQT8Buvqk/2/Q7FNCTsMAeHos9HPaSMvTrSNXwqoV1jOjZI02XoAFrpnai47CFbG
         GvzLiVQ9YjF3bthZl3fXJcN1sz2gL5AMtIwm9p0OgM75t7zr+cPB/wZ/y94XI3PzyxSe
         bOVgxTE0DN5ATQ9S/6oNJeqXDBesCBLacRpNT/bq7yEkHs0hcaD/B/GKyHyFP9blROWS
         t8fg==
X-Gm-Message-State: AOAM530r0EMoVsuz4hxHyEiJ+NcP9irw7Mis4XUXwTkHtGOA5Ik47rXp
	XKns/d1g0bbSPck/2jNhjuhHYTlU0uHY6Q==
X-Google-Smtp-Source: 
 ABdhPJz3xIX1fjQNW6mJ4t9m9ARaC9d5b/t/zrRi8G52l2Tc1mIxEAKQF7mj8UORCt9PUkSrRABy2Q==
X-Received: by 2002:a17:903:2d1:b0:156:7ceb:b56f with SMTP id
 s17-20020a17090302d100b001567cebb56fmr8349740plk.11.1651423763047;
        Sun, 01 May 2022 09:49:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 s9-20020aa78d49000000b0050dc76281b9sm3185939pfe.147.2022.05.01.09.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 09:49:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] uio-module-drv-test: Fix build with clang
Date: Sun,  1 May 2022 09:49:19 -0700
Message-Id: <20220501164920.2828087-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 01 May 2022 16:49:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14638

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-instead-of-int8_t-in-main-signature.patch | 89 +++++++++++++++++++
 .../uio-module-drv/uio-module-drv-test_git.bb |  4 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test/0001-tests-Use-char-instead-of-int8_t-in-main-signature.patch

diff --git a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test/0001-tests-Use-char-instead-of-int8_t-in-main-signature.patch b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test/0001-tests-Use-char-instead-of-int8_t-in-main-signature.patch
new file mode 100644
index 00000000..172ed7cb
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test/0001-tests-Use-char-instead-of-int8_t-in-main-signature.patch
@@ -0,0 +1,89 @@
+From 972b8514cc99e76508363d2304bb13c27df99cd6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 1 May 2022 09:39:42 -0700
+Subject: [PATCH] tests: Use char instead of int8_t in main signature
+
+int8_t is a define in C99 which is flagged by C compiler ( clang )
+
+Fixes errors like below
+
+pruss_uio_test.c:264:6: error: second parameter of 'main' (argument array) must be of type 'char **'
+void main (int32_t argc, int8_t **argv)
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/gen_ipc_int.c                       | 2 +-
+ test/prussdrv_test/test/pruss_uio_test.c | 2 +-
+ test/uio_cic2_int_multithread_test.c     | 2 +-
+ test/uio_int_test.c                      | 2 +-
+ test/uio_mem_test.c                      | 2 +-
+ 5 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/test/gen_ipc_int.c b/test/gen_ipc_int.c
+index 2be3a9d..313c76a 100644
+--- a/test/gen_ipc_int.c
++++ b/test/gen_ipc_int.c
+@@ -26,7 +26,7 @@ static int64_t clock_diff (struct timespec *start, struct timespec *end)
+              + end->tv_nsec - start->tv_nsec;
+ }
+ 
+-void main(int32_t argc, int8_t **argv)
++void main(int32_t argc, char **argv)
+ {
+ 	int size; 
+ 	char *map ;
+diff --git a/test/prussdrv_test/test/pruss_uio_test.c b/test/prussdrv_test/test/pruss_uio_test.c
+index 5af4a2c..7391fbd 100644
+--- a/test/prussdrv_test/test/pruss_uio_test.c
++++ b/test/prussdrv_test/test/pruss_uio_test.c
+@@ -261,7 +261,7 @@ int bsp_init()
+ 
+ }
+ 
+-void main (int32_t argc, int8_t **argv)
++void main (int32_t argc, char **argv)
+ {
+     int ret_val;
+     
+diff --git a/test/uio_cic2_int_multithread_test.c b/test/uio_cic2_int_multithread_test.c
+index 0d9f126..15db958 100755
+--- a/test/uio_cic2_int_multithread_test.c
++++ b/test/uio_cic2_int_multithread_test.c
+@@ -287,7 +287,7 @@ void *wait_inthread_for_interrupt(void *arg)
+ 	}
+ }
+ 
+-void main(int32_t argc, int8_t **argv)
++void main(int32_t argc, char **argv)
+ {
+ 	thread_arg_t thread_arg[MAX_NUM_THREADS];
+ 	int ret, err;
+diff --git a/test/uio_int_test.c b/test/uio_int_test.c
+index 7095a0a..e0ba5a9 100644
+--- a/test/uio_int_test.c
++++ b/test/uio_int_test.c
+@@ -161,7 +161,7 @@ static int64_t clock_diff (struct timespec *start, struct timespec *end)
+              + end->tv_nsec - start->tv_nsec;
+ }
+ 
+-void main(int32_t argc, int8_t **argv)
++void main(int32_t argc, char **argv)
+ {
+ 	int  fd_uio;
+ 	int ret;
+diff --git a/test/uio_mem_test.c b/test/uio_mem_test.c
+index aad13ac..3cdba37 100644
+--- a/test/uio_mem_test.c
++++ b/test/uio_mem_test.c
+@@ -121,7 +121,7 @@ err_exit1:
+ 	return ret;
+ }
+ 
+-void main(int32_t argc, int8_t **argv)
++void main(int32_t argc, char **argv)
+ {
+ 	int  fd_map;
+ 	int ret;
+-- 
+2.36.0
+
diff --git a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
index dc17a1e9..41270042 100644
--- a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
+++ b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
@@ -2,6 +2,8 @@ DESCRIPTION = "Test code for user space IO (UIO) driver"
 
 include uio-module-drv.inc
 
+SRC_URI += "file://0001-tests-Use-char-instead-of-int8_t-in-main-signature.patch"
+
 PR = "r1"
 
 COMPATIBLE_MACHINE = "omap-a15|ti33x|ti43x"
@@ -33,3 +35,5 @@ do_install:append:ti33x () {
 do_install:append:ti43x () {
         install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}${bindir}/.
 }
+
+CLEANBROKEN = "1"
-- 
2.36.0


