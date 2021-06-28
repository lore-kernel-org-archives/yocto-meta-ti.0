Received: from egress-ip33b.ess.de.barracuda.com (egress-ip33b.ess.de.barracuda.com [18.185.115.237])
 by mx.groups.io with SMTP id smtpd.web10.153.1624909486192714702
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jun 2021 12:44:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=kFwwBSW+;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.237, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197]) by mx-outbound47-157.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 28 Jun 2021 19:44:43 +0000
Received: by mail-pf1-f197.google.com with SMTP id g17-20020a6252110000b029030423e1ef64so9908554pfb.18
        for <meta-ti@lists.yoctoproject.org>; Mon, 28 Jun 2021 12:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FhO10N/oc1WLgJkIdxuhYhGDfgzqRiQ666ZMM3m6pUs=;
        b=kFwwBSW+MOQooct9ddOmzwz5WCs5OQ+kMLnjk2XOvAS9YDkA5A7UZRe3zBsf4TJjnz
         urQPr3YvsX8h8IluLeKFwLpMyY3kxJDhnNKnUe07ifMjA8AgkWgiAh7F4gJ3km+5wTTO
         IigTv4YSZgSwSfaD8b8swV5T8VQbw6iB8iGGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FhO10N/oc1WLgJkIdxuhYhGDfgzqRiQ666ZMM3m6pUs=;
        b=jyFCcVy6eLpRpQH3wT5GWwCV9odS22MXeK9ObEXB0TKmh3ACdocTBU9bvyw1xSyExH
         XZXIatq6ViGCkrGtKGMyyndhfhHjK6CJVGtuNxVCN4q2MdvSpBnH8FWiXN7PxbZSTJHA
         BIxLOzXegaTecfPGNb4cymgNNMTO/daHIvHhD9HrQpjKadflLZnJtPebGcnditpTgYyG
         tiMyFW8xgiPeNexY6cfOwARO49Q53oHTBAbCIMMQSXHEMRfYngVd4f8EojSAFM8BRQFo
         yG0Op24UV3F0G+QXLpjlpTOUXsjEqztz7/9tAUgNRrdu1lbdovmiQwHmQT07POoayvQS
         a5BQ==
X-Gm-Message-State: AOAM532IDwqx3myBoEKB4YRO4k21m4IIC/DLzT8zxLWrStLm+6bqw47F
	mXJBj+BZEM+kyki2gwhODQTbyR3iZWOZDHyTVWQ52CJTOsAe/XqqqTCtZCWAj5mwFZwfrsRpWle
	ZNsjqEQY6tM5cAo9JZV9Wi8mBtlR/LHfZ55aaiLFVkA8Ngt/8i/Qtyxo5DjwaQsg=
X-Received: by 2002:a17:902:b095:b029:118:cfad:c536 with SMTP id p21-20020a170902b095b0290118cfadc536mr24160422plr.79.1624909482263;
        Mon, 28 Jun 2021 12:44:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOeW2+sLoY4nmSkDCk0XArVjYYyfzbU1YfoSUp3wXJ7YVVqmYPbukutz+MCQ0TvjFepwnP8g==
X-Received: by 2002:a17:902:b095:b029:118:cfad:c536 with SMTP id p21-20020a170902b095b0290118cfadc536mr24160407plr.79.1624909481986;
        Mon, 28 Jun 2021 12:44:41 -0700 (PDT)
Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from localhost.localdomain ([49.207.210.172])
        by smtp.gmail.com with ESMTPSA id w15sm338302pjg.32.2021.06.28.12.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 12:44:41 -0700 (PDT)
From: "Sinthu Raja M" <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: meta-ti@lists.yoctoproject.org
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Lokesh Vutla <lokeshvutla@ti.com>,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [dunfell/master PATCH] conf: j7-evm: Add j721e eaik dtb to KERNEL_DEVICETREE
Date: Tue, 29 Jun 2021 01:14:26 +0530
Message-Id: <20210628194426.5468-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-BESS-ID: 1624909482-312189-5496-14547-1
X-BESS-VER: 2019.1_20210623.1648
X-BESS-Apparent-Source-IP: 209.85.210.197
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.233249 [from 
	cloudscan10-138.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.50 BSF_RULE7568M          META: Custom Rule 7568M 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_RULE7568M, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
---
This patch should be merged once the J721e EAIK u-boot and kernel
patches are merged.

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

