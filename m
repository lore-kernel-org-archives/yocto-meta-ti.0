Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4231CC77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 10:19:02 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.16775.1682590732900265925
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 03:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=trhCSxCe;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: p-bhagat@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33RAImEo113798;
	Thu, 27 Apr 2023 05:18:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682590728;
	bh=o3qsYGsan07SBStrwPPXVf/1ZvAHYDNTYWQSZl4EScg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=trhCSxCedUFnvEPVJ1wEnuGD8tzObj5DiwGvRw7g/bUpOf7TzbuRYJahqgNNHP8R8
	 VQWp/RAR4OP3DJKC4PZ2o6GK7LUtdkP4aTd2Nia0LFy6zlwEvu+EhOHkoyF0oFAKxY
	 jE9s8Ejdg/5/H62fusbz3hliyHHHnEs233y2mqoM=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33RAImcQ014578
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Apr 2023 05:18:48 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Apr 2023 05:18:47 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Apr 2023 05:18:47 -0500
Received: from [172.24.145.229] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33RAIi3j053379;
	Thu, 27 Apr 2023 05:18:45 -0500
Message-ID: <2408143c-9d15-e8d6-7797-9ae49cca1ad2@ti.com>
Date: Thu, 27 Apr 2023 15:48:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [EXTERNAL] Re: [meta-ti] [kirkstone][PATCH v2] recipes-ti: Add
 recipe and patches for jailhouse
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>,
        <c-shilwant@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>,
        <dannenberg@ti.com>
References: <20230426120608.17812-1-p-bhagat@ti.com>
 <20230427003747.GJ9226@denix.org>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <20230427003747.GJ9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Apr 2023 10:19:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16440

Hi Denys,

On 27/04/23 06:07, Denys Dmytriyenko wrote:
> First and foremost question - what are the long-term plans for Jailhouse in
> meta-ti? Is it going to be just a single am62 platform? Reason being is this:
>
> https://git.yoctoproject.org/meta-ti/commit/?id=d8e96545f10bd2057b665a1e0c363f60f0a8cda5

Currently we are adding jailhouse support for am62x . Long term plan is 
to also add jailhouse support for am64 and am62a.


Regards,

Paresh

