Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FC3C433EF
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 14:38:30 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.37322.1653921500641421485
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 30 May 2022 07:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fjM38404;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id k16so10589089wrg.7
        for <meta-ti@lists.yoctoproject.org>;
 Mon, 30 May 2022 07:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hzFEW4lmZ2RD550aYu0fe0wkzjjBsgXrp0O3c9Vfvt0=;
        b=fjM38404bHWuUNv+iwM5vMjGcTeLN/hQkKaTszQqBHaf2NzV+XQ2C4XWYJ04zsIZLt
         70toTeiv84ICbNMzoHhqrldtfNEH9LaUUhM5tGsJKW30YE52WMCN4EAV4e03Vo60alO0
         O51CSjaMdoOY8iOMTHxpXHqpK/Zx3Ck4cbfAHwwvcMyiQMiOCqTUtpmv7bilX640PV2g
         jhRIqK9mEJJIU6hMNHTvp0unG9QwjR83MjXO+y/hI2QgQB6sH6qIdYgHPQ3HUQIxE06X
         hB4IK83Z124xgcL461scIn3vxEsxR5P7mmtW7ElTQ+05aLZ3GLURiSy9r6pD0GgMKNDm
         xasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hzFEW4lmZ2RD550aYu0fe0wkzjjBsgXrp0O3c9Vfvt0=;
        b=hEsx2zgaqVRQhsk7+0jJGfZgFLt61+jl/f8ccfj/vLjTqtvQFMRCaYqQHmPbHzNxUD
         QnmQ+oIpKOxt6XDojIrVOCNxvIirnvBfzMP1bOlOBIyrtZfz0xNanfYjhxhzVmRN5GNw
         tMYRSNjgwz6Je09ljNWmIZpsmKUfM8376bSMJrdyPdShrbqw2BnEQygCYmEoJxv2jNFA
         2dj8wn/waKezYNg0BbtJZgO0Lsrh61/QBKAEJ/SZ/Ho0xfipmeNzjVWNoNJH8R2+gPka
         r9l6IMbWm7p2JFb6r59j541EdPomsoX+jdhVyXMGqNGrmSMRl9UUWaQzhUfHe5Rt1BON
         o08Q==
X-Gm-Message-State: AOAM530as3bf/W5XQB/OLwHGUZZwW1iigWidpZlZUMksR/59LGI/0tpv
	cs8QMeXQ40OKAXm/muKcU5MI9o+3WLA=
X-Google-Smtp-Source: 
 ABdhPJwlCzh2T3lcacV0odvgBXOGa8kjrgfHG5GrdOotmX8qyLKz7zOCzBf+BYYUFDxqF0iQs1BMag==
X-Received: by 2002:a5d:648e:0:b0:210:18f6:f954 with SMTP id
 o14-20020a5d648e000000b0021018f6f954mr10220515wri.323.1653921498467;
        Mon, 30 May 2022 07:38:18 -0700 (PDT)
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 m1-20020a1c2601000000b003942a244f2fsm10872817wmm.8.2022.05.30.07.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 07:38:17 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-ti@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH] multiconfig: use diferent TMPDIR for each machine
Date: Mon, 30 May 2022 15:38:10 +0100
Message-Id: <20220530143810.4064720-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 30 May 2022 14:38:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14767

Bitbake manual [1] recomends to use one TMPDIR for each machine:

 "Minimally, each configuration file must define the machine and the
 temporary directory BitBake uses for the build.
 Suggested practice dictates that you do not overlap the temporary
 directories used during the builds."

[1] https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-intro.html#executing-a-multiple-configuration-build

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta-ti-bsp/conf/multiconfig/k3r5.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf/multiconfig/k3r5.conf
index deb07210..0ba163ae 100644
--- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
+++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
@@ -3,3 +3,5 @@ MAINMACHINE := "${MACHINE}"
 DEPLOY_DIR_IMAGE = "${DEPLOY_DIR}/images/${MAINMACHINE}"
 
 MACHINE:append = "-k3r5"
+
+TMPDIR = "${TOPDIR}/tmp-${MACHINE}"
-- 
2.36.1


