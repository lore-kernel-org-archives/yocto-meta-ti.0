Return-Path: <res.sapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A4CEC41513
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 02:30:45 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.198672.1697509837518847816
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 19:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZIq6if0J;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: res.sapp@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1e9ac336589so3345416fac.1
        for <meta-ti@lists.yoctoproject.org>; Mon, 16 Oct 2023 19:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697509837; x=1698114637; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5bd/6APKWUsI4aKzD5MnXRGYIhm/Q+dAv353/0ecmvM=;
        b=ZIq6if0JssusikY/meY47mSl9PIDwD3Z+euc2Curo0IkVDKWo221u0i4gnLpqJ293S
         H8C46DAHxrDu3l4POBSGSuZ2GE2ZG2M0k2VGXLALtHDOnZue13zkDeM3jPjFHlpZwnjX
         c0Uw48eDRfmUO/wY+K3ScvtDLlWrA0hGHjnv0uNBNIvu1nR5rHn+Xhdya/BLzPU2TdDA
         2l/5q9+/w11wtk+XVV3bwjHmGhlA7+liIvgYFwrl2oIa4R7lM3MKCzQR93EW1Mh14jJh
         j4fY3GGVr+hC58Dt3XGpUXIv+XtRop+wVPoDxjmR7fAWNr4OUbevk1wJOezVQ/1L/xh8
         ZVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697509837; x=1698114637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5bd/6APKWUsI4aKzD5MnXRGYIhm/Q+dAv353/0ecmvM=;
        b=adgfr5CbdrYPivhTvonSviAw7HYClkHLrTDpJ3bR0zDyDUxmH2f3ZrCM03X7OFuhkv
         u76s3sLcQiYCI4aB/Mu6c5NKHA9NSlEQuuiLX6wU3nWcLex153TOfqfKR4wlO221kZO0
         KYiOcrH9LeJhmJKWFjBEYLOqGPNboNm5KEA9gpmkfz+tKTC0hZZEaGZPC7Z346a72XV/
         Jyt6LwqTEouwbCc2kR1ZfxDPWAtlqraCCLGKpMzxHOTfdrx26CcPgqVyKK3NtG1qMMuU
         1ADG1feshku1arIiSXY7Wv5Hp8aMuzty6F3gKld5jdmFTQxTD7qoNLsmf+tyQE4s7LhO
         dnhw==
X-Gm-Message-State: AOJu0YxTKVgGd62d31w6uQ+0AaCxm9jgVDZjnAM94x8ZiQYjjLLthVNU
	T/3Zih3Z94Vv1wIrcavlhSU=
X-Google-Smtp-Source: AGHT+IFDa/13IW6tBuAwsa/KQkKWPC3qXQg8Npv1YniYGoo2fQu2nQYgWtOctBbE7kY280RuNbnhiQ==
X-Received: by 2002:a05:6870:82a6:b0:1e9:faca:bd27 with SMTP id q38-20020a05687082a600b001e9facabd27mr1081457oae.23.1697509836714;
        Mon, 16 Oct 2023 19:30:36 -0700 (PDT)
Received: from rig.lan ([2600:1700:eec4:a85f::3])
        by smtp.gmail.com with ESMTPSA id mo16-20020a056871321000b001e9a60dbc42sm95331oac.47.2023.10.16.19.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 19:30:36 -0700 (PDT)
From: Randolph Sapp <res.sapp@gmail.com>
To: reatmon@ti.com,
	denys@konsulko.com
Cc: meta-ti@lists.yoctoproject.org,
	Randolph Sapp <res.sapp@gmail.com>
Subject: [meta-ti][kirkstone][PATCHv3 0/3] Reanimate the corpse of SGX
Date: Mon, 16 Oct 2023 21:29:48 -0500
Message-ID: <20231017022951.108252-1-res.sapp@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Oct 2023 02:30:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17127

Third times the charm.

Brining back SGX on kirkstone (and hopefully making it easier for the community
to port to other distros).

This overhauls the SGX drivers, fixing a few bugs and setting things up to
achieve three things:

1) OpenGLES2 Acceleration under kirkstone (even if it is limited)
2) Break out a common interface to use newer versions of mesa
3) Revamp building / packaging procedures to try and match ROGUE where possible

I'll absolutely need community involvement for further testing / development as
this driver will more than likely continue to take the backseat to ROGUE in the
future. I hope the people asking about SGX on kirkstone earlier this year hear
that... :)

This revision actually tests AM654, adds a fix for Yocto's dev-so stripping
shenanigans, and enables the SGX on the ti43x platforms as well. This also fixes
the issue in v2 where the SRCREV of the ROGUE driver was adjusted accidentally.

Randolph Sapp (3):
  ti-sgx-ddk-*: version bump to support kirkstone
  mesa-pvr: bump srcrev for sgx support
  machine: include: enable sgx on tested platforms

 meta-ti-bsp/conf/machine/include/am65xx.inc   |  2 +-
 meta-ti-bsp/conf/machine/include/omap-a15.inc |  2 +-
 meta-ti-bsp/conf/machine/include/ti33x.inc    |  2 +-
 meta-ti-bsp/conf/machine/include/ti43x.inc    |  2 +-
 .../ti-sgx-ddk-km_1.17.4948957.bb             | 27 +++++-----
 .../recipes-graphics/mesa/mesa-pvr_22.3.5.bb  |  2 +-
 .../ti-sgx-ddk-um/pvrsrvkm.rules              |  1 -
 .../ti-sgx-ddk-um_1.17.4948957.bb             | 53 +++++++------------
 8 files changed, 37 insertions(+), 54 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um/pvrsrvkm.rules

-- 
2.42.0


