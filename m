Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF3C3CCF9E9
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 10:50:55 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.39877.1727347846972065728
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Sep 2024 03:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RSpzmvu/;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cc43454d5so6622695e9.3
        for <meta-ti@lists.yoctoproject.org>; Thu, 26 Sep 2024 03:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727347845; x=1727952645; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uKT2JzxSUPq3uQ2tEaDSoIoH2dMzP8x226xpCm/F/CE=;
        b=RSpzmvu/1LaIEBs8EjmkHhVdqnspB1HdB4YxrRabxJF/Lot0gCt5afg2yAb8H2VNhv
         a1w04WyGRKWUshm8O1xSqeLZ2ZwAcj8dx7DB2gPu668E6Tt9Rf2bJ/kxXqG8vs5wNS98
         EmkBsolZhjXWYtsK3CIzFKbq5NKpGu7cz8+YIesUkUYIhz5H0aNW8jYR2RWxYPfo+Imm
         dQnkTtbJfJAroqb1/dqR7n5+uXG37qiJ1zggjqk5m7ixlpYi4vvY2jhIKxC5Ck4DDUNe
         gBXdm6mJgkn8pNNtbmdwMh9FXOsY4MpQkPEfNr4Y9LxGOH2lgDAyWoPWObBBasMfDeCM
         QWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727347845; x=1727952645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKT2JzxSUPq3uQ2tEaDSoIoH2dMzP8x226xpCm/F/CE=;
        b=fgY9aEANLveEcaWWbAlQdtFYYfwL1gVQ5MDzNZ585tqkLv9nqlqNeBRzYbQ+0mF/vI
         UeAKFybhPrByZ4JOWJlsqLxer5b3qIA14XFb0fQbY8x3118sApZjsy3+dXjR9+JUK2Ai
         MYoLczu/wzkFZddRy+b3wp4twdPciyq0uMy4/cd1nQC8BS3blYZ9wl3ZfTMJ/T4xoeK+
         x8hrPbo8HfetJPjLmZWUJa88yX/MrXLBY/+B+i0ThP6xiS3MgIcwZkgkezhsLs47Wk0q
         jcNGbp9g4csAxzsHnLdbNwCx4G7YRVfPYBr2BYrd6XJqroflSLYiVwyURAw5LAEWWF6d
         D1nA==
X-Gm-Message-State: AOJu0Yyf8oNI7WEt0YrnysR5EhV6aQ5dEZx6CB6ekgA0hfiFMKBBs514
	LvzM9rF0f4IUyNQxJjUSOrfsflfHV+2usEyf4ocwzjhetFa/RpMePmVQtg==
X-Google-Smtp-Source: AGHT+IGaWWnDpLmvLkyKmVxffdqd98rarBdHxlObJsv6NZbtBWNoSh0AFHRyFXmufTI8cZdDDk953w==
X-Received: by 2002:a05:600c:4755:b0:428:10ec:e5ca with SMTP id 5b1f17b1804b1-42e9610ac97mr41718965e9.14.1727347844606;
        Thu, 26 Sep 2024 03:50:44 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969f244asm43372595e9.17.2024.09.26.03.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 03:50:43 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-ti@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-ti][master][scarthgap][PATCH] u-boot-ti: avoid write erros on the logs when removing deployed files
Date: Thu, 26 Sep 2024 11:50:26 +0100
Message-ID: <20240926105026.1867759-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Sep 2024 10:50:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17973

This will prevent a lot of noise on the build logs.
Currently we have some erros:
 rm: cannot remove 'file'
 No such file or directory

