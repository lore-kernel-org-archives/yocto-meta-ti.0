Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11681C433F5
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 16:58:40 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.495.1651424312837727707
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 01 May 2022 09:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DWifBH5X;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 cu23-20020a17090afa9700b001d98d8e53b7so11175827pjb.0
        for <meta-ti@lists.yoctoproject.org>;
 Sun, 01 May 2022 09:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JcBoozmHWeDSJc9CkexzmvdjHcKn8GA1Bah23/S0nOE=;
        b=DWifBH5Xx9hYrAXEm+uLRRQmmm7P6GWu2mN+Rr3dhoCdqStVzHbN3d22A6PagGcCWp
         w0rwfKgAj6tjiJFhnDJ8zXVLs9emQbqgHgOG6TfV37WLL+nCRM+4HXSs2mCAnebiHDKS
         cx3OjZutC4ou5QSR5bkJKcN4fZGtBO+yQT3SXMWZRu+JzXmlTrkl0KGSTIsvejCrSuBG
         q7uj6Mr8vFs7YcC9DoAuf+n8dkpB6LRoOZLlgq60Go48/DjELkzQl1dX1AwBTFcuQ3lV
         fX05u575uSp2MN9QIjRzmQa8F8WXsVJtqd5Ouk6WkEE6LH93bc01FJ42r5bl9liLiGqE
         cQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JcBoozmHWeDSJc9CkexzmvdjHcKn8GA1Bah23/S0nOE=;
        b=ZWYbcegv0XvWbpSObJtnfCEMgH30jFv5a0QnZafHHqUGd1m+IuB4qE2zvY25O/zJWL
         yUQ0l/IoCUyL4NonIdhD5cMfzaIOWLwC4V9TlX7fTHs3k1pMW4uq+Kgc26Mw5RBN8Ful
         b7VuxG1vtssCGYLv0cMkbvKb30KFmt6vufSDGTqbT2tdDa84taeozjkMLOuJ+0vfZ+W+
         wPdkqFcDznGVPiAx2Dc6zwn+4X+bC5xQRPx5TcoQoCv8fmfYozC63Ct4tm3J6SVduGnQ
         +AfHyldQciZJ/9oqjXf8YMJR8kMVsPNN8ZofBBOsmNnD807U2wqAPairCAjCtXpQ6wal
         c+xQ==
X-Gm-Message-State: AOAM530Ys44TRVlFX25AufJNRqNMI6ebwIu5E5+rpnKoiOM0hs3WIJbQ
	ihCqg4hiz7dQHbing6tp8wxRJq8fcRlTWw==
X-Google-Smtp-Source: 
 ABdhPJzl4CLTXNqp8Sc1pimqzTiyiKK0Wp3cvLRGuAbrizgKjCPJLqkzglrmzro0IBGQOviPQXcI3g==
X-Received: by 2002:a17:902:e5d2:b0:15e:9467:187 with SMTP id
 u18-20020a170902e5d200b0015e94670187mr5501923plf.123.1651424311900;
        Sun, 01 May 2022 09:58:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 e22-20020a62aa16000000b0050dc762813csm3088046pff.22.2022.05.01.09.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 09:58:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] cmem-mod: Fix kernel module packaging for usrmerge
Date: Sun,  1 May 2022 09:58:28 -0700
Message-Id: <20220501165828.2831061-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 01 May 2022 16:58:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14639

ERROR: cmem-mod-4.20.00.01+gitAUTOINC+86269258a4-0a do_package: QA Issue: cmem-mod: Files/directories were installed but not shipped in any package:
  /lib/modules/5.10.100-g4a12bec7d3/extra/cmemk.ko

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-ti-bsp/recipes-bsp/cmem/cmem-mod_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/cmem/cmem-mod_git.bb b/meta-ti-bsp/recipes-bsp/cmem/cmem-mod_git.bb
index f7965593..ea2cc5f4 100644
--- a/meta-ti-bsp/recipes-bsp/cmem/cmem-mod_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cmem/cmem-mod_git.bb
@@ -8,7 +8,7 @@ PR = "${MACHINE_KERNEL_PR}"
 
 inherit module
 
-EXTRA_OEMAKE += '-f lu.mak KERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" TOOLCHAIN_PREFIX="${TOOLCHAIN_PREFIX}" EXEC_DIR="${D}/lib/modules/${KERNEL_VERSION}/extra"'
+EXTRA_OEMAKE += '-f lu.mak KERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" TOOLCHAIN_PREFIX="${TOOLCHAIN_PREFIX}" EXEC_DIR="${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/extra"'
 MAKE_TARGETS = "module"
 
 KERNEL_MODULE_AUTOLOAD += "cmemk"
-- 
2.36.0


