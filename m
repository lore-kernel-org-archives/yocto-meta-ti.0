Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.415.1636079129397244326
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Nov 2021 19:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=INBnVjc4;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1A52PKAD024225;
	Thu, 4 Nov 2021 21:25:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1636079120;
	bh=+OUZZ6IWdJD2QCvFVr5RN3F+2/kiyjKZlPKtXJua4e4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=INBnVjc4sTfcL58fe0qp62mIE9GKv2kg3wmuBWHu+sHl5HsS8QSW+vGk4BVnsQV7X
	 zTzHQGPxrT0Fbse4qKro9g2dRKkdwrNS3Ha0FMzf0cgjOVLsjVQTEQpGUQDzZ1cxNC
	 Bgx+0D4fsdiTMEPzIrWjZegxNQVL/DPNdlVtQjgY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1A52PKmQ021089
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Nov 2021 21:25:20 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 4
 Nov 2021 21:25:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 4 Nov 2021 21:25:20 -0500
Received: from [10.250.38.249] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1A52PKZI118975;
	Thu, 4 Nov 2021 21:25:20 -0500
Message-ID: <bd5a7b4b-d8f5-008d-acec-e9c8bb6e81d7@ti.com>
Date: Thu, 4 Nov 2021 21:25:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [meta-ti] [master][PATCH 00/22] Sync up with Dunfell
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
References: <16B383101A550137.21702@lists.yoctoproject.org>
 <20211104175557.GX10132@denix.org>
From: "Yogesh Siraswar" <yogeshs@ti.com>
In-Reply-To: <20211104175557.GX10132@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/4/2021 12:55 PM, Denys Dmytriyenko wrote:
> Ping

Denys, I did try to apply the series. But there were errors.
Didn't get chance to look. Will get back tomorrow.

> 
> On Mon, Nov 01, 2021 at 03:32:50PM -0400, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@konsulko.com>
>>
>> Keep master up to date with latest changes in Dunfell, adjust to the new
>> override syntax.
>>
>> Denys Dmytriyenko (1):
>>    powervr-drivers: teach modules_install to respect "usrmerge" distro
>>      feature
>>
>> Hari Nagalla (2):
>>    ipc: ti-rpmsg-char: Update library to 0.3.1
>>    ti-rtos-firmware: Update M4F binary for AM64x SoCs
>>
>> Nick Saulnier (1):
>>    pru-icss_git.bb: add AM64x, update to PSSP v6.0.0
>>
>> Sinthu Raja (1):
>>    conf: j7-evm: Replace eaik dtb with sk to KERNEL_DEVICETREE
>>
>> Tom Rini (2):
>>    conf/machine: k3: Enable grub-efi by default in wic images
>>    conf: Add extlinux.conf support on some 32bit platforms
>>
>> Vignesh Raghavedra (1):
>>    prusw-fw-am65x-sr2: Add recipe for ICSSG Switch mode firmware for
>>      AM65x SR2.0
>>
>> Yogesh Siraswar (14):
>>    linux-ti-staging: Update SRCREV to 5.10.65
>>    linux-ti-staging-rt: Update SRCREV to 5.10.65
>>    conf: omap-a15: fix the dtb file path for extlinux boot
>>    conf: dra7xx-evm: ReIntroduce existent dtb* for 5.10
>>    conf: am57xx-evm: ReIntroduce existent dtb* for 5.10
>>    ti-linux-fw: Support common inc for all firmware
>>    ti-linux-fw: AUTOREV support for ti-linux-fw
>>    ti-sci-fw_git: Fix issue with using gp*.bin for TISCI firmware
>>    linux-ti-staging: Bump linux version to latest
>>    linux-ti-staging-rt: Bump linux rt version to latest
>>    ti-linux-fw: Bump to 08.01.00.001 release
>>    u-boot-ti-staging: Bump to 08.01.00.001 release
>>    linux-ti-staging-rt: Bump to 08.01.00.001 release
>>    linux-ti-staging: Bump to 08.01.00.001 release
>>
>>   conf/machine/am57xx-evm.conf                       |  6 +-
>>   conf/machine/dra7xx-evm.conf                       |  8 +++
>>   conf/machine/include/k3.inc                        |  6 +-
>>   conf/machine/include/omap-a15.inc                  | 13 ++++-
>>   conf/machine/include/ti33x.inc                     | 11 +++-
>>   conf/machine/include/ti43x.inc                     | 11 +++-
>>   conf/machine/j7-evm.conf                           |  2 +-
>>   recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb | 11 ++--
>>   recipes-bsp/goodix-fw/goodix-fw_git.bb             | 11 ++--
>>   recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb         | 12 +---
>>   recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb         | 12 +---
>>   .../ti-img-rogue-driver_1.13.5776728.bb            |  2 +-
>>   .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb  |  4 +-
>>   recipes-bsp/pru/pru-icss_git.bb                    | 64 +++++++++++++++++++++-
>>   recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb   | 11 +---
>>   recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb       | 11 +---
>>   recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb          | 10 +---
>>   recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb         | 10 +---
>>   recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb         | 10 +---
>>   recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb     | 34 ++++++++++++
>>   recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb             | 10 +---
>>   recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb       | 11 ++--
>>   recipes-bsp/serdes-fw/serdes-fw_git.bb             | 10 ++--
>>   recipes-bsp/ti-linux-fw/ti-linux-fw.inc            | 43 +++++++++++++++
>>   recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb      |  2 +-
>>   recipes-bsp/ti-sci-fw/ti-sci-fw.inc                | 32 -----------
>>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb             |  7 ++-
>>   recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb    |  4 +-
>>   recipes-kernel/linux/kernel-rdepends.inc           |  2 +-
>>   recipes-kernel/linux/linux-ti-staging-rt_5.10.bb   |  4 +-
>>   recipes-kernel/linux/linux-ti-staging_5.10.bb      |  4 +-
>>   recipes-ti/ipc/ti-rpmsg-char.inc                   |  6 +-
>>   recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb         |  8 ++-
>>   wic/sdimage-2part-efi.wks                          |  7 +++
>>   34 files changed, 258 insertions(+), 151 deletions(-)
>>   create mode 100644 recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
>>   create mode 100644 recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>   delete mode 100644 recipes-bsp/ti-sci-fw/ti-sci-fw.inc
>>   create mode 100644 wic/sdimage-2part-efi.wks
>>
>> -- 
>> 2.7.4
>>
>>
>>
>> 
>>
