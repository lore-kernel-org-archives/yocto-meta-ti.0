Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91828C63797
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 12:16:47 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.164908.1673871398239439775
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Jan 2023 04:16:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JAlFMSeI;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id e3so18070703wru.13
        for <meta-ti@lists.yoctoproject.org>; Mon, 16 Jan 2023 04:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYws6/yoGvyVyDmtb5rmtUncBICjV6Hzx60f78BaasM=;
        b=JAlFMSeIJJQw60q2jG2Vof34e65F9713gL27jXec8jfzKK8zGmdIx8FYuLXoK+NCyb
         s+UqlCb62//KE3Ksb1LpE8zvBkGo3H8yoQew1OIpQ+w1+FlN5IdPtUa+LKLn7hgzWfWH
         IRDAQCnm40BfqwSS7P1rQBx+DKMH0kLV9Qs30ZXbcgs8yKxwkTuh4+gqE83VfCDJWuaW
         xSUQB+Gn66CoiqnYUfk/4xIbCdWUiA3ZaxBm8YiMWqm4oAJtUc1jS4ZTvO1g0bjfxghB
         v5aHZ0TvYkKHKpwPSXNIrDJcVTH52Z6W7FwE0oK3lLWxeqMdRDQ8u2bsZk52xRH1mCRM
         XJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYws6/yoGvyVyDmtb5rmtUncBICjV6Hzx60f78BaasM=;
        b=i/KGbnC45RldXxYQ5iud4tP/ebUTaoIRHlQEnp4yo2SCN9t6lf2ZSm3L1NvI0lUIzP
         KdbOHv5SNB5VRasRJ0+fdZlU1WIBCQbtdQ4FTYPcY0aT/LHM3XDm4IjAi1mudTiVvq+H
         1FDMdvb2F+P2okLd5McwDrmstO+I/RlCqBa0FuXWO/ApXt5GYcDrDikQpRgIF5kaYDlL
         jq5L1peE2h0S3DAPTuLiE9+X5Hcq7kJJk8Q8AwVINu6dHHdjUh9ogfLvup9fX1u7FKEd
         fdmPDNYyM2bYmXDNGAr8IALZNqXJipPPevYI0a82lD+Z4zjlhhUoXIDngwd2VhcbKw8G
         q0KQ==
X-Gm-Message-State: AFqh2kpaxJ0MUy4fymcQxOxrUHWh3yHs3xkFN7OJZWBA68XBldTG8RRO
	h5J18AQDTFiAbdGj+xzAKWQj1JBLOgY6xA==
X-Google-Smtp-Source: AMrXdXt6WGZNWndYe8oGJiG35QSz20h/BRzBQkUtDpSOdensO+xxdfQLR1nNk1icuQcQ0X7izEg6tg==
X-Received: by 2002:adf:de90:0:b0:2bb:ebc4:2f62 with SMTP id w16-20020adfde90000000b002bbebc42f62mr20367722wrl.52.1673871396570;
        Mon, 16 Jan 2023 04:16:36 -0800 (PST)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id f16-20020a5d50d0000000b002755e301eeasm8382966wrt.100.2023.01.16.04.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 04:16:36 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-ti@lists.yoctoproject.org
Cc: ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-ti][PATCH 3/3] ti-sci-fw: sets TI_K3_SECDEV_INSTALL_DIR default value
Date: Mon, 16 Jan 2023 12:16:26 +0000
Message-Id: <20230116121626.885219-3-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230116121626.885219-1-jose.quaresma@foundries.io>
References: <20230116121626.885219-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Jan 2023 12:16:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15569

The TI_K3_SECDEV_INSTALL_DIR is defined on the meta-ti-extras layer
so when the layer is not used the variable is undefined.
For such cases we can use default value that is the same defined
on the recipes-ti/includes/ti-paths.inc

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index c99cd660..8e88b58b 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -1,4 +1,6 @@
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+# set a default value for TI_K3_SECDEV_INSTALL_DIR
+export TI_K3_SECDEV_INSTALL_DIR = "${STAGING_DIR_NATIVE}${datadir}/ti/ti-k3-secdev"
 include recipes-ti/includes/ti-paths.inc
 
 DEPENDS = "openssl-native u-boot-mkimage-native dtc-native virtual/bootloader"
-- 
2.34.1


