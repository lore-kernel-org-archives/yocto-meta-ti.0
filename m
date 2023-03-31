Return-Path: <robertcnelson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E51C761A6
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 20:08:13 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web11.5878.1680293290488046896
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 Mar 2023 13:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=XdFV4Ujb;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: robertcnelson@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id x3so2695676iov.3
        for <meta-ti@lists.yoctoproject.org>; Fri, 31 Mar 2023 13:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680293289; x=1682885289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qF6vHhQeyMiKkOyEj3CuK8nD/bps0FJArpzddbRRVH4=;
        b=XdFV4Ujbzepb87/SeP6++BTIQ9SoDRXqePVWeVJAN9eaUq0DFaoBg2G/0/9iy05vmt
         24JCjEsBZ99x5Z+22OOHD0WfiaY+nfrdijlij916dzlSKa622j2D1qPtU0CejmswqnwG
         V7wpgrbzngVStftPuNDF/IpqH7kIJhtrGKU2tnZzNQun4IJ2YXZlJcy0u2BfvyC7hLbp
         pptVDxgmjx5Brklb3A5aXX0DR+NxZF9IoaivnERLY05OL0iP2JBvnPuBaw0BUTNIU9T4
         RtdAAJ2n8DuJxhujLO0vVrb8E20dVp5XsxZAcebnhTSxwTzINInDUgv8mrj73H1WA0id
         y3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680293289; x=1682885289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qF6vHhQeyMiKkOyEj3CuK8nD/bps0FJArpzddbRRVH4=;
        b=rBco3/h87Xaqng/bjRR83f1SflFTTxuJ9VPgQ7YX1CkY4YKwfn7KAw5xh0/ILJK1x2
         kxENZjDDQE6yvpESAx14pinyXYO5FXM2c4VamVSSPjs6fQWA929DaldRaijDhKWGhnXJ
         YkDk/QfsqZIhM5nfyRiV40JHPtzgWItYVeW5DqgsdxDEFOuBLr8VPZdoHeCtVPFtCoPx
         Mbi1B8Pq2EISPd1Wm+2vMOZ1+O3ICh98t/73IsCyhnpiNuNXG0MWUdzlRL3zKcaxZbkn
         Dy0ZopJAodylc41kaRedDcIsQBKyXtsugspk9nqSpvHFCI736q/+qTlBBbzrDW0hz/IL
         CJoQ==
X-Gm-Message-State: AO0yUKVOOTQZL+IfjPGS81ORRavoTo+dtHms/FDyaSyrQSYdOM/v7kUe
	18QBcr/Hkux0OfzY8sWq8ZMGgiCdcPg=
X-Google-Smtp-Source: AK7set/jIxs/fbU8hW3vr8iQHmNX36BKO5uURJ4i7ysvQc/PrGQdmq7fo3r9mlI2lJqV1q+zG7kFjg==
X-Received: by 2002:a6b:f20e:0:b0:74e:6f06:d5f5 with SMTP id q14-20020a6bf20e000000b0074e6f06d5f5mr19433530ioh.8.1680293289404;
        Fri, 31 Mar 2023 13:08:09 -0700 (PDT)
Received: from hestia.gfnd.rcn-ee.org (208-107-161-31-static.midco.net. [208.107.161.31])
        by smtp.gmail.com with ESMTPSA id ct14-20020a056638488e00b0040688974849sm885510jab.17.2023.03.31.13.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 13:08:08 -0700 (PDT)
From: Robert Nelson <robertcnelson@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: denys@konsulko.com,
	Robert Nelson <robertcnelson@gmail.com>
Subject: [PATCH] meta-ti-bsp: BeagleBoard switch to GitHub mirror
Date: Fri, 31 Mar 2023 15:07:53 -0500
Message-Id: <20230331200753.333849-1-robertcnelson@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 31 Mar 2023 20:08:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16281

BeagleBoard.org's GitLab instance: https://git.beagleboard.org/
easily becomes overloaded, switch to GitHub mirror.

Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
index 35fb40cd..07d06e21 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
@@ -25,7 +25,7 @@ SRCREV:k3 = "11ebcc09f32669fac8254dff56d500f86c4c2caf"
 PV:k3 = "5.10.153+git${SRCPV}"
 BRANCH:k3 = "5.10-arm64"
 
-SRC_URI = "git://git.beagleboard.org/beagleboard/linux.git;protocol=https;branch=${BRANCH} \
+SRC_URI = "git://github.com/beagleboard/linux.git;protocol=https;branch=${BRANCH} \
            file://init_disassemble_info-signature-changes-causes-compile-failures.patch"
 
 DEFCONFIG_NAME = "bb.org_defconfig"
-- 
2.39.2


