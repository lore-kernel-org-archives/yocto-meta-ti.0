Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4611DC369D5
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 09:59:58 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.23937.1745747994065319188
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 27 Apr 2025 02:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cY8YVoHH;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso23963865e9.0
        for <meta-ti@lists.yoctoproject.org>; Sun, 27 Apr 2025 02:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745747992; x=1746352792; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Jbj229llZdG32Sgp+Dx8KzSmc+uNb3BPCvcRYs04IA=;
        b=cY8YVoHHg3CG6f+smjqUlu8Mt4Q/2joiN0YFGkTv8IUdiNye09sdWi5Gq+OdTmmTUt
         npbdaZ5SPS03janRWxUtjx/u/q6xvJynmqV8Ld95yNY9LyKoyW3rHjgO9sRaVNfiYVc6
         GPf+PoBa36Tal4x4i1MwjiocKfCBcuoY99jgDXteMkoZfmdJ5Bex7jCBBg3hxgQbJXnF
         JlQU0hgnACIgOtG2n6qg4Q4iRQFepoGq75e1J2Pk+kDrRY85f+ItXby/XxMxqpVYSMpp
         /05GHBHhaiabt8u+2r5qYr7BtKp32XXQ6SbwgRccQs5j+uacl8w24ACXpWsg0+DiO4/w
         5NJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745747992; x=1746352792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Jbj229llZdG32Sgp+Dx8KzSmc+uNb3BPCvcRYs04IA=;
        b=hHGNFtdFBxfi7ce61ej4NcNkRgfzYdPOVlS36Tzu+S5m1YYmhlFclJhFvH8s0XnaSn
         xzq6RFhqX9e46JVKaRck1TwCIcKIrKfYfYUZtyOCVpHE4gJ7eezRRKJC92XWrY1Oxa2b
         HhnCEwkmiUnRwRnz+INVuywI5Lt3fc+9ulYRgQtbgRfw5/JLq7Ie2Y9MVBkIEhGEK5Dk
         LsTbD8b85bS0cAhe1aukpyk2M/vQ+VBNL4uD2nBjoHShd3/GwnDHxRzNYHQ6Amj9VC+J
         DfjOTCn9/M/kOnT3D+yQ7dcaoCbUMwofGViOWATh26cSFMkw9Q4c1x0FSsy9wZRAFXt9
         NyTQ==
X-Gm-Message-State: AOJu0Yw8/o1qMXfnLUD6K5JIlOzHWK8o27aVnD4jFr4ax1h/vCJ8dciI
	e0eDnj4ZVai0rK2Pg+5P9cTRsI7qUruwnRzSxPgn9b/XxoEoi0kk9ePgXA==
X-Gm-Gg: ASbGncvCzBOoGLiA8DYYOHSLqqJbQssH7fbtKQuPECkAG2b/gB1/EjAbdmu4DCeY21y
	8JFT+1kgIpMpesInQ+7fHZeS+QNTDz8N/z5M7z3kHRfVNxG7uIByuqrK/ejNuCjIZm0vTYXjzcA
	VkHKqIv4Lx07nQ2mjY3ILjwGFXqzDgwYUCgoEjXn91BL3ZDq7dViPJmw3haLIMIov44Vh5ckLMh
	qAIuwTPDwVQTJL8tb6cOYNE6mhnlpYjxNgpuCgheUUPRg++fPkt86/glkfekd+DQKHkjKW8QWS9
	JsbH0H+2W3jgu3RVQklyYWyCDx2YVQqd32SjN/aLCdWKiEVDpJxVajuqTs97Wo3TWBK6QoF7lCF
	zW/MBxYdPGaHzXUKKlfM=
X-Google-Smtp-Source: AGHT+IHc8p7z+O9D9Q79ZqmhuCto78kha4QyI3gvoD5B00r2DzaVlRLeuK9lC3Uj8Z7T0pp+mUr9+Q==
X-Received: by 2002:a05:600c:1d0e:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-440a669b5c6mr58237455e9.21.1745747991574;
        Sun, 27 Apr 2025 02:59:51 -0700 (PDT)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a538f9c6sm88020525e9.39.2025.04.27.02.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 02:59:51 -0700 (PDT)
From: max.oss.09@gmail.com
To: meta-ti@lists.yoctoproject.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-ti][PATCH 1/2] meta-ti-bsp recipes: fix whitespace warnings
Date: Sun, 27 Apr 2025 11:59:17 +0200
Message-ID: <20250427095918.3941375-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 27 Apr 2025 09:59:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18514

From: Max Krummenacher <max.krummenacher@toradex.com>

Since OE bitbake commit 24772dd2ae6c ("parse/ConfHandler: Add warning for
deprecated whitespace usage"), the current build generates the following
warning (as example):

| WARNING: ...meta-ti/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb:
|   meta-ti/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb:2
|   has a lack of whitespace around the assignment:
|   'HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"'

Fix all the warnings.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
 meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc        | 2 +-
 meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 41d4abdd7ef1..86f75e051c16 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -75,7 +75,7 @@ PACKAGECONFIG:append:am62pxx = " dm"
 
 COMPATIBLE_MACHINE = "(ti-soc)"
 
-BINMAN_INDIRS="${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware"
+BINMAN_INDIRS = "${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware"
 
 EXTRA_OEMAKE += "${PACKAGECONFIG_CONFARGS} BINMAN_INDIRS=${BINMAN_INDIRS}"
 
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc b/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
index 44be246610a7..14c323deddb5 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
@@ -1,5 +1,5 @@
 DESCRIPTION = "TI Inter Process Communication (IPC) Mechanisms (for Uni- and Multi- Processor Configurations)"
-HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
+HOMEPAGE = "http://processors.wiki.ti.com/index.php/Category:IPC"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb b/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
index 431f245faa99..3d53c548c120 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "TI Inter Process Communication (IPC) Mechanisms (for Uni- and Multi- Processor Configurations)"
-HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
+HOMEPAGE = "http://processors.wiki.ti.com/index.php/Category:IPC"
 
 require ti-ipc.inc
 require ti-ipc-common.inc
-- 
2.42.0


