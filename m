Return-Path: <jpanis@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D18EE4996
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 12:36:24 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.9895.1692621375078701524
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Aug 2023 05:36:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=z0g3kat9;
 spf=pass (domain: baylibre.com, ip: 209.85.208.182, mailfrom: jpanis@baylibre.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2bcc187e0b5so11451041fa.1
        for <meta-ti@lists.yoctoproject.org>; Mon, 21 Aug 2023 05:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692621373; x=1693226173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uXpaJHJLkstFPAHRzCzGjH5HCvg0lPeFUpmGZLHUEhs=;
        b=z0g3kat9fL7ZczJzVaQKMPlQi2aYSDBcEph9cG8NgFaHfO+aee5TSEtzolRiSH2Qdp
         vJtCuLZc3ykMsVJUtXZwDAA7sAriXGaGI4pKJeNxKGLPsfU2Tnht7hIPOg+X9HuGAlWy
         dHbuxyuiywrn+R3ekM0zX8oLeNBtirTjRBZ2oi8k9vMEFLZ3kZpOLw0WJjoz6yEB6zu7
         LN/+9eEkBSQZci/geliFSYOxK5Avyq+azGQa3vsWNsv3+ztksNvPJ99jr5+CbfvuwMZs
         3ebN26y8vo6bNG2RlB79lE/Kub9nV05l6J7iu/Og8HfuVcuZj5VLBxumfIR74OXJsrZp
         fykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692621373; x=1693226173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uXpaJHJLkstFPAHRzCzGjH5HCvg0lPeFUpmGZLHUEhs=;
        b=USHynjJI21VFZ/SdAGYAFLcIgqZUbdhV5eiaQhooih2K6oEKUoernTcy6vhR7zii1f
         aYSxe0Ly1lSVlNx0/4j4ft7a2y5ai5WEEH6LBfBIY/3MhfmLV3rle0XfdaCdHqHADnPE
         jW8gzfNv4o5Bhc+00dlys/7WpclanDjoygMJcQlV5r5C/INusbXxFUa5zHRyI//OxIwK
         3S2wq/W0dmYXzLoJduTBRnSklBsrE4Wg04j3uGA05lWcacPQIog++m4vlG4HJ9n0ElVn
         AgOOvqZrpWDXLCkjjFo/PFMYo0LymyGQOC0hu++RBg4o2Xo6akIV+uGKj1rN6NU2aio+
         ozfA==
X-Gm-Message-State: AOJu0YyywxXM8Nbzo/5vyxt7XZJ/B7BqsnW1fk/hOLOdt96sufjxghhL
	7YBzPI11JEBSXjisEvlS/GmBvlJyuA0TyyQlkBk=
X-Google-Smtp-Source: AGHT+IEk6KdoUK1cChK3frF3zynYGPAuB6duLXpJw96Kh/mwal/EVL6AS8D+LTRcr/3OXDNc5F7s5g==
X-Received: by 2002:a2e:8246:0:b0:2b9:3523:6f20 with SMTP id j6-20020a2e8246000000b002b935236f20mr4515465ljh.51.1692621372310;
        Mon, 21 Aug 2023 05:36:12 -0700 (PDT)
Received: from baylibre-ThinkPad-T14s-Gen-2i.. ([86.71.62.228])
        by smtp.gmail.com with ESMTPSA id jw11-20020a17090776ab00b0099d0a8ccb5fsm6492695ejc.152.2023.08.21.05.36.11
        for <meta-ti@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 05:36:12 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone] conf: ti33x: Add earlycon parameter to kernel command line
Date: Mon, 21 Aug 2023 14:36:10 +0200
Message-Id: <20230821123610.16394-1-jpanis@baylibre.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 21 Aug 2023 12:36:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16883

Sometimes on am335x devices, no more output is printed after
"Starting kernel..." message. Modify UBOOT_EXTLINUX_KERNEL_ARGS
to enable the console before standard serial driver is probed.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 meta-ti-bsp/conf/machine/include/ti33x.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
index bc61a77389ef..ad19798dac10 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -47,6 +47,7 @@ UBOOT_LOADADDRESS = "0x80008000"
 # Generate an extlinux.conf file
 UBOOT_EXTLINUX = "1"
 UBOOT_EXTLINUX_ROOT = "root=PARTUUID=${uuid}"
+UBOOT_EXTLINUX_KERNEL_ARGS = "rootwait rw earlycon"
 UBOOT_EXTLINUX_BOOT_FILES = " \
     extlinux.conf;extlinux/extlinux.conf \
     ${KERNEL_IMAGETYPE} \
-- 
2.37.3