>
> On Wed, Apr 26, 2023 at 05:36:08PM +0530, Paresh Bhagat via lists.yoctoproject.org wrote:
>> Add and enable Jailhouse support for TI's k3-am625-sk similarly to how other
>> TI platforms were added and enabled in the past by adding platform-specific
>> configuration variables for the root cell DTB overlay, and the Linux demo inmate
>> DTB, configuration, and Kernel command line settings.
>>
>> Migrate the jailhouse recipe to kirkstone from dunfell.
>>
>> Switch to latest upstream source tree for jailhouse. The TI Jailhouse repo has
>> gone stale and now upstream is really the happening place where new development
>> happens including for new devices such as AM62x. Hence go ahead and switch to
>> using the upstream repo.
>>
>> Enable additional console on ttyS3 (usually mapped to main_uart1) and ttyS2 for
>> the Linux demo inmate to use.
>>
>> Add patches for the Jailhouse source tree for am62xx.
>>
>> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
>> Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
>> Signed-off-by: paresh-ti <p-bhagat@ti.com>
>> ---
>>   meta-ti-bsp/conf/machine/include/am62xx.inc   |   3 +
>>   ...k3-am625-sk-Add-crypto-memory-region.patch |  53 +++++
>>   ...001-configs-k3-use-intx-for-bar_mask.patch |  73 ++++++
>>   ...-am625-sk-Switch-inmate-boot-console.patch |  63 ++++++
>>   ...64-k3-am625-sk-Add-VTM-memory-region.patch |  54 +++++
>>   ...4-k3-am625-sk-Add-GPMC-memory-region.patch |  52 +++++
>>   .../recipes-ti/jailhouse/jailhouse-arch.inc   |  22 ++
>>   .../recipes-ti/jailhouse/jailhouse_git.bb     | 209 ++++++++++++++++++
>>   8 files changed, 529 insertions(+)
>>   create mode 100644 meta-ti-extras/recipes-ti/jailhouse/files/0001-configs-arm64-k3-am625-sk-Add-crypto-memory-region.patch
>>   create mode 100644 meta-ti-extras/recipes-ti/jailhouse/files/0001-configs-k3-use-intx-for-bar_mask.patch
>>   create mode 100644 meta-ti-extras/recipes-ti/jailhouse/files/0002-configs-arm64-k3-am625-sk-Switch-inmate-boot-console.patch
>>   create mode 100644 meta-ti-extras/recipes-ti/jailhouse/files/0003-configs-arm64-k3-am625-sk-Add-VTM-memory-region.patch
>>   create mode 100644 meta-ti-extras/recipes-ti/jailhouse/files/0004-configs-arm64-k3-am625-sk-Add-GPMC-memory-region.patch
>>   create mode 100644 meta-ti-extras/recipes-ti/jailhouse/jailhouse-arch.inc
>>   create mode 100644 meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
>> index 623d90eb..a205a18c 100644
>> --- a/meta-ti-bsp/conf/machine/include/am62xx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
>> @@ -23,3 +23,6 @@ TFA_BOARD = "lite"
>>   TFA_K3_SYSTEM_SUSPEND = "1"
>>   
>>   OPTEEMACHINE = "k3-am62x"
>> +
>> +# Normally AM62 boards use ttyS2, but our Jailhouse inmate may use ttyS3, so try both
>> +SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
>> diff --git a/meta-ti-extras/recipes-ti/jailhouse/files/0001-configs-arm64-k3-am625-sk-Add-crypto-memory-region.patch b/meta-ti-extras/recipes-ti/jailhouse/files/0001-configs-arm64-k3-am625-sk-Add-crypto-memory-region.patch
>> new file mode 100644
>> index 00000000..deafa829
>> --- /dev/null
>> +++ b/meta-ti-extras/recipes-ti/jailhouse/files/0001-configs-arm64-k3-am625-sk-Add-crypto-memory-region.patch
>> @@ -0,0 +1,52 @@
>> +From 723ca87d25c1f8bac68d2608dbc3b5e8caba69ca Mon Sep 17 00:00:00 2001
>> +From: Andreas Dannenberg <dannenberg@ti.com>
>> +Date: Mon, 12 Sep 2022 13:22:04 -0500
>> +Subject: [PATCH] configs: arm64: k3-am625-sk: Add crypto memory region
>> +
>> +Add the memory region for the AM62x crypto accelerator to the device-
>> +specific config file. This fixes a runtime exception when the kernel
>> +accesses that memory region:
>> +
>> +<snip>
>> +Unhandled data read at 0x40910010(4)
>> +
>> +FATAL: unhandled trap (exception class 0x24)
>> +<snip>
>> +
>> +Upstream-Status: Submitted
> While optional, it is recommended to provide a link to the submission upstream
>
> Submitted [where]
>    - Submitted to upstream, waiting approval
>    - Optionally include where it was submitted, such as the author, mailing
>      list, etc.
>
>
>> +Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
>> +Signed-off-by: paresh-ti <p-bhagat@ti.com>
>> +---
>> + configs/arm64/k3-am625-sk.c | 9 ++++++++-
>> + 1 file changed, 8 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/configs/arm64/k3-am625-sk.c b/configs/arm64/k3-am625-sk.c
>> +index 2e5c3aef..4b0b8043 100644
>> +--- a/configs/arm64/k3-am625-sk.c
>> ++++ b/configs/arm64/k3-am625-sk.c
>> +@@ -18,7 +18,7 @@
>> + struct {
>> +	struct jailhouse_system header;
>> +	__u64 cpus[1];
>> +-	struct jailhouse_memory mem_regions[31];
>> ++	struct jailhouse_memory mem_regions[32];
>> +	struct jailhouse_irqchip irqchips[5];
>> +	struct jailhouse_pci_device pci_devices[2];
>> + } __attribute__((packed)) config = {
>> +@@ -231,6 +231,13 @@ struct {
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> ++		/* CRYPTO */ {
>> ++			.phys_start = 0x40900000,
>> ++			.virt_start = 0x40900000,
>> ++			.size = 0x0030000,
>> ++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> ++				JAILHOUSE_MEM_IO,
>> ++		},
>> +		/* First Wake Up Domain */ {
>> +			.phys_start = 0x2b000000,
>> +			.virt_start = 0x2b000000,
>> +--
>> +2.34.1
>> diff --git a/meta-ti-extras/recipes-ti/jailhouse/files/0001-configs-k3-use-intx-for-bar_mask.patch b/meta-ti-extras/recipes-ti/jailhouse/files/0001-configs-k3-use-intx-for-bar_mask.patch
>> new file mode 100644
>> index 00000000..da852293
>> --- /dev/null
>> +++ b/meta-ti-extras/recipes-ti/jailhouse/files/0001-configs-k3-use-intx-for-bar_mask.patch
>> @@ -0,0 +1,72 @@
>> +From 84ea5e9f65fc8082d520267258784cae32c8b499 Mon Sep 17 00:00:00 2001
>> +From: Ricardo Salveti <ricardo@foundries.io>
>> +Date: Wed, 1 Mar 2023 22:14:35 -0300
>> +Subject: [PATCH] configs/k3: use intx for bar_mask
>> +
>> +Fixes pci probe failure:
>> +
>> +[   46.795840] pci 0001:00:00.0: BAR 0: no space for [mem size 0x00010000]
>> +[   46.802516] pci 0001:00:00.0: BAR 0: failed to assign [mem size 0x00010000]
>> +[   46.809512] pci 0001:00:01.0: BAR 0: no space for [mem size 0x00010000]
>> +[   46.816158] pci 0001:00:01.0: BAR 0: failed to assign [mem size 0x00010000]
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
>> +
>> +This patch was imported from foundriesio/meta-lmp
>> +(https://github.com/foundriesio/meta-lmp) as of commit id
>> +70d419bfd54a99d3591e5a22622fc67f7de82b94.
>> +
>> +Signed-off-by: paresh-ti <p-bhagat@ti.com>
>> +---
>> + configs/arm64/k3-am625-sk-linux-demo.c | 4 ++--
>> + configs/arm64/k3-am625-sk.c            | 4 ++--
>> + 2 files changed, 4 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/configs/arm64/k3-am625-sk-linux-demo.c b/configs/arm64/k3-am625-sk-linux-demo.c
>> +index 6dac8859..dcc5f026 100644
>> +--- a/configs/arm64/k3-am625-sk-linux-demo.c
>> ++++ b/configs/arm64/k3-am625-sk-linux-demo.c
>> +@@ -197,7 +197,7 @@ struct {
>> +		/* 00:00.0 */ {
>> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> +			.bdf = 0 << 3,
>> +-			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
>> ++			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>> +			.shmem_regions_start = 0,
>> +			.shmem_dev_id = 2,
>> +			.shmem_peers = 3,
>> +@@ -206,7 +206,7 @@ struct {
>> +		/* 00:01.0 */ {
>> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> +			.bdf = 1 << 3,
>> +-			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
>> ++			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>> +			.shmem_regions_start = 5,
>> +			.shmem_dev_id = 1,
>> +			.shmem_peers = 2,
>> +diff --git a/configs/arm64/k3-am625-sk.c b/configs/arm64/k3-am625-sk.c
>> +index 69ab12a4..dcea42e0 100644
>> +--- a/configs/arm64/k3-am625-sk.c
>> ++++ b/configs/arm64/k3-am625-sk.c
>> +@@ -325,7 +325,7 @@ struct {
>> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> +			.domain = 1,
>> +			.bdf = 0 << 3,
>> +-			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
>> ++			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>> +			.shmem_regions_start = 0,
>> +			.shmem_dev_id = 0,
>> +			.shmem_peers = 3,
>> +@@ -335,7 +335,7 @@ struct {
>> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> +			.domain = 1,
>> +			.bdf = 1 << 3,
>> +-			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
>> ++			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>> +			.shmem_regions_start = 5,
>> +			.shmem_dev_id = 0,
>> +			.shmem_peers = 2,
>> +--
>> +2.34.1
>> diff --git a/meta-ti-extras/recipes-ti/jailhouse/files/0002-configs-arm64-k3-am625-sk-Switch-inmate-boot-console.patch b/meta-ti-extras/recipes-ti/jailhouse/files/0002-configs-arm64-k3-am625-sk-Switch-inmate-boot-console.patch
>> new file mode 100644
>> index 00000000..00971685
>> --- /dev/null
>> +++ b/meta-ti-extras/recipes-ti/jailhouse/files/0002-configs-arm64-k3-am625-sk-Switch-inmate-boot-console.patch
>> @@ -0,0 +1,62 @@
>> +From dbc02104bb469f68034b84f293583df413b8ca56 Mon Sep 17 00:00:00 2001
>> +From: Andreas Dannenberg <dannenberg@ti.com>
>> +Date: Mon, 12 Sep 2022 16:08:12 -0500
>> +Subject: [PATCH] configs: arm64: k3-am625-sk: Switch inmate boot console alias
>> + to serial3
>> +
>> +Traditionally the serial3 DTS alias is used for the 2nd main-domain UART
>> +on K3 devices so go ahead and update the alias and its usage accordingly
>> +for better consistency.
>> +
>> +While at it also do a minor cleanup of the UART's DTS node to use the
>> +TISCI standard definitions as used in the corresponding Kernel DTS files.
>> +
>> +Upstream-Status: Submitted
> Same comment - for traceability it is very useful to point to the actual
> submission.
>
>
>> +Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
>> +Signed-off-by: paresh-ti <p-bhagat@ti.com>
>> +---
>> + configs/arm64/dts/inmate-k3-am625-sk.dts | 11 ++++++-----
>> + 1 file changed, 6 insertions(+), 5 deletions(-)
>> +
>> +diff --git a/configs/arm64/dts/inmate-k3-am625-sk.dts b/configs/arm64/dts/inmate-k3-am625-sk.dts
>> +index c1455073..8e1bebb8 100644
>> +--- a/configs/arm64/dts/inmate-k3-am625-sk.dts
>> ++++ b/configs/arm64/dts/inmate-k3-am625-sk.dts
>> +@@ -1,6 +1,7 @@
>> + /dts-v1/;
>> +
>> + #include <dt-bindings/interrupt-controller/arm-gic.h>
>> ++#include <dt-bindings/soc/ti,sci_pm_domain.h>
>> +
>> + / {
>> +	model = "Texas Instruments AM625 Inmate Model";
>> +@@ -10,11 +11,11 @@
>> +	#size-cells = <2>;
>> +
>> +	aliases {
>> +-		serial1 = &main_uart1;
>> ++		serial3 = &main_uart1;
>> +	};
>> +
>> +	chosen {
>> +-		stdout-path = "serial1:115200n8";
>> ++		stdout-path = "serial3:115200n8";
>> +	};
>> +
>> +	memory@e0000000 {
>> +@@ -91,9 +92,9 @@
>> +			compatible = "ti,am64-uart", "ti,am654-uart";
>> +			reg = <0x00 0x02810000 0x00 0x100>;
>> +			interrupts = <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
>> +-			power-domains = <&k3_pds 152 1>;
>> +-			current-speed = <115200>;
>> +-			clock-frequency = <48000000>;
>> ++			power-domains = <&k3_pds 152 TI_SCI_PD_EXCLUSIVE>;
>> ++			clocks = <&k3_clks 152 0>;
>> ++			clock-names = "fclk";
>> +		};
>> +
>> +		pci@76000000 {
>> +--
>> +2.34.1
>> diff --git a/meta-ti-extras/recipes-ti/jailhouse/files/0003-configs-arm64-k3-am625-sk-Add-VTM-memory-region.patch b/meta-ti-extras/recipes-ti/jailhouse/files/0003-configs-arm64-k3-am625-sk-Add-VTM-memory-region.patch
>> new file mode 100644
>> index 00000000..815e36c9
>> --- /dev/null
>> +++ b/meta-ti-extras/recipes-ti/jailhouse/files/0003-configs-arm64-k3-am625-sk-Add-VTM-memory-region.patch
>> @@ -0,0 +1,53 @@
>> +From 9c9bba78b5635531fc8946914233af8c8ac8a6f3 Mon Sep 17 00:00:00 2001
>> +From: Andreas Dannenberg <dannenberg@ti.com>
>> +Date: Fri, 4 Nov 2022 12:58:48 -0500
>> +Subject: [PATCH] configs: arm64: k3-am625-sk: Add VTM memory region
>> +
>> +Add the memory region for VTM to the device-specific config
>> +file. This fixes a runtime exception when the kernel accesses
>> +that memory region:
>> +
>> +<snip>
>> +Unhandled data read at 0xb00308(4)
>> +
>> +FATAL: unhandled trap (exception class 0x24)
>> +<snip>
>> +
>> +Upstream-Status: Submitted
> And here
>
>
>> +written by: Ricardo Salveti <ricardo@foundries.io>
>> +Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
>> +Signed-off-by: paresh-ti <p-bhagat@ti.com>
>> +---
>> + configs/arm64/k3-am625-sk.c | 9 ++++++++-
>> + 1 file changed, 8 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/configs/arm64/k3-am625-sk.c b/configs/arm64/k3-am625-sk.c
>> +index 4b0b8043..fac4eaa6 100644
>> +--- a/configs/arm64/k3-am625-sk.c
>> ++++ b/configs/arm64/k3-am625-sk.c
>> +@@ -18,7 +18,7 @@
>> + struct {
>> +	struct jailhouse_system header;
>> +	__u64 cpus[1];
>> +-	struct jailhouse_memory mem_regions[32];
>> ++	struct jailhouse_memory mem_regions[33];
>> +	struct jailhouse_irqchip irqchips[5];
>> +	struct jailhouse_pci_device pci_devices[2];
>> + } __attribute__((packed)) config = {
>> +@@ -154,6 +154,13 @@ struct {
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> ++		/* Wake Up Domain VTM0 */ {
>> ++			.phys_start = 0x00b00000,
>> ++			.virt_start = 0x00b00000,
>> ++			.size = 0x00001000,
>> ++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> ++				JAILHOUSE_MEM_IO,
>> ++		},
>> +		/* First peripheral window, 1 of 2 */ {
>> +			.phys_start = 0x01000000,
>> +			.virt_start = 0x01000000,
>> +--
>> +2.34.1
>> diff --git a/meta-ti-extras/recipes-ti/jailhouse/files/0004-configs-arm64-k3-am625-sk-Add-GPMC-memory-region.patch b/meta-ti-extras/recipes-ti/jailhouse/files/0004-configs-arm64-k3-am625-sk-Add-GPMC-memory-region.patch
>> new file mode 100644
>> index 00000000..ec6ec617
>> --- /dev/null
>> +++ b/meta-ti-extras/recipes-ti/jailhouse/files/0004-configs-arm64-k3-am625-sk-Add-GPMC-memory-region.patch
>> @@ -0,0 +1,51 @@
>> +From c0e85959637a1de61170d1025e1bac8da283ddb9 Mon Sep 17 00:00:00 2001
>> +From: Andreas Dannenberg <dannenberg@ti.com>
>> +Date: Thu, 19 Jan 2023 09:43:55 -0600
>> +Subject: [PATCH] configs: arm64: k3-am625-sk: Add GPMC memory region
>> +
>> +Add the memory region for GPMC, used by the AM62Q NAND card.
>> +
>> +Upstream-Status: Submitted
> And here
>
>
>> +Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
>> +Signed-off-by: paresh-ti <p-bhagat@ti.com>
>> +---
>> + configs/arm64/k3-am625-sk.c | 16 +++++++++++++++-
>> + 1 file changed, 15 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/configs/arm64/k3-am625-sk.c b/configs/arm64/k3-am625-sk.c
>> +index fac4eaa6..10b5a8f3 100644
>> +--- a/configs/arm64/k3-am625-sk.c
>> ++++ b/configs/arm64/k3-am625-sk.c
>> +@@ -18,7 +18,7 @@
>> + struct {
>> +	struct jailhouse_system header;
>> +	__u64 cpus[1];
>> +-	struct jailhouse_memory mem_regions[33];
>> ++	struct jailhouse_memory mem_regions[35];
>> +	struct jailhouse_irqchip irqchips[5];
>> +	struct jailhouse_pci_device pci_devices[2];
>> + } __attribute__((packed)) config = {
>> +@@ -231,6 +231,20 @@ struct {
>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> +				JAILHOUSE_MEM_IO,
>> +		},
>> ++		/* GPMC */ {
>> ++			.phys_start = 0x3b000000,
>> ++			.virt_start = 0x3b000000,
>> ++			.size = 0x00001000,
>> ++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> ++				JAILHOUSE_MEM_IO,
>> ++		},
>> ++		/* GPMC */ {
>> ++			.phys_start = 0x50000000,
>> ++			.virt_start = 0x50000000,
>> ++			.size = 0x08000000,
>> ++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> ++				JAILHOUSE_MEM_IO,
>> ++		},
>> +		/* CPSW */ {
>> +			.phys_start = 0x08000000,
>> +			.virt_start = 0x08000000,
>> +--
>> +2.34.1
>> diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse-arch.inc b/meta-ti-extras/recipes-ti/jailhouse/jailhouse-arch.inc
>> new file mode 100644
>> index 00000000..498b25ed
>> --- /dev/null
>> +++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse-arch.inc
>> @@ -0,0 +1,22 @@
>> +# Set jailhouse architecture JH_ARCH variable
>> +#
>> +# return value must match one of architectures supported by jailhouse
>> +#
>> +valid_jh_archs = "x86 arm"
>> +
>> +def map_jh_arch(a, d):
>> +    import re
>> +
>> +    valid_jh_archs = d.getVar('valid_jh_archs', True).split()
>> +
>> +    if   re.match('(i.86|athlon|x86.64)$', a):  return 'x86'
>> +    elif re.match('armeb$', a):                 return 'arm'
>> +    elif re.match('aarch64$', a):               return 'arm64'
>> +    elif re.match('aarch64_be$', a):            return 'arm64'
>> +    elif a in valid_jh_archs:                   return a
>> +    else:
>> +        bb.error("cannot map '%s' to a jailhouse supported architecture" % a)
>> +
>> +export JH_ARCH = "${@map_jh_arch(d.getVar('TARGET_ARCH', True), d)}"
>> +
>> +COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
>> diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
>> new file mode 100644
>> index 00000000..f6340e01
>> --- /dev/null
>> +++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
>> @@ -0,0 +1,209 @@
>> +SUMMARY = "Linux-based partitioning hypervisor"
>> +DESCRIPTION = "Jailhouse is a partitioning Hypervisor based on Linux. It is able to run bare-metal applications or (adapted) \
>> +operating systems besides Linux. For this purpose, it configures CPU and device virtualization features of the hardware \
>> +platform in a way that none of these domains, called 'cells' here, can interfere with each other in an unacceptable way."
>> +HOMEPAGE = "https://github.com/siemens/jailhouse"
>> +SECTION = "jailhouse"
>> +LICENSE = "GPL-2.0-only & BSD-2-Clause"
>> +
>> +LIC_FILES_CHKSUM = " \
>> +    file://COPYING;md5=9fa7f895f96bde2d47fd5b7d95b6ba4d \
>> +"
>> +
>> +TARGET_CC_ARCH += "${LDFLAGS}"
>> +
>> +PV = "0.12+git${SRCPV}"
>> +SRCREV = "e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560"
>> +BRANCH = "master"
>> +
>> +SRC_URI = " \
>> +    git://github.com/siemens/jailhouse.git;protocol=https;branch=${BRANCH} \
>> +    file://0001-configs-arm64-k3-am625-sk-Add-crypto-memory-region.patch \
>> +    file://0002-configs-arm64-k3-am625-sk-Switch-inmate-boot-console.patch \
>> +    file://0003-configs-arm64-k3-am625-sk-Add-VTM-memory-region.patch \
>> +    file://0001-configs-k3-use-intx-for-bar_mask.patch \
>> +    file://0004-configs-arm64-k3-am625-sk-Add-GPMC-memory-region.patch \
>> +"
>> +
>> +DEPENDS = "virtual/kernel dtc-native python3-mako-native python3-mako make-native"
>> +RDEPENDS:${PN} += "\
>> +	python3-curses\
>> +	python3-datetime\
>> +	python3-mmap\
>> +"
>> +
>> +require jailhouse-arch.inc
>> +inherit module python3native bash-completion deploy setuptools3
>> +
>> +S = "${WORKDIR}/git"
>> +B = "${S}"
>> +
>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>> +COMPATIBLE_MACHINE = "(ti-soc)"
>> +
>> +JH_DATADIR ?= "${datadir}/jailhouse"
>> +JH_EXEC_DIR ?= "${libexecdir}/jailhouse"
>> +CELL_DIR ?= "${JH_DATADIR}/cells"
>> +CELLCONF_DIR ?= "${JH_DATADIR}/configs"
>> +INMATES_DIR ?= "${JH_DATADIR}/inmates"
>> +
>> +JH_CELL_FILES ?= "*.cell"
>> +JH_CELL_FILES:k3 ?= "k3-*.cell"
>> +
>> +JH_INMATE_DTB ?= ""
>> +JH_INMATE_DTB:am62xx ?= "inmate-k3-am625-sk.dtb"
>> +JH_INMATE_DTB:am65xx ?= "inmate-k3-am654-idk.dtb"
>> +JH_INMATE_DTB:j7 ?= "inmate-k3-j721e-evm.dtb"
>> +JH_INMATE_DTB:j7200-evm ?= "inmate-k3-j7200-evm.dtb"
>> +
>> +JH_LINUX_DEMO_CELL ?= ""
>> +JH_LINUX_DEMO_CELL:am62xx ?= "k3-am625-sk-linux-demo.cell"
>> +JH_LINUX_DEMO_CELL:am65xx ?= "k3-am654-idk-linux-demo.cell"
>> +JH_LINUX_DEMO_CELL:j7 ?= "k3-j721e-evm-linux-demo.cell"
>> +JH_LINUX_DEMO_CELL:j7200-evm ?= "k3-j7200-evm-linux-demo.cell"
>> +
>> +JH_SYSCONFIG_CELL ?= ""
>> +JH_SYSCONFIG_CELL:am62xx ?= "k3-am625-sk.cell"
>> +JH_SYSCONFIG_CELL:am65xx ?= "k3-am654-idk.cell"
>> +JH_SYSCONFIG_CELL:j7 ?= "k3-j721e-evm.cell"
>> +JH_SYSCONFIG_CELL:j7200-evm ?= "k3-j7200-evm.cell"
>> +
>> +INITRAMFS_IMAGE ?= ""
>> +JH_RAMFS_IMAGE ?= "${INITRAMFS_IMAGE}"
>> +
>> +JH_CMDLINE ?= ""
>> +JH_CMDLINE:am62xx ?= "console=ttyS3,115200n8 earlycon=ns16550a,mmio32,0x02810000"
>> +JH_CMDLINE:am65xx ?= "console=ttyS1,115200n8"
>> +JH_CMDLINE:j7 ?= "console=ttyS3,115200n8"
>> +JH_CMDLINE:j7200-evm ?= "console=ttyS3,115200n8"
>> +
>> +do_configure() {
>> +	if [ -d ${STAGING_DIR_HOST}/${CELLCONF_DIR} ];
>> +	then
>> +		cp ${STAGING_DIR_HOST}/${CELLCONF_DIR}/*.c ${S}/configs/
>> +	fi
>> +}
>> +
>> +USER_SPACE_CFLAGS = '${CFLAGS} -DLIBEXECDIR=\\\"${libexecdir}\\\" \
>> +                    -DJAILHOUSE_VERSION=\\\"$JAILHOUSE_VERSION\\\" \
>> +                    -Wall -Wextra -Wmissing-declarations -Wmissing-prototypes -Werror \
>> +                    -I../driver'
>> +
>> +TOOLS_SRC_DIR = "${S}/tools"
>> +
>> +EXTRA_OEMAKE = "ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}" KDIR=${STAGING_KERNEL_BUILDDIR}"
>> +
>> +do_compile() {
>> +	oe_runmake V=1
>> +}
>> +
>> +do_install() {
>> +	# Install pyjailhouse python modules needed by the tools
>> +	# distutils3_do_install
>> +
>> +	# We want to install the python tools, but we do not want to use pip...
>> +	# At least with v0.10, we can work around this with
>> +	# 'PIP=":" PYTHON_PIP_USEABLE=yes'
>> +	oe_runmake PIP=: PYTHON=python3 PYTHON_PIP_USEABLE=yes DESTDIR=${D} install
>> +
>> +	install -d ${D}${CELL_DIR}
>> +	install -m 0644 ${B}/configs/${JH_ARCH}/${JH_CELL_FILES} ${D}${CELL_DIR}/
>> +
>> +	install -d ${D}${INMATES_DIR}
>> +	install -m 0644 ${B}/inmates/demos/${JH_ARCH}/*.bin ${D}${INMATES_DIR}
>> +
>> +	install -d ${D}/boot
>> +	if [ -n "${JH_RAMFS_IMAGE}" ]
>> +	then
>> +		if [ -f ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}-${MACHINE}.cpio ]
>> +		then
>> +			install -m 0644 ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}-${MACHINE}.cpio ${D}/boot
>> +		else
>> +			bberror "Could not find JH_RAMFS_IMAGE (${JH_RAMFS_IMAGE}-${MACHINE}.cpio)!"
>> +			bberror "Please make sure that \"cpio\" is in IMAGE_FSTYPES."
>> +		fi
>> +	fi
>> +
>> +	if [ -n "${JH_INMATE_DTB}" -a -n "${JH_LINUX_DEMO_CELL}" ]; then
>> +		cd ${TOOLS_SRC_DIR}
>> +
>> +		echo "#! /bin/sh" > ${D}${JH_DATADIR}/linux-demo.sh
>> +		echo "jailhouse enable ${CELL_DIR}/${JH_SYSCONFIG_CELL}" >> ${D}${JH_DATADIR}/linux-demo.sh
>> +		./jailhouse-cell-linux -w ${D}${JH_DATADIR}/${JH_INMATE_DTB} \
>> +			-a ${JH_ARCH} -c "${JH_CMDLINE}" \
>> +			-d ../configs/${JH_ARCH}/dts/${JH_INMATE_DTB} \
>> +			-i ${D}/boot/${JH_RAMFS_IMAGE}-${MACHINE}.cpio \
>> +			${D}${CELL_DIR}/${JH_LINUX_DEMO_CELL} \
>> +			${DEPLOY_DIR_IMAGE}/Image \
>> +			| tr -cd '\11\12\15\40-\176' \
>> +			>> ${D}${JH_DATADIR}/linux-demo.sh
>> +
>> +		sed -i -e 's,^Modified device tree written.*,,g' ${D}${JH_DATADIR}/linux-demo.sh
>> +		sed -i -e 's,\${D},,g' ${D}${JH_DATADIR}/linux-demo.sh
>> +		sed -i -e 's, linux-loader.bin, ${JH_EXEC_DIR}/linux-loader.bin,g' ${D}${JH_DATADIR}/linux-demo.sh
>> +		sed -i -e 's,\${DEPLOY_DIR_IMAGE},/boot,g' ${D}${JH_DATADIR}/linux-demo.sh
>> +		sed -i -e '/^\s*$/d' ${D}${JH_DATADIR}/linux-demo.sh
>> +		chmod +x ${D}${JH_DATADIR}/linux-demo.sh
>> +	fi
>> +
>> +}
>> +
>> +PACKAGE_BEFORE_PN = "kernel-module-jailhouse pyjailhouse ${PN}-tools"
>> +FILES:${PN} = "${base_libdir}/firmware ${libexecdir} ${sbindir} ${JH_DATADIR} /boot"
>> +FILES:pyjailhouse = "${PYTHON_SITEPACKAGES_DIR}"
>> +FILES:${PN}-tools = "${libexecdir}/${BPN}/${BPN}-*"
>> +
>> +RDEPENDS:${PN}-tools = "pyjailhouse python3-mmap python3-math python3-datetime python3-curses python3-compression"
>> +RDEPENDS:pyjailhouse = "python3-core python3-ctypes python3-fcntl python3-shell"
>> +
>> +RRECOMMENDS:${PN} = "${PN}-tools"
>> +
>> +INSANE_SKIP:${PN} = "ldflags"
>> +
>> +KERNEL_MODULE_AUTOLOAD += "jailhouse"
>> +
>> +# Any extra cells/inmates from external recipes/packages
>> +CELLS = ""
>> +
>> +python __anonymous () {
>> +    d.appendVarFlag('do_install', 'depends', ' virtual/kernel:do_deploy')
>> +    ramfs = d.getVar('JH_RAMFS_IMAGE', True)
>> +    if ramfs:
>> +        d.appendVarFlag('do_install', 'depends', ' ${JH_RAMFS_IMAGE}:do_image_complete')
>> +
>> +    # Setup DEPENDS and RDEPENDS to included cells
>> +    cells = d.getVar('CELLS', True) or ""
>> +    for cell in cells.split():
>> +        d.appendVar('DEPENDS', ' ' + cell)
>> +        d.appendVar('RDEPENDS_${PN}', ' ' + cell)
>> +}
>> +
>> +
>> +FILES:${PN} = " \
>> +    /boot \
>> +    /usr/libexec \
>> +    /usr/sbin/ivshmem-demo \
>> +    /usr/sbin/jailhouse \
>> +    /usr/libexec/jailhouse \
>> +    /usr/libexec/jailhouse/jailhouse-config-check \
>> +    /usr/libexec/jailhouse/jailhouse-config-collect \
>> +    /usr/libexec/jailhouse/jailhouse-hardware-check \
>> +    /usr/libexec/jailhouse/jailhouse-cell-stats \
>> +    /usr/libexec/jailhouse/linux-loader.bin \
>> +    /usr/libexec/jailhouse/jailhouse-cell-linux \
>> +    /usr/libexec/jailhouse/jailhouse-config-create \
>> +    /usr/share/jailhouse \
>> +    /usr/share/jailhouse/linux-demo.sh \
>> +    /usr/share/jailhouse/inmate-k3-am625-sk.dtb \
>> +    /usr/share/jailhouse/inmates \
>> +    /usr/share/jailhouse/cells \
>> +    /usr/share/jailhouse/inmates/gic-demo.bin \
>> +    /usr/share/jailhouse/inmates/ivshmem-demo.bin \
>> +    /usr/share/jailhouse/inmates/uart-demo.bin \
>> +    /usr/share/jailhouse/cells/k3-am625-sk.cell \
>> +    /usr/share/jailhouse/cells/k3-am625-sk-inmate-demo.cell \
>> +    /usr/share/jailhouse/cells/k3-am625-sk-linux-demo.cell \
>> +    /lib/firmware \
>> +    /lib/firmware/jailhouse.bin \
>> +    /boot/tisdk-tiny-image-am62xx-evm.cpio \
>> +"
>> -- 
>> 2.17.1

