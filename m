Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28ED5C6379F
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 19:41:12 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.23440.1676922066528085843
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Feb 2023 11:41:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MyOj27Nz;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id bg25-20020a05600c3c9900b003e21af96703so1125090wmb.2
        for <meta-ti@lists.yoctoproject.org>; Mon, 20 Feb 2023 11:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bk2P20WzdXURuNzguqD/3kew2+UV1NDsYWsr4kcS0Rc=;
        b=MyOj27NzNGguFsrJqkgxFhT4p+X+54VAyStSBgqSuT900/RIJJTGseqXNXZOWg+V94
         szhyU3jeCNITFjeIU+OIJ+Arby/p1SfRvey5JMeYuyftgLjWgrYkqcvFBiSYfBNkBW7a
         nJDSVZUi0wbeZS6PpMSx9h3y3vRv3VsH0Y1NTVnF9ViSBDiP4NyvHqCaxYvlYvCaqKqC
         czsxh4Cxt/Zrofzit0OUjjC//drcDpJ+muLaaNMUhJXTG1SslUYrIeN09mLpf/DXxM6L
         E6Fzzhgp6oRwWoI5zClPGELvUSV1Gg3z66nil9Db5u7nirsgiFiHLsQZhH/84oNfbvvf
         YEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bk2P20WzdXURuNzguqD/3kew2+UV1NDsYWsr4kcS0Rc=;
        b=Gt8qGNd1Xxiis4Z452/Fd0kXWy1wWh5sarCKRP8UDp3NHNyf1ZU0Ao53s3PRJJ+BEH
         QzRwogGh8xwMAUa37x2CPAZx4NgSFgmL0EBwCbED4gDFHA4U7UXforurknzZajUuHmsa
         htG0OkYz95ClN/PAf3QHu9wRcCI+aceJ9zCZNJjEklDHyUPJxkTzTMri4grm5EawQZkV
         FvWSi/EHpftpL8OyxPCgmJWsxFVB3ezsQuvU3BApXKNG5E/ueSkEfVc19Gmn0bUh/XZm
         W7sCUe9w1XaN4T72XE75h0VIWWRTjPrwqK+Xsh/ChXrTFMSONoZAkMVyC1o9GuGKm4LI
         dBGw==
X-Gm-Message-State: AO0yUKVvonkuxc3LnfpGX+Wi1BTbb8EvlEBisY2qcjHwwkwYOrdZXvgU
	Gnh9dWgx5HutN/drp9Oq6r91pw2XROss7/qp
X-Google-Smtp-Source: AK7set/f7Bg4iWmjNCXoLc4GNC9UqxGira9RRbGyTSmCipR3IytJmfFJhhupnsh2NTf7oOtfiOzYUw==
X-Received: by 2002:a05:600c:1d15:b0:3df:e21f:d705 with SMTP id l21-20020a05600c1d1500b003dfe21fd705mr2277020wms.28.1676922064630;
        Mon, 20 Feb 2023 11:41:04 -0800 (PST)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id v6-20020adfedc6000000b002c5544b3a69sm13232552wro.89.2023.02.20.11.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 11:41:04 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-ti@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [kirkstone][PATCH] ti-img-rogue-umlibs: drop unused patch
Date: Mon, 20 Feb 2023 19:40:51 +0000
Message-Id: <20230220194051.2732833-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Feb 2023 19:41:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15884

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 ...kefile-handle-firmware-with-usrmerge.patch | 32 -------------------
 1 file changed, 32 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-Makefile-handle-firmware-with-usrmerge.patch

diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-Makefile-handle-firmware-with-usrmerge.patch b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-Makefile-handle-firmware-with-usrmerge.patch
deleted file mode 100644
index 92c1b362..00000000
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-Makefile-handle-firmware-with-usrmerge.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 3a696a3eb2c23da1d4abcda3d3e3b6aca65a9f9b Mon Sep 17 00:00:00 2001
-From: Jose Quaresma <jose.quaresma@foundries.io>
-Date: Tue, 24 Jan 2023 12:39:30 +0000
-Subject: [PATCH] Makefile: handle firmware with usrmerge
-
-Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
----
- Makefile | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 48f9b9c..04b4154 100755
---- a/Makefile
-+++ b/Makefile
-@@ -1,4 +1,5 @@
- DESTDIR ?= ${DISCIMAGE}
-+FWDIR ?= lib
- TARGET_PRODUCT ?= j721e_linux
- BUILD ?= release
- WINDOW_SYSTEM ?= nulldrmws
-@@ -13,7 +14,7 @@ all:
- install:
-	mkdir -p ${DESTDIR}/${etcdir}
-	mkdir -p ${DESTDIR}/${usrdir}
--	mkdir -p ${DESTDIR}/${fwdir}
-+	mkdir -p ${DESTDIR}/${FWDIR}
-	cp -ar ${SRCDIR}/${etcdir}/* ${DESTDIR}/${etcdir}
-	cp -ar ${SRCDIR}/${usrdir}/* ${DESTDIR}/${usrdir}
--	cp -ar ${SRCDIR}/${fwdir}/* ${DESTDIR}/${fwdir}
-+	cp -ar ${SRCDIR}/${fwdir}/* ${DESTDIR}/${FWDIR}
---
-2.34.1
-- 
2.34.1