Like the following:
| rm: cannot remove '/lmp/build/tmp-lmp-k3r5/work/am64xx_evm_k3r5-lmp-eabi/u-boot-ti-staging/2024.04+git/deploy-u-boot-ti-staging/u-boot-initial-env*'
| : No such file or directory
| + true
| + rm /lmp/build/tmp-lmp-k3r5/work/am64xx_evm_k3r5-lmp-eabi/u-boot-ti-staging/2024.04+git/deploy-u-boot-ti-staging/u-boot-ti-staging-initial-env /lmp/build/tmp-lmp-k3r5/work/am64xx_evm_k3r5-lmp-eabi/u-boot-ti-staging/2024.04+git/deploy-u-boot-ti-staging/u-boot-ti-staging-initial-env-am64xx-evm-k3r5 /lmp/build/tmp-lmp-k3r5/work/am64xx_evm_k3r5-lmp-eabi/u-boot-ti-staging/2024.04+git/deploy-u-boot-ti-staging/u-boot-ti-staging-initial-env-am64xx-evm-k3r5-2024.04+git-r0
| + rm /lmp/build/tmp-lmp-k3r5/work/am64xx_evm_k3r5-lmp-eabi/u-boot-ti-staging/2024.04+git/deploy-u-boot-ti-staging/u-boot-initial-env-am64xx-evm-k3r5*
| rm: cannot remove '/lmp/build/tmp-lmp-k3r5/work/am64xx_evm_k3r5-lmp-eabi/u-boot-ti-staging/2024.04+git/deploy-u-boot-ti-staging/u-boot-initial-env-am64xx-evm-k3r5*'
| : No such file or directory
| + true
| + rm /lmp/build/tmp-lmp-k3r5/work/am64xx_evm_k3r5-lmp-eabi/u-boot-ti-staging/2024.04+git/deploy-u-boot-ti-staging/u-boot-ti-staging-initial-env-am64xx-evm-k3r5*
| rm: cannot remove '/lmp/build/tmp-lmp-k3r5/work/am64xx_evm_k3r5-lmp-eabi/u-boot-ti-staging/2024.04+git/deploy-u-boot-ti-staging/u-boot-ti-staging-initial-env-am64xx-evm-k3r5*'
| : No such file or directory
| + true
| + rm /lmp/build/tmp-lmp-k3r5/work/am64xx_evm_k3r5-lmp-eabi/u-boot-ti-staging/2024.04+git/deploy-u-boot-ti-staging/u-boot-initial-env-am64xx-evm-k3r5-2024.04+git-r0*
| rm: cannot remove '/lmp/build/tmp-lmp-k3r5/work/am64xx_evm_k3r5-lmp-eabi/u-boot-ti-staging/2024.04+git/deploy-u-boot-ti-staging/u-boot-initial-env-am64xx-evm-k3r5-2024.04+git-r0*'
| : No such file or directory
| + true
| + rm /lmp/build/tmp-lmp-k3r5/work/am64xx_evm_k3r5-lmp-eabi/u-boot-ti-staging/2024.04+git/deploy-u-boot-ti-staging/u-boot-ti-staging-initial-env-am64xx-evm-k3r5-2024.04+git-r0*
| rm: cannot remove '/lmp/build/tmp-lmp-k3r5/work/am64xx_evm_k3r5-lmp-eabi/u-boot-ti-staging/2024.04+git/deploy-u-boot-ti-staging/u-boot-ti-staging-initial-env-am64xx-evm-k3r5-2024.04+git-r0*'
| : No such file or directory
| + true

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index bb50e1e9..e1f1972e 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -196,12 +196,12 @@ uboot_install:append () {
 }
 
 do_deploy:append:k3r5 () {
-	rm ${DEPLOYDIR}/u-boot-initial-env* || true
-	rm ${DEPLOYDIR}/${PN}-initial-env* || true
-	rm ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}* || true
-	rm ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}* || true
-	rm ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${PV}-${PR}* || true
-	rm ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${PV}-${PR}* || true
+	rm -f ${DEPLOYDIR}/u-boot-initial-env*
+	rm -f ${DEPLOYDIR}/${PN}-initial-env*
+	rm -f ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}*
+	rm -f ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}*
+	rm -f ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${PV}-${PR}*
+	rm -f ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${PV}-${PR}*
 }
 
 uboot_deploy_config:append:k3r5 () {
-- 
2.46.2


