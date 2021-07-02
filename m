Received: from egress-ip4b.ess.de.barracuda.com (egress-ip4b.ess.de.barracuda.com [18.185.115.208])
 by mx.groups.io with SMTP id smtpd.web10.6946.1625216266153595007
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Jul 2021 01:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=mKoIeNqC;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.208, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200]) by mx-outbound16-142.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Fri, 02 Jul 2021 08:57:41 +0000
Received: by mail-pl1-f200.google.com with SMTP id e4-20020a170902ed84b029012948835151so641137plj.15
        for <meta-ti@lists.yoctoproject.org>; Fri, 02 Jul 2021 01:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DNWLX/aI6yBQN8sr1LvD5lXPhTGdkpReWTUSFDIXE5E=;
        b=mKoIeNqCaGGl7O6sxfAiI+fYX5xNl6O7Bd9BXZXsNE5xC/urP/L1JlTUqGNLiWxyaJ
         63lzpwtYZIELkTCgnj7aWFyAd1MPOFOT4dtoxusvlk2kbtRK4GXLNh4aArkhxf1syXmL
         YliVLCpEvCVvqXRQaz5AEHxBZ5x/2zrxLc6M0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DNWLX/aI6yBQN8sr1LvD5lXPhTGdkpReWTUSFDIXE5E=;
        b=rZWo46FQsqZRK056GTTry5baZ7wfdliH6k1UaHyiA1vA58Rb/p76Fjz6e4p0IaChrT
         sprLTzgDjFpLLcRfDlfeYnYeiXyo1OvS4h8ygjlaLOE1V8/4xPQdt8Ug9M9X45QXGgIA
         Kzt0+mU5MjZ3g/So4wOmXYY+wMt4SvzAwTaK3wARQbwjNX19zRgVRABQtyESwp0Yvlhu
         8xj0IT3UaSPUfDQHozugXoPWJBpTKfeUl9x5aJGJJ/EFRPU/UkSewU82/GURQXjsPfOq
         oSRkQR7YD7rDf0jBBtmZZP4KB+W1juym36F6z3da7Ieo+GHUniDWkVdMYypPjucu6vZZ
         62+Q==
X-Gm-Message-State: AOAM531DY+Vz2tR2DYPkAM1DgSpu2WZHxck4K8xJxbpc6BRLr0ScJd45
	u4cXbhLjP9DIFaLMBBjfG5RSNGqs1llfbWfxw9ZwPI+oYR4K9zFRQ8G3n8jEPvyshf3nRM2uZDG
	d07juyZ2YMesGNttr3Ubhji0+bZQwgaVB/sU+x/VAXTFEo4d492BRjiZGtJDZloo=
X-Received: by 2002:a17:90a:fd93:: with SMTP id cx19mr14216136pjb.65.1625216260371;
        Fri, 02 Jul 2021 01:57:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylLgoP7qNAzVn6j/v2xq/kEowuWAd4W94j/4Ki7gyfTfUWX7nqFQPQsJQeZDIoz8l7L/Ua5A==
X-Received: by 2002:a17:90a:fd93:: with SMTP id cx19mr14216121pjb.65.1625216260065;
        Fri, 02 Jul 2021 01:57:40 -0700 (PDT)
Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id p6sm11694938pjk.37.2021.07.02.01.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 01:57:39 -0700 (PDT)
From: "Sinthu Raja M" <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: meta-ti@lists.yoctoproject.org
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Lokesh Vutla <lokeshvutla@ti.com>,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [dunfell/master PATCH V2] conf: j7-evm: Add j721e eaik dtb to KERNEL_DEVICETREE
Date: Fri,  2 Jul 2021 14:27:07 +0530
Message-Id: <20210702085707.1225-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-BESS-ID: 1625216261-304238-14750-32691-1
X-BESS-VER: 2019.1_20210701.1612
X-BESS-Apparent-Source-IP: 209.85.214.200
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.233330 [from 
	cloudscan13-245.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.50 BSF_RULE7568M          META: Custom Rule 7568M 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_RULE7568M, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Sinthu Raja <sinthu.raja@ti.com>

J721E EdgeAI Kit (EAIK) is a low cost, small form factor board designed
for TI’s J721E SoC. TI’s J721E SoC comprises of dual core A72, high
performance vision accelerators, video codec accelerators, latest C71x
and C66x DSP, high bandwidth real-time IPs for capture and display,
GPU, dedicated safety island and security accelerators.

J721E EAIK supports the following interfaces:
* 4 GB LPDDR4 RAM
* x1 Gigabit Ethernet interface
* x1 USB 3.0 Type-C port
* x3 USB 3.0 Type-A ports
* x1 PCIe M.2 E Key
* x1 PCIe M.2 M Key
* x2 CSI2 Camera interface (RPi and TI Camera connector)
* 40-pin Raspberry Pi compatible GPIO header

J721e EVM and EAIK uses the unified bootloader. Add j721e eaik dtb
for machine=j721e-evm

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>
---
Added Reviewed-by.
The U-boot and kernel patches are merged, this patch can be merged
once the SRCREV is updated to the latest commit in linux and u-boot
recipies.
V1 Patch link:
https://lists.yoctoproject.org/g/meta-ti/message/13857

 conf/machine/j7-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index 1b99baeb..3cf0f186 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -11,6 +11,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 KERNEL_DEVICETREE = " \
     ti/k3-j721e-common-proc-board.dtb \
+    ti/k3-j721e-eaik.dtb \
 "
 
 UBOOT_MACHINE = "j721e_evm_a72_config"
-- 
2.31.1

