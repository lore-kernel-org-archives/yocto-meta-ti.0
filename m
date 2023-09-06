Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7B8EB8FA5
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 09:03:01 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.4352.1693990979369131645
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 Sep 2023 02:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=TR2UkSlv;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-52e5900cf77so2983489a12.2
        for <meta-ti@lists.yoctoproject.org>; Wed, 06 Sep 2023 02:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693990977; x=1694595777; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=poFhdJ85piB27OSFk9jFzCdKTBMrko9OeEaOd/ypYMY=;
        b=TR2UkSlvIJiKr0nxJ0OJ/ANiqLMXWeuKQH9LpnDSK90JBbQoEirLPSiocQntDjIFra
         sFtxB2BZvnQGVXuFSy2iSfEB7lNqvGtc6Otl5iCKjWCvqw0cqGZ++QQDjc6JfdJ9iz2J
         UaHCCE27/AfcMxWV6sxgMAqrjxI5KCTw69YM20mJju6vF0pywpYIxhiBV2cBw6XJl0Dt
         RSjDSfdx1xfO6/IchjByhoeY3nRzXuB74vU8BSuCDK4cLQW5CiuFNmzG+31voDs6WxyF
         OV4Pf4ZcXoh1Bz6CrdjCMpK7dNQmAi2hiBX9HEoXA2vuKxfHZDc9O6XABnC/IPWG6w+e
         iHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693990977; x=1694595777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=poFhdJ85piB27OSFk9jFzCdKTBMrko9OeEaOd/ypYMY=;
        b=JRLkOHcIY7Q700jtZ+c9l1l9NQszUB712Hb31EKzzeuzjY7EG9g5yoNVJcfMHOQaTK
         wQYD3VWtFvU9DcSw+lvd/SeQ/mhxTaTODNJwcIhKvTOF75zPKZjcAF5Aj6xZqZQz+m0v
         hmff++YVAhhCnymckRMTTYTs4M8+F3EGhPodAn5CZJupPgKGmr7fFYuL06QTEvPvtD5f
         CI0U6ZTQijFHxh+BfZ7Zg0s368UDo/BXilH/6xq2tfjP3rbEA4dcJvAyCvxjTesnxTtB
         465Jk7F1M6/cqZem7imf5qkdxAGZL+tbFWGpSDjwyXS67ufXdf0rAR9QiR7EM8M+wvsm
         GWTQ==
X-Gm-Message-State: AOJu0YzC/aO1RImZhCW8UsM8hLoZ4rqkWGcCacYdnbLNJ199AYcggHxd
	kSPmhXdoDrTFiooHQUqG0igAouCHk2I=
X-Google-Smtp-Source: AGHT+IH8tMTOG/1+QN0Z1hXsn6zfBVoSJCQfEVlA9qICGevlcLF3pgBykfaeG4hFRzEW6QfS4YE0Bg==
X-Received: by 2002:aa7:da93:0:b0:523:4933:b024 with SMTP id q19-20020aa7da93000000b005234933b024mr1868457eds.14.1693990977390;
        Wed, 06 Sep 2023 02:02:57 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id y8-20020aa7d508000000b005236410a16bsm8183925edq.35.2023.09.06.02.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 02:02:57 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-ti][PATCH] ti-img-rogue-umlibs: drop handling of usrmerge
Date: Wed,  6 Sep 2023 06:02:53 -0300
Message-Id: <20230906090253.3615190-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 06 Sep 2023 09:03:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16920

From: Max Krummenacher <max.krummenacher@toradex.com>

If usrmerge is set the do_rootfs task creates symlinks for the base
directories to their equivalent /usr/ directories and thus installs
the files in /usr/{bin|lib|...} by following the symlinks.
There is no need to do the move already here.

This prevents a build error should a subsequent bitbake execution
rerun do_install where the sources to 'mv' no longer exist.
| mv: cannot stat 'ti-img-rogue-umlibs/23.1.6404501/git/targetfs/am62_linux/lws-generic/release/lib/firmware': No such file or directory

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 .../powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb         | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
index 9b45a91f..8033322c 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
@@ -67,9 +67,6 @@ do_install:prepend() {
             rm -rf ${file}
         done
     fi
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
-        mv ${S}/lib/firmware ${S}${nonarch_base_libdir}
-    fi
 
     # clean up any empty directories
     find "${S}" -empty -type d -delete
-- 
2.35.3


