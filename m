Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA7E3C54EAA
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 15:20:48 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web10.43778.1675092044648288141
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 30 Jan 2023 07:20:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DXRtgXfv;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: quaresma.jose@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id k12so196873ilv.10
        for <meta-ti@lists.yoctoproject.org>; Mon, 30 Jan 2023 07:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3IAdUdEIIdtrX+Hg1oThMhszFo+Qhyb1Fa7CkAxAl4c=;
        b=DXRtgXfv94hvkL6crRuNo0q9GIreFFQ+GXotk064CWeJi3hFSAs9FYBTizLZNqkDdg
         3jK+CUIdn8tZpszNbe8Bml329U5y/xLGXmX3wmvJUKhUHCnI/9eoAdJPlPhLQ6vHQubW
         pdViRfJLbKV4ZOwZO13wdRnD94mPtvw0a8xV8onWiWwnuy7G0WIxsXFJOL19mlXUCE+y
         kVXmRZyawud0Me5aeMjLqdMGUaPyMimTMfbHknhJPhair94VmusIEy0lpLYcqHrxRL/4
         zNG0Ug+gWCMbtl1J+2E/EX48vw1DjHcyLLVJTm3kXDwELHO812mGOpIU0c8IO7dyAR2v
         M7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3IAdUdEIIdtrX+Hg1oThMhszFo+Qhyb1Fa7CkAxAl4c=;
        b=ZB03CxZNXsS5hBVFZOVK2d4GrYP1hYgG4uOqC0FDIAC7tauRfF+BdyrLCcdnioTg9n
         NRsEikCwOlucMofzWr40SDS0LCwWF1rtMlno7YFpzTr9v8n0ICFaoK9kCxMCJlti5CL9
         j/ggqiyQbLcd9M5B+uGOGW1lIA+CcOxjkQL4Bq8q9VybPHZDZQ0ap1GD6fllsHNBYL0i
         1MW6Zgy/s78nS0vv2IZoRK2V219/5VDTAK0s9+JipQLovNQddYoo/OA4+wdxbYkMq56c
         Y3QOOBnpYlOCFMZC/fQHiUWuLsF8MSwbE6HkCKkOaGyJO0M4N+mJfrr1f7X6WbAbgYwP
         lUvQ==
X-Gm-Message-State: AO0yUKVXEKbjV5qlw3LelyFnoahUEHNUmVv4TPooce+6Z3+se3qk0ody
	1cagLh45aJ8LFUT+vyhdkL642YjHBxI=
X-Google-Smtp-Source: AK7set/q7vci/VsQpyT5VYzNsoS+p5dVAl8jhbsMpmo0A1K4EST5KYYujU35qTVezsLTmTo8TUNUUg==
X-Received: by 2002:a05:6e02:12e7:b0:310:ce1f:44fd with SMTP id l7-20020a056e0212e700b00310ce1f44fdmr10464806iln.3.1675092043831;
        Mon, 30 Jan 2023 07:20:43 -0800 (PST)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id m18-20020a026d12000000b003afe5e747d6sm1419828jac.126.2023.01.30.07.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 07:20:43 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-ti@lists.yoctoproject.org
Cc: ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-ti][master/kirkstone][PATCH] bsp: multiconfig: k3r5: allow customization by donwstream layers
Date: Mon, 30 Jan 2023 15:20:00 +0000
Message-Id: <20230130152000.705123-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 30 Jan 2023 15:20:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15699

This patch adds the possibility to change some bitbake variable
that cannot be changed anywhere else, one of then is the TMPDIR.

Using the same TMPDIR it is very sensitive and prone to several errors
when used in more complex situations.
This configuration forces that all native packages have to be the same between all
machines and this requirement is very easy to break.
Suppose you use a macinhe override somewhere on a native recipe
and this requirement is no longer met.
Many of these anomalies can be verified with the use of the rm_work and
create-spdx bitbake classes.

A previous attempt [1] had already been made but was refused
but this way it can be done without side effects for other users.

[1] https://lists.yoctoproject.org/g/meta-ti/message/14767

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta-ti-bsp/conf/multiconfig/k3r5.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf/multiconfig/k3r5.conf
index deb07210..b69c5d6d 100644
--- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
+++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
@@ -3,3 +3,5 @@ MAINMACHINE := "${MACHINE}"
 DEPLOY_DIR_IMAGE = "${DEPLOY_DIR}/images/${MAINMACHINE}"
 
 MACHINE:append = "-k3r5"
+
+include conf/multiconfig/k3r5.inc
-- 
2.34.1


