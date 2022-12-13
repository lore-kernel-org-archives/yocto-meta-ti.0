Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB61C10F1B
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 18:38:49 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.81871.1670956719255042198
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Dec 2022 10:38:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qe9bjOjo;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id m19so9171890wms.5
        for <meta-ti@lists.yoctoproject.org>; Tue, 13 Dec 2022 10:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bfTd4cHiX6aI5I+aGnO6RnQXYZwHwlY1yUA31p4vifk=;
        b=qe9bjOjo+fbeD0GwTlT3fTAEOSXxXtYnW8QSBsvq/sCd7AvYByP9QDuPfMxSyvv/vq
         wnKAR+QCq/K8xZiWsYwESQTPy8higm/K1i5Zng2Ta3dYaQtFfKLxF6aDetq3OkUCQBca
         G6IpOJGjVaNrDsJ75yFvIfvHKYb/Ai+haAMKTBbLrwB2nc5SQuC5i+hYrzsVknt7m+Wc
         5atalxvngI8kg6TlRDlWjqWhHnL3j0wPLa9vQeUvM7CKvoZ6z4FdmNEhwprUMFpgjH3Q
         U1kpEqTa183OQjmtA/VDuWSsQuIHNqZszXoC9DVS6rjtt9PgVREPN1K58i16D5w9xu4e
         Q+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bfTd4cHiX6aI5I+aGnO6RnQXYZwHwlY1yUA31p4vifk=;
        b=UDO5bvU9pHEJQiUrwkOzcAXBHJ/qkeB2BjIBi1NZBv9yzyNb5ACnA7V9nsSHIKmfWJ
         Ik9A2ZCkXWSU7gKv7WW3BHmx3MWNtrPste+SW02joz8JMm0XQIoHM6u09ZAD1/0NCnr2
         ym2s2RZs5pFLPCGzbage1jtNVtabiDG3Wf5AxKXOyYEr0zA8DuxaQORvNXf78HsBeSJK
         mOG9TfoEG5KcesWroH04huV7ghPpipvA879rXo/Waq3fOOnc6+xeT6CKPaE/thJnZBrQ
         xIBs7MHu1b3TYfhvdGb23LA3hhUv/STJZnwRMEmOlND231mht0URvvPC9qWXqJgi2yzd
         Pj/g==
X-Gm-Message-State: ANoB5pmKA38dq+7ddy82bMAjEsvZOldYd2i20QzGh6dSj3hTNqnvrwNy
	sWIsP/NFnWxv1dyof3devyAPgmFnPw4=
X-Google-Smtp-Source: AA0mqf5xghKDJ60Z4UKlgivmkjFkvO5HXc7Zu3PNn2/RKjZQ86wSQaGE2SoF5BCqKiHfN2v11HlsBA==
X-Received: by 2002:a05:600c:4fd4:b0:3cf:75dc:12d3 with SMTP id o20-20020a05600c4fd400b003cf75dc12d3mr16798514wmq.23.1670956717383;
        Tue, 13 Dec 2022 10:38:37 -0800 (PST)
Received: from fio.lan (11.77.115.89.rev.vodafone.pt. [89.115.77.11])
        by smtp.gmail.com with ESMTPSA id p25-20020a05600c1d9900b003d237d60318sm1291233wms.2.2022.12.13.10.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 10:38:36 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-ti@lists.yoctoproject.org
Cc: ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-ti][dunfell][PATCH 1/2] Revert "conf: machine: k3: Add fitImage to the default kernel image types"
Date: Tue, 13 Dec 2022 18:38:17 +0000
Message-Id: <20221213183818.206660-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.38.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Dec 2022 18:38:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15465

This reverts commit e6deeba806d2145fa16b0b5f444f2985e63e6366.

Currently building with am62xx-evm/am64xx-evm machine fails with:

| make[1]: *** No rule to make target 'fitImage'.  Stop.
| make: *** [/build/tmp/work-shared/am62xx-evm/kernel-source/Makefile:185: __sub-make] Error 2
| ERROR: oe_runmake failed

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 conf/machine/include/k3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
index 349f4fda..ef4f107f 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -15,7 +15,7 @@ PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
 KERNEL_IMAGETYPE = "Image"
-KERNEL_IMAGETYPES = "Image fitImage"
+KERNEL_IMAGETYPES = "Image"
 
 UBOOT_ARCH = "arm"
 UBOOT_ENTRYPOINT = "0x80008000"
-- 
2.38.2


