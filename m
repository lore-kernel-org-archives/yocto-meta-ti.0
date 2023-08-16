Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD5EC001E0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 14:22:59 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.161826.1692195776236666291
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 16 Aug 2023 07:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rhYbehtM;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-76d5352bdb0so253798385a.0
        for <meta-ti@lists.yoctoproject.org>; Wed, 16 Aug 2023 07:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692195774; x=1692800574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=O1um7Ry2tOTW9LgWJOxj7h4fKdBy4aK3xIk2MSK0+f4=;
        b=rhYbehtMWj6gsvL8DGeE3hqJrui/milKCDh+rkHxlAfIyqUGMWGbPQM4mHAwp4DtBE
         pd1usGm2S/fR6ob+sNSy8X0hzFc7EWfMjlPE9wTIxIuQBEEr+xg0LxBN7kW9lC1m8kUk
         2/sOQBOD27ivMAJD7F4pqsgY1GIQX3MTHwfCXAMWtwX4juEJbYFAKj39KYuZ/0JV9Aox
         7q1MXeuhHWQBMC5Yiaz1eW1Jdgo4l6brNgs2eFiAZJMQ0Y09lRNzKGPlUg1AHAU8SXlh
         wUi3ON2l0uWm0g7kCIvl2G01eKr/qWjw1kRFznHeV51my2V3idzmz0T7j3dj26BgQxfd
         f2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692195774; x=1692800574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O1um7Ry2tOTW9LgWJOxj7h4fKdBy4aK3xIk2MSK0+f4=;
        b=MbGknYzBTBRkkQT63ULdWfZ67GOLa0Xw72NULGVTGTPAwXSrkxOI8op79oI+Kgs8VU
         vsZUgBgdnW19cGPuyqcpIVZbcaENe2iRSMCXeP9nr3U1GeNKJwdFNT6HodHogwUAqnUu
         IFe6FH+hfnOtIY21eEn0Vje5i9AKL8y2eGo0UxMCJqAZUcILCPij+ZWgaYqP/MgDuLkr
         +zeJQzN1YCA65+dmi7b97tgD5wlVwR/wdrKBigzyndGRt443MyUtuvL0RhPztKraGXt8
         m1Q8cxvBGdAGg/mxpvxCYZ/L32LrF8nYMTiFoFO3AtF9zW4Nn4YcDwAOwBWbyq10I6AW
         okrQ==
X-Gm-Message-State: AOJu0YzG8XYnjURwigqFsFPP0e/ehq8fbxY8U7K72hqetjosCWvcDSlZ
	tVFZ8sXL4h75Du7qaihwiAE0Gm4S+e8=
X-Google-Smtp-Source: AGHT+IHSu9HH1qVlnB0Zg91svjbFaOhZqbJ09e5UmQJy8cwjQvqSnkGu26q6pDpQmRQSef61Qkk6Sg==
X-Received: by 2002:a05:620a:17a9:b0:76c:c0bc:bfe0 with SMTP id ay41-20020a05620a17a900b0076cc0bcbfe0mr2762743qkb.39.1692195774453;
        Wed, 16 Aug 2023 07:22:54 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id p6-20020a05620a112600b00767303dc070sm4446520qkk.8.2023.08.16.07.22.53
        for <meta-ti@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 07:22:53 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH] pru-icss: update QA checks
Date: Wed, 16 Aug 2023 10:22:49 -0400
Message-ID: <20230816142249.22378-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.41.0.327.gaa9166bcc0ba
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 16 Aug 2023 14:22:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16877

Update the QA checks done on the build artifacts to include [buildpaths] since
the PRU linker includes these paths in its output. This avoids build warnings
or errors of the type:

	pru-icss-6.2.0-r1 do_package_qa: QA Issue: File /lib/firmware/pru/PRU_Halt.out in package pru-icss-halt contains reference to TMPDIR [buildpaths]

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
index e73e0e7e9483..6acce94b6fd1 100644
--- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
+++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
@@ -380,5 +380,5 @@ ALTERNATIVE_PRIORITY_pru-icss-rpmsg-echo = "100"
 ALLOW_EMPTY:${PN} = "1"
 
 # This installs PRU firmware, so skip "arch" QA check
-INSANE_SKIP:${PN}-halt = "arch"
-INSANE_SKIP:${PN}-rpmsg-echo = "arch"
+INSANE_SKIP:${PN}-halt = "arch buildpaths"
+INSANE_SKIP:${PN}-rpmsg-echo = "arch buildpaths"
-- 
2.41.0.327.gaa9166bcc0ba


