Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62EEC61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 21:12:59 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.54532.1677013979016512201
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Feb 2023 13:12:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rpPVX4v6;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31LLCpIH042086;
	Tue, 21 Feb 2023 15:12:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677013971;
	bh=UZJXqfE1a50GedIgVTRwyXkAHl2V5Ud/VbmqRE1OnEQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rpPVX4v6eB6yMSlxQ05DoPR2S8vsaTsC0JJqfqp80+wcWOHmIia6IFtY4BHnVry81
	 X/0EpkSPVgf5Bemr+zDLIhtGvQsVMQ18R74PmSkWBIJpedt+m4wbD0HPh+EckmGHCX
	 uCNXGh1rfQHgfqC9KBXM7S1FfUETGZtH7sTXbvBY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31LLCpnf071206
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Feb 2023 15:12:51 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 21
 Feb 2023 15:12:51 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 21 Feb 2023 15:12:51 -0600
Received: from [10.250.33.176] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31LLCoS2016402;
	Tue, 21 Feb 2023 15:12:51 -0600
Message-ID: <9554096a-a674-c0f8-b614-99677829e16a@ti.com>
Date: Tue, 21 Feb 2023 15:12:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 00/15] ti-rtos-firmware and
 secdev
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20230215193355.9676-1-afd@ti.com>
 <20230217070946.GM22689@denix.org>
 <eeb5e701-947d-7dad-995b-01d309e33508@ti.com>
 <20230221205158.GP22689@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230221205158.GP22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Feb 2023 21:12:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15897

On 2/21/23 2:51 PM, Denys Dmytriyenko wrote:
> On Fri, Feb 17, 2023 at 10:09:36PM -0600, Ryan Eatmon wrote:
>>
>>
>> On 2/17/2023 1:09, Denys Dmytriyenko wrote:
>>> On Wed, Feb 15, 2023 at 01:33:40PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>>>> Hello all,
>>>>
>>>> This is a combined series that replaces my previous ones on
>>>> ti-rtos-firmware and SECDEV. There is now a small dependency
>>>> between them so I have merged them here.
>>>>
>>>> Big change is in the SECDEV series which now uses a new bbclass
>>>> to combine the SECDEV env setup in one spot. We also remove
>>>> the ti-path.inc usage.
>>>
>>> Andrew,
>>>
>>> Overall, looks very good and I like the bbclass approach! However, I tried to
>>> test the series locally (started with j721e-evm) and got these:
>>>
>>>
>>> WARNING: ti-rtos-firmware-08.02.00.04-r3.0 do_package: ti-rtos-firmware: NOT adding alternative provide /lib/firmware/j7-mcu-r5f0_1-fw: /lib/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f does not exist
>>>
>>>
>>> ERROR: mc:k3r5:ti-sci-fw-2022.01-r3.2 do_compile: oe_runmake failed
>>> ERROR: mc:k3r5:ti-sci-fw-2022.01-r3.2 do_compile: ExecutionError('/OE/arago-kirkstone/build/arago-tmp-default-glibc/work/j721e_evm_k3r5-oe-linux-gnueabi/ti-sci-fw/2022.01-r3.2/temp/run.do_compile.165613', 1, None, None)
>>> ERROR: Logfile of failure stored in: /OE/arago-kirkstone/build/arago-tmp-default-glibc/work/j721e_evm_k3r5-oe-linux-gnueabi/ti-sci-fw/2022.01-r3.2/temp/log.do_compile.165613
>>> Log data follows:
>>> | DEBUG: Executing shell function do_compile
>>> | NOTE: make -j 64 CROSS_COMPILE=arm-oe-linux-gnueabi- SOC=j721e SOC_TYPE=gp CONFIG=evm SYSFW_DIR=/OE/arago-kirkstone/build/arago-tmp-default-glibc/work/j721e_evm_k3r5-oe-linux-gnueabi/ti-sci-fw/2022.01-r3.2/git/ti-sysfw
>>> | ./gen_its.sh j721e gp evm out/soc/j721e/evm/sysfw.bin-gp out/soc/j721e/evm/board-cfg.bin out/soc/j721e/evm/pm-cfg.bin out/soc/j721e/evm/rm-cfg.bin out/soc/j721e/evm/sec-cfg.bin > out/soc/j721e/evm/sysfw-j721e-evm.its
>>> | /bin/sh: 1: cannot create out/soc/j721e/evm/sysfw-j721e-evm.its: Directory nonexistent
>>> | arm-oe-linux-gnueabi-gcc -fno-builtin -Wall -Iinclude/soc/j721e -Isoc/j721e/evm -Iinclude -c -o out/soc/j721e/evm/board-cfg.o-pre-validated ./soc/j721e/evm/board-cfg.c
>>> | Signing the SYSFW release image with ti-degenerate-key.pem key...
>>> | make: *** [Makefile:208: out/soc/j721e/evm/sysfw-j721e-evm.its] Error 2
>>> | make: *** Waiting for unfinished jobs....
>>> | ./gen_x509_cert.sh -c m3 -b /OE/arago-kirkstone/build/arago-tmp-default-glibc/work/j721e_evm_k3r5-oe-linux-gnueabi/ti-sci-fw/2022.01-r3.2/git/ti-sysfw/ti-fs-firmware-j721e-gp.bin -o out/soc/j721e/evm/sysfw.bin-gp -l 0x40000 -k ti-degenerate-key.pem -r 1;
>>> | python3 ./scripts/sysfw_boardcfg_validator.py -b out/soc/j721e/evm/board-cfg.o-pre-validated -i -o out/soc/j721e/evm/board-cfg.o -s j721e -l out/soc/j721e/evm/board-cfg.o.log
>>> | Certificate being generated :
>>> |       LOADADDR = 0x00040000
>>> |       IMAGE_SIZE = 262112
>>> |       CERT_TYPE = 2
>>> | SUCCESS: Image out/soc/j721e/evm/sysfw.bin-gp generated.
>>> | rm out/soc/j721e/evm/board-cfg.o
>>> | ERROR: oe_runmake failed
>>> | WARNING: exit code 1 from a shell command.
>>> ERROR: Task (mc:k3r5:/OE/arago-kirkstone/sources/meta-ti/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb:do_compile) failed with exit code '1'
>>>
>>
>> Odd.  I just tested the patches and did not get those errors...
> 
> Hmm, I wonder if what I hit was one of those race conditions in k3-image-gen?
> Andrew, do you have any comments?
> 

That looks like that could be the issue, I did fix all the race conditions, but it
seems kirkstone has some old version of ti-sci-fw from back before my fixes. I'd
guess updating K3_IMAGE_GEN_SRCREV to the latest would fix this for you.

Andrew

