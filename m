Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC7D9C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 19:26:25 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.5430.1702409182989119242
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 12 Dec 2023 11:26:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jX6qAjdP;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40c2c5a8150so56215345e9.2
        for <meta-ti@lists.yoctoproject.org>; Tue, 12 Dec 2023 11:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702409181; x=1703013981; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/PyoKScqQT98wZSrN/cR4usvazMf/kTPp5VbqlCOIoA=;
        b=jX6qAjdP0dPPOeGHi2kR/W6bLfoge7XiyZRfTkUXLlLl1oa4mJxEBl+Eb9f3n925uA
         /j+3Coj++EZbR8PGcYbAmbV9JnWawtj8qjJ8g+Ux9iMQwS2Rz6P62bzi4r6alBykrp/u
         MdMrX/ptAwrZPpn1HjkHQFuEhaJrCunAoZCDz+/CtRxEr1/FU2fmN/jLs53ZF5jJTogb
         vYxnNVIl4ODRliwh+3bTV87jWiAe+mJezfRRCOSodEcok/edw+PSJ+OEXcWoglew5XYn
         ECcukzv/8OliEJHEqNpcmNvmTf3Kn5kY/Sek3KwfNkcv6r4Q1xJ0XIDkwjhnfHTAtXqe
         XFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702409181; x=1703013981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/PyoKScqQT98wZSrN/cR4usvazMf/kTPp5VbqlCOIoA=;
        b=kBAZr8n8IysollLR98nCXSXqhiQZDlaiDGhGR9zkmI9kBV7BguxJ59dX8xO4wkQ1Cd
         1JCNE4zRE9sw8jWTqeN53cp9xx7OxI7Y6Xfaa/6Q05FwXHf2rw90EllSaWFmsbeUdSXP
         avFT74wb02GvKPnPtAMEV+I17tb1ThpZaYt3hloQ9rXNu0noWy+UD3DDzfZTbTTaGRyq
         Mm1b1/N2sf3q/XzE8MqW4OnRWzZLWWenxXzFfpsh40HfnDCTEPM4y8rHDBkLTGF/69ek
         rYnf0uEfZS/WN0TGNdn5PTeCGTqRQ6EJeyWmXIp44DaSqmwJSqyvcmJGdJTyYtSOg5mj
         XTTg==
X-Gm-Message-State: AOJu0YxmgXrFjP+PwacCm5WFurL+dYfQrd7XuOcfLueVhVPcOR+Pe5oh
	5CubYvwxIt9Mx63Bhz28sgkqQb3cYUY=
X-Google-Smtp-Source: AGHT+IF0J/9j0TeYkcG3F7xW7vr5BpnZkHr0P56KzowM6dHW5IcSLBRmJFKowQwNteP/E+vpgjXqkQ==
X-Received: by 2002:a05:600c:364a:b0:40c:2b24:325e with SMTP id y10-20020a05600c364a00b0040c2b24325emr3371876wmq.184.1702409180835;
        Tue, 12 Dec 2023 11:26:20 -0800 (PST)
Received: from toster.lan (bl16-110-70.dsl.telepac.pt. [188.81.110.70])
        by smtp.gmail.com with ESMTPSA id k2-20020a5d6282000000b003363432c0ffsm1727869wru.113.2023.12.12.11.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 11:26:20 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-ti@lists.yoctoproject.org
Cc: ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-ti][master][kirkstone][PATCH] k3r5: make the separate TMPDIR optional
Date: Tue, 12 Dec 2023 19:25:58 +0000
Message-ID: <20231212192558.1649297-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 12 Dec 2023 19:26:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17348

With the current implemetation is not possible to remove the '-k3r5'
customization using overrides like below and the '-k3r5' always stay there.

| TMPDIR:remove:k3r5 = "-k3r5"
| or
| TMPDIR:k3r5 = "${TOPDIR}/tmp"

This patch allows to build the core-image-minimal in oe-core master/nanbield
without any issue on a common TMPDIR folder just using the following:

| TI_COMMON_DEPLOY = "${DEPLOY_DIR}"
| TI_TMPDIR_APPEND = ""

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta-ti-bsp/conf/multiconfig/k3r5.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf/multiconfig/k3r5.conf
index e36c87ed..936bce2f 100644
--- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
+++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
@@ -4,6 +4,7 @@ DEPLOY_DIR_IMAGE:k3r5 = "${TI_COMMON_DEPLOY}/images/${MAINMACHINE}"
 
 MACHINE:append = "-k3r5"
 TCLIBC = "baremetal"
-TMPDIR:append = "-k3r5"
+TI_TMPDIR_APPEND ?= "-k3r5"
+TMPDIR:append = "${TI_TMPDIR_APPEND}"
 
 SDKPKGSUFFIX = "k3r5-nativesdk"
-- 
2.43.0


