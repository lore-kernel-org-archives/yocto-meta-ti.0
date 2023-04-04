Return-Path: <robertcnelson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE44C761A6
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 15:17:02 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.104674.1680621419520099217
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Apr 2023 08:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=FdcNK662;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: robertcnelson@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id o12so12230148ilh.13
        for <meta-ti@lists.yoctoproject.org>; Tue, 04 Apr 2023 08:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680621418; x=1683213418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LVyZHEAxvLIlAb5f5FqmnhEvO8ozKoDDdXeXZShdK4M=;
        b=FdcNK6623gnDvMN+iulGApaD/usSrcoV/ct1RDBvzQ3v4bbVSK9AsfDTw2TEQQy5Fh
         rQv8kbo9/KpcKg5c6w3uOxavPt9H/x6BYjVABV4DV9YHiBJ8Ct+CpjFOnOrU+u5Y6PQK
         nXvvtMKdlXhrXVc2KWTcrvn5Je7ityxLKxkONN0T7F5TiEVTycdlzQO62FZnDsnkls4c
         a1pIsGkE7eWzty4k0vGkYJb5VJajMc3YqLp0vEK3Y7V+6TjR4DcEuir+/dsQX9BaEDw9
         Oeq+DDVrkV9PsJz3DeLLKvVScDSRApv4wTzEU4VEeN9ciVHwb+/R6nt86bNHduw+Zace
         blSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680621418; x=1683213418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVyZHEAxvLIlAb5f5FqmnhEvO8ozKoDDdXeXZShdK4M=;
        b=JDiorETXhopjXVmbiRd7eKiLtz+zctOoZT39W/OeAydT/t/4RObwOceXGRI9AgkFZp
         xBe2UIuOkVPoVGzGGCAfZ3ry/feburPZK8FA2ZmEqVX0p7PWuvLp0NygYY5mUWIspCZL
         8fqlSvRqgYXZzskysDhOd5uqbnDSh0nLegXVTkGLYLTfUmi4NQQ3QlHAp0fNgRAXtilB
         KdYvR65LxD22J0KjLuZ2l8MLWFI7BmM+LzvK3uTR26667ZTGPY6u/jGIVZMMt4rYzQGs
         L1J5gsl13TGuQ8WqNM1YV2rd2w1tX66CbxLthj/Aw9skg2tGCCuh46vy6Nh+dxdej+Rc
         1QQA==
X-Gm-Message-State: AAQBX9esN5V6fjaocWUHskEVOy2l2ekWrECHXTp8WJasdGh3UfMRdykj
	SqEZ6nMpJFivRGVT3Khic6p3UFvOuNI=
X-Google-Smtp-Source: AKy350bGUj/Qp8KErrw9+GP/p7E21ywLSx5Nl80kuS0FuTjKh6J//PdbM5K0CuUExicu7ymGOf7ZLw==
X-Received: by 2002:a92:cc0a:0:b0:326:3cff:dba9 with SMTP id s10-20020a92cc0a000000b003263cffdba9mr2171925ilp.29.1680621418570;
        Tue, 04 Apr 2023 08:16:58 -0700 (PDT)
Received: from hestia.gfnd.rcn-ee.org (208-107-161-31-static.midco.net. [208.107.161.31])
        by smtp.gmail.com with ESMTPSA id bp14-20020a056638440e00b003a4419ba0c2sm3294568jab.139.2023.04.04.08.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 08:16:58 -0700 (PDT)
From: Robert Nelson <robertcnelson@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: denys@konsulko.com,
	Robert Nelson <robertcnelson@gmail.com>
Subject: [PATCH] meta-ti-bsp: BeagleBoard-u-boot switch to GitHub mirror
Date: Tue,  4 Apr 2023 10:16:55 -0500
Message-Id: <20230404151655.1140939-1-robertcnelson@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Apr 2023 15:17:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16287

BeagleBoard.org use the new u-boot mirror on GitHub
https://github.com/beagleboard/u-boot as
https://git.beagleboard.org/ easily becomes overloaded

Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
index 28a347be..bdc40c0f 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
 PV = "2021.01"
 
-UBOOT_GIT_URI = "git://git.beagleboard.org/beagleboard/u-boot.git"
+UBOOT_GIT_URI = "git://github.com/beagleboard/u-boot.git"
 UBOOT_GIT_PROTOCOL = "https"
 BRANCH = "v2021.01-ti-08.05.00.005-SDK-8.5"
 SRCREV = "46ff4982b41067e5c93369bddd49b1541856d80b"
-- 
2.39.2


