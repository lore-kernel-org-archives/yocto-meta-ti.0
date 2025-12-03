Return-Path: <romain.naour@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D2DD12691
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 09:28:25 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11093.1764754096855949001
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Dec 2025 01:28:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3rYu0ZYK;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: romain.naour@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso3880555e9.0
        for <meta-ti@lists.yoctoproject.org>; Wed, 03 Dec 2025 01:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1764754095; x=1765358895; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:subject:to:content-language:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1XJrKYJ9oDIcv781dH+U4IIF6T05vycIBCLzoFDc+s=;
        b=3rYu0ZYKnDI46tho5ga3+k4Xytq7lbEVJISbmuDz2XfTZI74qUFbCHcrFAKoeu6MMu
         WOftJmAkoATlTEr/25ZLFgAitBaUDzYkyNxrOXEQcDhQsMUNFOkwRy+WqQHtpBtR3TCv
         +FwSdh7287Wa8cOghpklE8dJ9nnRNEFZ4rYKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764754095; x=1765358895;
        h=content-transfer-encoding:subject:to:content-language:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b1XJrKYJ9oDIcv781dH+U4IIF6T05vycIBCLzoFDc+s=;
        b=q/J9Qlabi5yfAVNW48MDuNiwNm4HxIVFSQD50ocKOg8GEvnlduuBb1567+Nbuejn9H
         X5lBeaJsRF2SehDFreBdjw4XSMiLN1Ds8BMSUX1FTYeP0fJ2q+T9W01jKz+G6w286do6
         D2REIqoILVzp7EqPjr8nvcaAILA0E4qFC0JrH/pcOoeCDsRH1zBx7H2RzfnWiphgiI2m
         +4W1JO4dc+PBhyTVW7vG6fpuBdDw1sVstkC+RCwxWmAK3qqf7K6iYEAmHkUDUw3GT1xr
         2e+OjOPr928btBm9/9nfEWj3uXKZMm0KEMA7/X1zcz7/SkDoUWJbV+K4BQipeXwaf1eG
         IYXg==
X-Gm-Message-State: AOJu0YyR8kSBNScTqAuMzL4dToRijhfU7P+HLwDa7jCoe96yyIgmUNSt
	ARD4b0iyeRjET5H1AtI5iWcMra0WDnb3V+IrHVbJaH2tZ0qRz1rvRWEq8lwxra1dTLoKEPt6Vi8
	HjMvy
X-Gm-Gg: ASbGncvvysADHeLrkrXPutmzF+ob8u1w8BwT87clizEnqc1gw6FrCnqizcx6lKIgKFW
	5o9PStW/CvI/pwXaSypU+awC24Lb6Pep0lY47SJ+0B2oYB+FkAfzC/QuadCxpYf93uk6+9a8Cr2
	2LK2sjvkyHRLSB2aBNT07ip/sf6jnVllpHv71XsVE7UwsEz+ltnyUbux3i5fLP6xJnPHh05Y8TQ
	4IlFII+yLOas9bJcsTz6Ui2L7QhffSUv20L7BGD79axXQtJFcYFQe3q/ppCODF1n34kmgEspZvx
	fKOntcOzDFFPJV6w93iJuB7a/gcOUylVkyTyQTyPjyTNRyrCZ5mkjs9GrL7Lvdm+tTLWHF5BiWZ
	Ba5v5kJEgCcJxzc8TxWNMrG6P2Eao9zRcyGADJnl4Js6i6G4hw1xOxSkSIX+vXNrK73dNCfXIgA
	1kLfg/OsENSYETLqS1bsWyFZOtrOfBZ2r8gXjTNdVLkzRdHH31Ww3UlX0ovUtcNZ66bEw+MOJPH
	W4=
X-Google-Smtp-Source: AGHT+IEYdEacrH1ahmdK8RqngKz1hR6rtI4k2Q+BBaYwflwMUKWVKPqvY1ELyi0tXopF0z7i0GijVw==
X-Received: by 2002:a05:600c:a105:b0:477:9890:4528 with SMTP id 5b1f17b1804b1-47926f75f2dmr45099375e9.2.1764754095115;
        Wed, 03 Dec 2025 01:28:15 -0800 (PST)
