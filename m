Return-Path: <dfustini@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DACBC433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 03:09:28 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web12.68096.1656904160042336308
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 03 Jul 2022 20:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112
 header.b=iy3WbQAT;
 spf=pass (domain: baylibre.com, ip: 209.85.210.170,
 mailfrom: dfustini@baylibre.com)
Received: by mail-pf1-f170.google.com with SMTP id a15so7751480pfv.13
        for <meta-ti@lists.yoctoproject.org>;
 Sun, 03 Jul 2022 20:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6tOTksSx9by5eOqTxHeR4WxFTLfVvheBS5tgdihyZ+M=;
        b=iy3WbQATIEHuzCnhSQNHKut3KYDAitr8ng2qAJrK9ytSKKv6RL28Z5cFlKtlfUfZoi
         DoSS1sPKPz65Lzfj2oxef8eLTeBqXWUyvYcAhPvTMCkfIA9khqtPatVY7DcxABPrnJv9
         FEtWG7M1zIpp09g/voOTJIBO10hiH3drVlO0aV6U5dYDEBJekhj5KOlbaWemgRWPed7b
         L33P6jLIabPRnwYqoQpEVd7hyNQBfXINcctAnusERkpv+Sv+1MeK78UDKbr5FcoJc1vJ
         dGaq5W8AxBgjJ35nalh7wrUgxh2A/VzVdb/BEX0IRxaBu4iNUHUsSK1U8Is+11kN8Rwh
         1GSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6tOTksSx9by5eOqTxHeR4WxFTLfVvheBS5tgdihyZ+M=;
        b=zZ2P4Jm8ud2wLx0IjGb7T4gVmeAmdf7uKyY+H/bcqYDtenUetXBSGC0woa/O+Bzs8o
         f9ydmIM5lHdGIwCk4rDrINzl2+ZBsxLsToMZDFAM34t8e02WWbArToGXIURLv8RCJNkG
         PBKzPv5AZhoTNsumKM2MMOKqp7j8ncwsw6I+HuS92WitBsmnlvlhFjOss4FhIGQwwL12
         6eQN26bICzuhsxBVM781GTy7BWwX7QJN0uIMWV2u4CP/RlEz6MKbGUeftMcOEFpK2GjH
         5InK0QG9BFF39rlpK/IBii++iPVPS27skq9gjCNU0tAFZg1FM5pkS53HPGhMtnxasA9P
         zFnQ==
X-Gm-Message-State: AJIora96mtOW1GPkmeL/DQY6ObVkOpagGHMqoKb/PWinfRsRUS7FZFFT
	KpzNn3nRCzwiIx/tOG8AtE1vA3CumThn1A==
X-Google-Smtp-Source: 
 AGRyM1uEAqOUJmjdaOdGJRnhBOwDffctclZegw2JUthaeQ6P1TzPlthMjIJr6wpMcvbCI6Af8N81DA==
X-Received: by 2002:a63:e556:0:b0:412:3286:faaa with SMTP id
 z22-20020a63e556000000b004123286faaamr4259162pgj.192.1656904159099;
        Sun, 03 Jul 2022 20:09:19 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net
 ([2601:1c2:1001:7090:139e:6a0c:c997:d6a3])
        by smtp.gmail.com with ESMTPSA id
 m9-20020a17090a158900b001ef3daa0f21sm8203692pja.16.2022.07.03.20.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 20:09:18 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: meta-ti@lists.yoctoproject.org,
	Ryan Eatmon <reatmon@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH dunfell 0/3] fix ARAGO_BRAND=mainline builds
Date: Sun,  3 Jul 2022 20:06:06 -0700
Message-Id: <20220704030607.2292135-1-dfustini@baylibre.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 04 Jul 2022 03:09:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14868

Builds for ARAGO_BRAND=mainline are failing for the following machines:

  - dra7xx-evm
  - am57xx-evm
  - am437x-evm

This is beause the above machine configurations include files in their 
KERNEL_DEVICETREE variable that do not exist upstream. Therefore the
image creation task fails when it tries to copy device tree files that
do not exist.

This series of patches use '@oe.utils.conditional' to avoid adding those
device tree files to KERNEL_DEVICETREE when ARAGO_BRAND=mainline. Thus
the image create task is then able to complete successfully regardless
of which kernel recipe is being used.

Drew Fustini (3):
  conf: am57xx-evm: avoid missing dtb files when ARAGO_BRAND=mainline
  conf: dra7xx-evm: avoid missing dtb files when ARAGO_BRAND=mainline
  conf: am43: avoid missing dtb files when ARAGO_BRAND=mainline

 conf/machine/am57xx-evm.conf   | 6 +++---
 conf/machine/dra7xx-evm.conf   | 2 +-
 conf/machine/include/ti43x.inc | 6 ++++--
 3 files changed, 8 insertions(+), 6 deletions(-)

-- 
2.32.0


