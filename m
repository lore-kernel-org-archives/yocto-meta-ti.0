Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B2AC64EC7
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 19:42:02 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.23791.1676922119368156328
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Feb 2023 11:41:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KWlAVvCf;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id c5so2986989wrr.5
        for <meta-ti@lists.yoctoproject.org>; Mon, 20 Feb 2023 11:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SjV/hS2Ak0VQ2oQmGYFC3HhQburkW/zVO8t0bdSBVTA=;
        b=KWlAVvCfymFHrbBxpoJW60S7ja4VkHxsch2ms+S51R4mP2rvn0Qx1BoQXrjTycKsDS
         Rl0oFNY3Gxy1ucHJnUAidBNprjrGRy+0X9enhBrfJLfkZbSJpFMjN+x2z1BooipE5WN4
         ik7YKXgaoZzB9G7upH31rQ0Sbh+1sbG4pkzOT5dLpCmnZj+zcWMDpW7FAsR8/qQXueCS
         qGhDt/QhuF0qccUSq84k+3y70iMJxKPri+4Eb6vM2G/Zn5j/xeyLefCuuDU6lvmduhah
         NuKpYQzN2qSYZjSnyVhGSiC49m1ZoXl38q7uGU62WVSFc6vJnNGF4i0IgWTCXTQHUBu0
         iUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjV/hS2Ak0VQ2oQmGYFC3HhQburkW/zVO8t0bdSBVTA=;
        b=go3a0PFvt+kehIk7yoppqzGsFx64VRb3c60UC81n537lw+1szTvfAixfrdGDJKvEtY
         /zcDLwOs0KA/H0ECmJ7mP0WwGCMUL+uWFxKnCkNx/gr7xolFshmc7JGA0EdBtA5dG1Rw
         i14DZ4sRY84GjKHyuTpTJQWz4Xzhlpr6Lao95PPgygqKR/MBtyN6KXMeoESuMhfS5xcy
         W54lvWX9Nlz1xBvyg+1tb16NCTiysoECcq3dBi3pENS29W0HEniWPB6/uOeHJC9GYSkH
         1zlAiAvmVvgJRWanj4fFgqUZ6gyTPMehGlAczN3/+4qXTJVoy+l5h3MecBkXQAC+CMMG
         Rcug==
X-Gm-Message-State: AO0yUKXMPVV/J2fxI0nkUu0N6zIKYOvVQChKUK1T2EbrbRSdfDM/9I8a
	HDNjxpaIQVqNGdHwDQB9Uy9jfHZ6vTjBWekb
X-Google-Smtp-Source: AK7set/CuABOtEyB2de/OViaWArjg6UCAFgyX97Rgc5SzXGdw45M8kqe96uKArWqguArScWFdcZqfQ==
X-Received: by 2002:a5d:5b0a:0:b0:2c6:c9f1:e444 with SMTP id bx10-20020a5d5b0a000000b002c6c9f1e444mr575969wrb.16.1676922117591;
        Mon, 20 Feb 2023 11:41:57 -0800 (PST)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id e6-20020a5d5006000000b002c57384dfe0sm4658040wrt.113.2023.02.20.11.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 11:41:57 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-ti@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [master/kirkstone][PATCH] ti-img-rogue-umlibs: handling the firmware installation with usrmerge
Date: Mon, 20 Feb 2023 19:41:45 +0000
Message-Id: <20230220194145.2732850-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Feb 2023 19:42:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15885

The ti-img-rogue-umlibs package is not obeying usrmerge distro feature. /lib should be relocated to /usr. [usrmerge]

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../libgles/ti-img-rogue-umlibs_1.18.6276027.bb               | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
index 924e46ba..94d14ded 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
@@ -25,6 +25,10 @@ PVR_WS = "lws-generic"
 RDEPENDS:${PN} += "mesa-megadriver libdrm ti-img-rogue-driver"
 
 do_install:append() {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
+        mv ${D}/lib/firmware ${D}${nonarch_base_libdir}
+        rmdir ${D}/lib
+    fi
     rm -rf "${D}/etc/init.d"
     rm -rf "${D}/usr/lib/libvulkan.so"
     rm -rf "${D}/usr/lib/libvulkan.so.0"
-- 
2.34.1


