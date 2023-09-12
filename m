Return-Path: <perezmeyer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BE9EE3F10
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 19:36:24 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.4368.1694547381400287946
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 12 Sep 2023 12:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=drK32f8T;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: perezmeyer@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1c4c5375329so4463399fac.2
        for <meta-ti@lists.yoctoproject.org>; Tue, 12 Sep 2023 12:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694547380; x=1695152180; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sypKhE2BxVYV/qewdSc8kYC7DrINVrlfLWb00O//BEI=;
        b=drK32f8TcOJcTeSgxXQtKUfPBXKKJG92EWZHAKx11ZCpRTXvpG69Q3aIUtg044ar7+
         T+4EZWyUBr2GeMR5sqUiwF599pEiiobGPyTUU9eWIa/0IUVsf+ST2XKYua2eFRP689B0
         H9q1hcFjpiCI9GQ0bTo34XJNDJGt+oR+iDj2L6mHhpjjUTg6p/nOf7w7FTIzBSGnZmlX
         dluybEBFbgZ/qsPSUujEs3mTygEk2U64E/hhO564G6imf4yoRg9+LpKAvbNICLz2SY/i
         Vr4scVpQZgaCHv8J4qEz6ZdcpeDo9rRmS11IrrgRUbMGceYBHEcUo1tiEKyl2ydLglnB
         VFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694547380; x=1695152180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sypKhE2BxVYV/qewdSc8kYC7DrINVrlfLWb00O//BEI=;
        b=P9LvFUzkHjkLTX9wW9jj9HpvU5P0abJzlx8HC9Ig2PBxSA5R00M4V3LNds4ajA3Di1
         wxD9rVgC+ry6PtdZ/hbHz6HNG78vUsLALbtOkA4AzuY3nTPeF3UWkvnS85MdzBlEePwh
         kckDaKPcbanW9+s41WGe7vHTQfIxkvvIPTPecIhASS62NSD2sXIv1SnkqVB7Tycv8k6l
         jSBZe6S8L8RITBeju57vacbCA+gCed+7H7oudHvm/CUjzcxuFbp0Hf6WC4sDGDRPovQQ
         aRdukhSl6YGGAwqAKeGRMRmVfnosrtqX7O4+llXt8N8xfhvwblfb2jDOf/eP1M+4w6YN
         mDKg==
X-Gm-Message-State: AOJu0Yz+texczHVt6kqGQDyYlYErbIDvdhiDm9iwTAgbxMTjC7EtW/6p
	0WsD0c3RAhzKvguFU2zF4+oTu6upTeA=
X-Google-Smtp-Source: AGHT+IEkzQ+GEQmJOfjJ94mSMExGR8MRuKqtuCK1hOeRTtRzdtCNBfiXJDBuunhKwX5vlFTIb1mrsQ==
X-Received: by 2002:a05:6870:d354:b0:1bf:7b3:5116 with SMTP id h20-20020a056870d35400b001bf07b35116mr510558oag.47.1694547380240;
        Tue, 12 Sep 2023 12:36:20 -0700 (PDT)
Received: from gryffindor.lan ([181.197.222.104])
        by smtp.gmail.com with ESMTPSA id la7-20020a05687c328700b001d5068b11b4sm5396372oac.30.2023.09.12.12.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 12:36:19 -0700 (PDT)
From: =?UTF-8?q?Lisandro=20Dami=C3=A1n=20Nicanor=20P=C3=A9rez=20Meyer?= <perezmeyer@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: =?UTF-8?q?Lisandro=20Dami=C3=A1n=20Nicanor=20P=C3=A9rez=20Meyer?= <perezmeyer@gmail.com>
Subject: [PATCH] linux-bb.org: depend upon the required firmware files
Date: Tue, 12 Sep 2023 16:36:13 -0300
Message-Id: <20230912193613.4189791-1-perezmeyer@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 12 Sep 2023 19:36:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16957

Same as with linux-ti-[mainline staging].

Signed-off-by: Lisandro Damián Nicanor Pérez Meyer <perezmeyer@gmail.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
index e134fb84..ac258a64 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
@@ -8,6 +8,7 @@ COMPATIBLE_MACHINE = "beagle.*"
 inherit kernel
 
 require recipes-kernel/linux/setup-defconfig.inc
+require recipes-kernel/linux/kernel-rdepends.inc
 require recipes-kernel/linux/ti-kernel.inc
 
 DEPENDS += "gmp-native libmpc-native"
-- 
2.40.1


