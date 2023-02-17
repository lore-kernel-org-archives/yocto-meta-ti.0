Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB59C05027
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 07:10:21 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1921.1676617815409534977
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 23:10:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2348C40C5F;
	Fri, 17 Feb 2023 07:10:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wRb1AV67JgPZ; Fri, 17 Feb 2023 07:10:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EF07A40C22;
	Fri, 17 Feb 2023 07:10:10 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C446E163761; Fri, 17 Feb 2023 02:09:46 -0500 (EST)
Date: Fri, 17 Feb 2023 02:09:46 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 00/15] ti-rtos-firmware
 and secdev
Message-ID: <20230217070946.GM22689@denix.org>
References: <20230215193355.9676-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215193355.9676-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 17 Feb 2023 07:10:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15878

On Wed, Feb 15, 2023 at 01:33:40PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> Hello all,
> 
> This is a combined series that replaces my previous ones on
> ti-rtos-firmware and SECDEV. There is now a small dependency
> between them so I have merged them here.
> 
> Big change is in the SECDEV series which now uses a new bbclass
> to combine the SECDEV env setup in one spot. We also remove
> the ti-path.inc usage.

Andrew,

Overall, looks very good and I like the bbclass approach! However, I tried to 
test the series locally (started with j721e-evm) and got these:


WARNING: ti-rtos-firmware-08.02.00.04-r3.0 do_package: ti-rtos-firmware: NOT adding alternative provide /lib/firmware/j7-mcu-r5f0_1-fw: /lib/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f does not exist


ERROR: mc:k3r5:ti-sci-fw-2022.01-r3.2 do_compile: oe_runmake failed
ERROR: mc:k3r5:ti-sci-fw-2022.01-r3.2 do_compile: ExecutionError('/OE/arago-kirkstone/build/arago-tmp-default-glibc/work/j721e_evm_k3r5-oe-linux-gnueabi/ti-sci-fw/2022.01-r3.2/temp/run.do_compile.165613', 1, None, None)
ERROR: Logfile of failure stored in: /OE/arago-kirkstone/build/arago-tmp-default-glibc/work/j721e_evm_k3r5-oe-linux-gnueabi/ti-sci-fw/2022.01-r3.2/temp/log.do_compile.165613
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 64 CROSS_COMPILE=arm-oe-linux-gnueabi- SOC=j721e SOC_TYPE=gp CONFIG=evm SYSFW_DIR=/OE/arago-kirkstone/build/arago-tmp-default-glibc/work/j721e_evm_k3r5-oe-linux-gnueabi/ti-sci-fw/2022.01-r3.2/git/ti-sysfw
| ./gen_its.sh j721e gp evm out/soc/j721e/evm/sysfw.bin-gp out/soc/j721e/evm/board-cfg.bin out/soc/j721e/evm/pm-cfg.bin out/soc/j721e/evm/rm-cfg.bin out/soc/j721e/evm/sec-cfg.bin > out/soc/j721e/evm/sysfw-j721e-evm.its
| /bin/sh: 1: cannot create out/soc/j721e/evm/sysfw-j721e-evm.its: Directory nonexistent
| arm-oe-linux-gnueabi-gcc -fno-builtin -Wall -Iinclude/soc/j721e -Isoc/j721e/evm -Iinclude -c -o out/soc/j721e/evm/board-cfg.o-pre-validated ./soc/j721e/evm/board-cfg.c
| Signing the SYSFW release image with ti-degenerate-key.pem key...
| make: *** [Makefile:208: out/soc/j721e/evm/sysfw-j721e-evm.its] Error 2
| make: *** Waiting for unfinished jobs....
| ./gen_x509_cert.sh -c m3 -b /OE/arago-kirkstone/build/arago-tmp-default-glibc/work/j721e_evm_k3r5-oe-linux-gnueabi/ti-sci-fw/2022.01-r3.2/git/ti-sysfw/ti-fs-firmware-j721e-gp.bin -o out/soc/j721e/evm/sysfw.bin-gp -l 0x40000 -k ti-degenerate-key.pem -r 1;
| python3 ./scripts/sysfw_boardcfg_validator.py -b out/soc/j721e/evm/board-cfg.o-pre-validated -i -o out/soc/j721e/evm/board-cfg.o -s j721e -l out/soc/j721e/evm/board-cfg.o.log
| Certificate being generated :
|       LOADADDR = 0x00040000
|       IMAGE_SIZE = 262112
|       CERT_TYPE = 2
| SUCCESS: Image out/soc/j721e/evm/sysfw.bin-gp generated.
| rm out/soc/j721e/evm/board-cfg.o
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
ERROR: Task (mc:k3r5:/OE/arago-kirkstone/sources/meta-ti/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb:do_compile) failed with exit code '1'


