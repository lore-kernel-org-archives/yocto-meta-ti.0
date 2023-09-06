Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C429AEE14A5
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 15:06:00 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.703.1694012757836708602
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 Sep 2023 08:05:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lTUwDqFW;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9a21b6d105cso559256466b.3
        for <meta-ti@lists.yoctoproject.org>; Wed, 06 Sep 2023 08:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694012756; x=1694617556; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rAkC2sxGK3Dh8yLb0h3egX99b8s+DI4mq7rbfBbAi2Q=;
        b=lTUwDqFWFwvdRk1pbCfm1cLKxOY+XgGgRIOpiZNkeT9XXRf2Ctj4VD5huHdr0Yh/rz
         SWbTpGsQWoYG0I6PrzSjwqgNdbB0oQGHyoXbt3E7gd3dDdM4PpvxHJdaN+FL1ieCQ2yF
         x7YjNiMbzK/5YK0cNl8tcwi9N7IHPJhSyoqqOGuQFyuyHdm9zW07HBlWP/CFUbM5Vkw/
         VsWs2fqbOdlhh3gGrbbVMrnlzqneCU20rUkALw+8l+AbeudxKASKrDSkJBOwigZFm1Rl
         6ppWc6u8XgM41gkyj9rXy1S7LW52Z581KTBz89s+MRnl3kVLbF9x1rkCzebnCkhnusnB
         8GVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694012756; x=1694617556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAkC2sxGK3Dh8yLb0h3egX99b8s+DI4mq7rbfBbAi2Q=;
        b=Rp9N6ObmTyPdsEZV/H+/qP2qolJ3HDUk66MLa957N9OF7pSmjVUiFQ6S/e6b9aGnuH
         nznxTqicUD0ch6wii29yRxlQObppXj3AnzyIU0+TrQMbA71GbuOQP5bcaeLF5CTWJ87B
         t1aCRDcafO1I5WHo8QN+ld04epZBW5k4ULg/45AkcxftEfokehwA6l91dKAGB+lvFED6
         VZE/N1u37VaTGHUk283d/AwsvRdA1UmvmPKSpbHz5eTnu//DyXiRn9KjWsOZmyeeFCZ2
         X8nLRn7ywrwI8GchRej+i45o0KC+vOfb3D6gqUTWDKP49+ZZk2bKv8QvEYCWSbucUAXw
         /4Zg==
X-Gm-Message-State: AOJu0YwsUJainz6LmywT9uXJpH2tXQw4gHcxUa8n7daZre/o7uu4DWRO
	AcUl1VlkwHlrDX/Sy0xTCCMqAt1XM3s=
X-Google-Smtp-Source: AGHT+IGedsiNZjNN/9uG/6kqkWn98x4xChZujnfP7f2I4OSMC/eadOhbo8shT2+J0a8d0eE95vbeWA==
X-Received: by 2002:a17:907:272a:b0:99d:f2dc:97e3 with SMTP id d10-20020a170907272a00b0099df2dc97e3mr2451742ejl.20.1694012755902;
        Wed, 06 Sep 2023 08:05:55 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id fx4-20020a170906b74400b009887f4e0291sm9077690ejb.27.2023.09.06.08.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 08:05:55 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-ti][PATCH v2] ti-img-rogue-umlibs: harden handling of usrmerge
Date: Wed,  6 Sep 2023 12:05:51 -0300
Message-Id: <20230906150551.2362062-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 06 Sep 2023 15:06:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16922

From: Max Krummenacher <max.krummenacher@toradex.com>

Only move directories which haven't already been moved.
This prevents a build error should a subsequent bitbake execution
rerun do_install where the sources to 'mv' no longer exist.
| mv: cannot stat 'ti-img-rogue-umlibs/23.1.6404501/git/targetfs/am62_linux/lws-generic/release/lib/firmware': No such file or directory

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 .../powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
index 9b45a91f..2cf13c60 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
@@ -68,7 +68,9 @@ do_install:prepend() {
         done
     fi
     if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
-        mv ${S}/lib/firmware ${S}${nonarch_base_libdir}
+        if [ -e ${S}/lib/firmware ]; then
+            mv ${S}/lib/firmware ${S}${nonarch_base_libdir}
+        fi
     fi
 
     # clean up any empty directories
-- 
2.35.3


