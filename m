Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3973FC6379F
	for <webhook@archiver.kernel.org>; Sat, 18 Feb 2023 04:09:49 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.6443.1676693385654166509
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 17 Feb 2023 20:09:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=oO0NFP18;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31I49bBv081174;
	Fri, 17 Feb 2023 22:09:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676693377;
	bh=fwEsgOJj+xORkCNxqzPhmw1HGR9M40viCtsNpe8pPFs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=oO0NFP18PZgNmGAciZXIwcmjf8LIMm7Tpiqciq90NDu5scbw6VP35oEhyccSTn9UR
	 Cu1pXrZXHS1usqU15jPxOSyznpCJV3vZCBF9rrhNtWSNbyF0DLNMOlMkYKqUro6YMF
	 j2KSs6fs/QMdgQugJiRkpgI+8VowTpoX54xbJkFQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31I49bMH007371
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Feb 2023 22:09:37 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 17
 Feb 2023 22:09:36 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 17 Feb 2023 22:09:36 -0600
Received: from [10.249.38.163] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31I49aWX087228;
	Fri, 17 Feb 2023 22:09:36 -0600
Message-ID: <eeb5e701-947d-7dad-995b-01d309e33508@ti.com>
Date: Fri, 17 Feb 2023 22:09:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 00/15] ti-rtos-firmware and
 secdev
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20230215193355.9676-1-afd@ti.com>
 <20230217070946.GM22689@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230217070946.GM22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 18 Feb 2023 04:09:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15879



On 2/17/2023 1:09, Denys Dmytriyenko wrote:
> On Wed, Feb 15, 2023 at 01:33:40PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> Hello all,
>>
>> This is a combined series that replaces my previous ones on
>> ti-rtos-firmware and SECDEV. There is now a small dependency
>> between them so I have merged them here.
>>
>> Big change is in the SECDEV series which now uses a new bbclass
>> to combine the SECDEV env setup in one spot. We also remove
>> the ti-path.inc usage.
> 
> Andrew,
> 
> Overall, looks very good and I like the bbclass approach! However, I tried to
> test the series locally (started with j721e-evm) and got these:
> 
> 
> WARNING: ti-rtos-firmware-08.02.00.04-r3.0 do_package: ti-rtos-firmware: NOT adding alternative provide /lib/firmware/j7-mcu-r5f0_1-fw: /lib/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f does not exist
> 
> 
> ERROR: mc:k3r5:ti-sci-fw-2022.01-r3.2 do_compile: oe_runmake failed
> ERROR: mc:k3r5:ti-sci-fw-2022.01-r3.2 do_compile: ExecutionError('/OE/arago-kirkstone/build/arago-tmp-default-glibc/work/j721e_evm_k3r5-oe-linux-gnueabi/ti-sci-fw/2022.01-r3.2/temp/run.do_compile.165613', 1, None, None)
> ERROR: Logfile of failure stored in: /OE/arago-kirkstone/build/arago-tmp-default-glibc/work/j721e_evm_k3r5-oe-linux-gnueabi/ti-sci-fw/2022.01-r3.2/temp/log.do_compile.165613
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 64 CROSS_COMPILE=arm-oe-linux-gnueabi- SOC=j721e SOC_TYPE=gp CONFIG=evm SYSFW_DIR=/OE/arago-kirkstone/build/arago-tmp-default-glibc/work/j721e_evm_k3r5-oe-linux-gnueabi/ti-sci-fw/2022.01-r3.2/git/ti-sysfw
> | ./gen_its.sh j721e gp evm out/soc/j721e/evm/sysfw.bin-gp out/soc/j721e/evm/board-cfg.bin out/soc/j721e/evm/pm-cfg.bin out/soc/j721e/evm/rm-cfg.bin out/soc/j721e/evm/sec-cfg.bin > out/soc/j721e/evm/sysfw-j721e-evm.its
> | /bin/sh: 1: cannot create out/soc/j721e/evm/sysfw-j721e-evm.its: Directory nonexistent
> | arm-oe-linux-gnueabi-gcc -fno-builtin -Wall -Iinclude/soc/j721e -Isoc/j721e/evm -Iinclude -c -o out/soc/j721e/evm/board-cfg.o-pre-validated ./soc/j721e/evm/board-cfg.c
> | Signing the SYSFW release image with ti-degenerate-key.pem key...
> | make: *** [Makefile:208: out/soc/j721e/evm/sysfw-j721e-evm.its] Error 2
> | make: *** Waiting for unfinished jobs....
> | ./gen_x509_cert.sh -c m3 -b /OE/arago-kirkstone/build/arago-tmp-default-glibc/work/j721e_evm_k3r5-oe-linux-gnueabi/ti-sci-fw/2022.01-r3.2/git/ti-sysfw/ti-fs-firmware-j721e-gp.bin -o out/soc/j721e/evm/sysfw.bin-gp -l 0x40000 -k ti-degenerate-key.pem -r 1;
> | python3 ./scripts/sysfw_boardcfg_validator.py -b out/soc/j721e/evm/board-cfg.o-pre-validated -i -o out/soc/j721e/evm/board-cfg.o -s j721e -l out/soc/j721e/evm/board-cfg.o.log
> | Certificate being generated :
> |       LOADADDR = 0x00040000
> |       IMAGE_SIZE = 262112
> |       CERT_TYPE = 2
> | SUCCESS: Image out/soc/j721e/evm/sysfw.bin-gp generated.
> | rm out/soc/j721e/evm/board-cfg.o
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> ERROR: Task (mc:k3r5:/OE/arago-kirkstone/sources/meta-ti/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb:do_compile) failed with exit code '1'
> 

Odd.  I just tested the patches and did not get those errors...



-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

