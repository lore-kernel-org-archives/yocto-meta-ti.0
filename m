Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F0EC636D7
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 18:36:26 +0000 (UTC)
Received: from egress-ip4a.ess.de.barracuda.com (egress-ip4a.ess.de.barracuda.com [18.184.203.227])
 by mx.groups.io with SMTP id smtpd.web11.6592.1675881380969907951
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 10:36:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=P+oNXQkm;
 spf=pass (domain: mistralsolutions.com, ip: 18.184.203.227, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197]) by mx-outbound12-202.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 08 Feb 2023 18:36:18 +0000
Received: by mail-pg1-f197.google.com with SMTP id 84-20020a630257000000b00477f88d334eso8616769pgc.11
        for <meta-ti@lists.yoctoproject.org>; Wed, 08 Feb 2023 10:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wrw7q0sP8JmJOmsoHzYUY9fb6uF5CBWmuecdzFxHwIg=;
        b=P+oNXQkmhSu+4TU8GJUy2Y8F0l0Q7/Vw2yo9i3IHEVHKjXcsKiSGTcOERL+oCepUqJ
         VjeNtp1GdnTwot7uOGblLOnGB0J81QFha3YmwRLudgF83XxH/8eflKT/GMUKQafn5c00
         an7wgfhhwac6wCqdld73itNeUWHpqj6Tnl/B4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wrw7q0sP8JmJOmsoHzYUY9fb6uF5CBWmuecdzFxHwIg=;
        b=Y0DrL9sIFQkzg8+gF78cJcQLGgLHAzi75UYLcz/VdZRk2/GAVG1DiHyU4Aca8STdZU
         qJZuzaZvQsk4OJowdFQ8yzry4y+q+/e97ff4JRA7LzDYt12MODl+jeZP6Dc9+r72OU9r
         xX9Qo6LRSrV22A2iNI0HSHueJvyjP6r7QBAcqeagAVCW+qGmLGL2Aov0cnFxgcg3RLOW
         lf3ciAkHY3cFEx1piTg2f7ml2PBdfpsVpcjS+BAOXBHW9oxGGJFqNHEKd9IpS5KDTaT6
         eRp2t/rTB/RGbaA29IJQNMI6lCuxfJx7JwRZW4AMZj8U4yeHlzv7snQF4g/OdWzUPf6U
         tmeg==
X-Gm-Message-State: AO0yUKUrYrh0nwxqDibGvoZQcECh9V42KkZeqwNe5raxpTl8STDcLkka
	ebLXoUqChckPippPbOeqMs6WoRh5JG+MzLPH9452LABgotKMC2cbSW/yIdxzjDYcJiIpUlRUGiY
	PMvfspkOEWVz7/HuuY6tm1n0HU0raY30ZiQ/SamA1bK2qh0ENOvjkr3c0m9+7kRw=
X-Received: by 2002:aa7:9611:0:b0:5a8:16b7:ce6e with SMTP id q17-20020aa79611000000b005a816b7ce6emr2505158pfg.10.1675881375750;
        Wed, 08 Feb 2023 10:36:15 -0800 (PST)
X-Google-Smtp-Source: AK7set8j4+yaMoID3OjFjDhhlAojdKcFjb2RNnacnGyYQmTh/8QWA/ZPMfJL8AivsfqRAnNq7C4TKg==
X-Received: by 2002:aa7:9611:0:b0:5a8:16b7:ce6e with SMTP id q17-20020aa79611000000b005a816b7ce6emr2505143pfg.10.1675881375280;
        Wed, 08 Feb 2023 10:36:15 -0800 (PST)
Received: from localhost.localdomain ([49.207.192.120])
        by smtp.gmail.com with ESMTPSA id q22-20020aa79836000000b0058b927b9653sm11863718pfl.92.2023.02.08.10.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 10:36:14 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	denys@ti.com,
	detheridge@ti.com
Cc: meta-ti@lists.yoctoproject.org,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-ti][dunfell][PATCH] conf: machine: j721s2: Add DTB and DTBO load address for FIT image
Date: Thu,  9 Feb 2023 00:06:08 +0530
Message-Id: <20230208183608.2589-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1675881377-303274-6188-30285-1
X-BESS-VER: 2019.1_20230201.1831
X-BESS-Apparent-Source-IP: 209.85.215.197
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.246008 [from 
	cloudscan9-35.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status: 1
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Feb 2023 18:36:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15754

From: Sinthu Raja <sinthu.raja@ti.com>

Now the J721S2 defconfig is merged for both GP and HS-FS devices, the
HS-FS devices use FIT image to load the kernel and DTB. However, the
DTB/DTBOs are added to the FIT image, but the load address is not added
in the image section of each DTB/DTBOs. This load address is calculated
based on the LOADADDRESS macros in kernel-fitmage class.

Therefore add the DTB/DTBOs load address and offset macros in J721S2 conf.
This conf is common to both GP and HS-FS devices

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---

Hi All,
This patch resolves the overlay loading issue using name_overlay. This
is not yet tested and will test tomorrow. 

 conf/machine/j721s2-evm.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
index f1127ed5..2db6c087 100644
--- a/conf/machine/j721s2-evm.conf
+++ b/conf/machine/j721s2-evm.conf
@@ -40,6 +40,9 @@ KERNEL_DEVICETREE = " \
 "
 
 UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
+UBOOT_DTB_LOADADDRESS =  "0x83000000"
+UBOOT_DTBO_LOADADDRESS = "0x83080000"
+UBOOT_DTBO_OFFSET =      "0x00010000"
 
 do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-- 
2.36.1