Received: from [10.5.90.21] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b14ad8bsm11350265e9.11.2025.12.03.01.28.14
        for <meta-ti@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 01:28:14 -0800 (PST)
Message-ID: <90f2cb30-35ff-48cf-a6a8-5edabca062be@smile.fr>
Date: Wed, 3 Dec 2025 10:28:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Romain Naour <romain.naour@smile.fr>
Content-Language: fr, en-US
To: meta-ti@lists.yoctoproject.org
Subject: [kirkstone] ti-linux-fw: c66x DSP firmware hang
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Dec 2025 09:28:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19322

Hello,

I noticed an issue on the latest version of meta-ti kirkstone branch with c66x
DSP firmwares generated with TI SDK
ti-processor-sdk-rtos-j721e-evm-09_02_00_05/pdk_jacinto_09_02_00_30.

Using a previously tested firmware, it now hang just after loading the firmware:

(using latest 6.1 kernel and u-boot 2024.04)

[  251.158951] remoteproc remoteproc0: powering up 4d80800000.dsp
[  251.164481] remoteproc remoteproc0: Booting fw image j7-c66_0-fw, size 2823456
[  251.169367] k3-dsp-rproc 4d80800000.dsp: booting DSP core using boot addr =
0xa6200400
[  251.169639] rproc-virtio rproc-virtio.10.auto: assigned reserved memory node
memory@a7000000
[  251.171611] virtio_rpmsg_bus virtio0: rpmsg host is online
[  251.171636] rproc-virtio rproc-virtio.10.auto: registered virtio0 (type 7)
[  251.171642] remoteproc remoteproc0: remote processor 4d80800000.dsp is now up
<missing the last expected line here>

Previously we had:

[  321.295771] remoteproc remoteproc0: powering up 4d80800000.dsp
[  321.301847] remoteproc remoteproc0: Booting fw image j7-c66_0-fw, size 2823456
[  321.306173] k3-dsp-rproc 4d80800000.dsp: booting DSP core using boot addr =
0xa6200400
[  321.306432] rproc-virtio rproc-virtio.10.auto: assigned reserved memory node
c66-dma-memory@a7000000
[  321.307341] virtio_rpmsg_bus virtio0: rpmsg host is online
[  321.307366] rproc-virtio rproc-virtio.10.auto: registered virtio0 (type 7)
[  321.307371] remoteproc remoteproc0: remote processor 4d80800000.dsp is now up
[  321.694522] virtio_rpmsg_bus virtio0: creating channel rpmsg_chrdev addr 0xe
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The regression seems to be related to ti-linux-fw firmwares update on kirkstone
"stable" branch on 10-2024 (part of 09.03.06 release) [1].

    RC Release 09.03.06

    -TI_DM_FW_VERSION = "09.02.04"
    -TI_SYSFW_VERSION = "09.02.08"
    +TI_DM_FW_VERSION = "10.01.03"
    +TI_SYSFW_VERSION = "10.01.08"

Test with a Yocto image with TI 10.x firmwares:
U-Boot SPL 2024.04-ti-gd99b8f5340a4 (Nov 25 2025 - 13:52:57 +0000)
SYSFW ABI: 4.0 (firmware rev 0x000a '10.1.6--v10.01.06 (Fiery Fox)')

DSP firmware hang.

Test with a Yocto image using TI 9.2 firmwares:
U-Boot SPL 2024.04-ti-gfbb28db1443 (Dec 02 2025 - 13:31:32 +0100)
SYSFW ABI: 3.1 (firmware rev 0x0009 '9.2.4--v09.02.04 (Kool Koala)')

DSP firmware start as expected.

The ti-linux-fw 10.x seems to requires the c66x DSP firmware to be built with TI
SDK 10 (Yocto scarthgap) while we were using the TI SDK 9 (Yocto kirkstone).

As a workaround, I had to revert the ti-linux-fw recipe to the latest working
version. Revert generated using:

git checkout 490da1ca76b48a118d6b20873aaa1ec5bce4b2d4
meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc

[1]
https://git.yoctoproject.org/meta-ti/commit/?h=kirkstone&id=62c537a43466070ee24c99f5c4072f0b99ed38cd
[2] https://www.ti.com/tool/download/PROCESSOR-SDK-RTOS-J721E

Best regards,
Romain


