Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16EFC433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 19:47:52 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.2035.1667591245784783673
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 12:47:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9568440D77;
	Fri,  4 Nov 2022 19:47:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wu4WkcCgTlpp; Fri,  4 Nov 2022 19:47:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7795040D76;
	Fri,  4 Nov 2022 19:47:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7B432163677; Fri,  4 Nov 2022 15:47:19 -0400 (EDT)
Date: Fri, 4 Nov 2022 15:47:19 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Andrew Davis <afd@ti.com>
Subject: k3-image-gen race?
Message-ID: <20221104194719.GH22689@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 19:47:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15223

Andrew,

There seems to be an intermittent race in the k3-image-gen Makefiles - it 
doesn't happen very often, but I've seen it couple of times, when it cannot 
create an output file because the directory is not there yet.

Would you be able to take a look? Thanks.

Here's am64x in Dunfell:

| NOTE: make -j 56 CROSS_COMPILE=arm-none-linux-gnueabihf- SOC=am64x_sr2 SOC_TYPE=hs CONFIG=evm SYSFW_DIR=/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_evm_k3r5_sr2_hs_se-linux-gnueabi/ti-sci-fw/2022.01-r3.2/git/ti-sysfw SBL=/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_evm_k3r5_sr2_hs_se-linux-gnueabi/ti-sci-fw/2022.01-r3.2/recipe-sysroot/boot/u-boot-spl.bin
| arm-none-linux-gnueabihf-gcc -fno-builtin -Wall -Iinclude/soc/am64x -Isoc/am64x/evm -Iinclude -c -o out/soc/am64x/evm/board-cfg.o-pre-validated ./soc/am64x/evm/board-cfg.c
| arm-none-linux-gnueabihf-gcc -fno-builtin -Wall -Iinclude/soc/am64x -Isoc/am64x/evm -Iinclude -c -o out/soc/am64x/evm/sec-cfg.o-pre-validated ./soc/am64x/evm/sec-cfg.c
| arm-none-linux-gnueabihf-gcc -fno-builtin -Wall -Iinclude/soc/am64x -Isoc/am64x/evm -Iinclude -c -o out/soc/am64x/evm/pm-cfg.o-pre-validated ./soc/am64x/evm/pm-cfg.c
| arm-none-linux-gnueabihf-gcc -fno-builtin -Wall -Iinclude/soc/am64x -Isoc/am64x/evm -Iinclude -c -o out/soc/am64x/evm/rm-cfg.o-pre-validated ./soc/am64x/evm/rm-cfg.c
| Assembler messages:
| Fatal error: can't create out/soc/am64x/evm/sec-cfg.o-pre-validated: No such file or directory
| Makefile:242: recipe for target 'out/soc/am64x/evm/sec-cfg.o' failed
| make: *** [out/soc/am64x/evm/sec-cfg.o] Error 1
| make: *** Waiting for unfinished jobs....
| Assembler messages:
| Fatal error: can't create out/soc/am64x/evm/board-cfg.o-pre-validated: No such file or directory
| Makefile:242: recipe for target 'out/soc/am64x/evm/board-cfg.o' failed
| make: *** [out/soc/am64x/evm/board-cfg.o] Error 1
| Assembler messages:
| Fatal error: can't create out/soc/am64x/evm/pm-cfg.o-pre-validated: No such file or directory
| Assembler messages:
| Fatal error: can't create out/soc/am64x/evm/rm-cfg.o-pre-validated: No such file or directory
| Makefile:242: recipe for target 'out/soc/am64x/evm/pm-cfg.o' failed
| make: *** [out/soc/am64x/evm/pm-cfg.o] Error 1
| Makefile:242: recipe for target 'out/soc/am64x/evm/rm-cfg.o' failed
| make: *** [out/soc/am64x/evm/rm-cfg.o] Error 1
| ERROR: oe_runmake failed
| WARNING: /OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_evm_k3r5_sr2_hs_se-linux-gnueabi/ti-sci-fw/2022.01-r3.2/temp/run.do_compile.14082:1 exit 1 from 'exit 1'
| ERROR: Execution of '/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_evm_k3r5_sr2_hs_se-linux-gnueabi/ti-sci-fw/2022.01-r3.2/temp/run.do_compile.14082' failed with exit code 1


And here's am65x in Kirkstone/master that's been updated with latest Dunfell changes:

| NOTE: make -j 72 CROSS_COMPILE=arm-oe-linux-gnueabi- SOC=am65x SOC_TYPE=gp CONFIG=evm SYSFW_DIR=/OE/new-arago-master/build/tmp-default-glibc/work/am65xx_evm_k3r5-oe-linux-gnueabi/ti-sci-fw/2022.01-r3.2/git/ti-sysfw
| ./gen_its.sh am65x gp evm out/soc/am65x/evm/sysfw.bin-gp out/soc/am65x/evm/board-cfg.bin out/soc/am65x/evm/pm-cfg.bin out/soc/am65x/evm/rm-cfg.bin out/soc/am65x/evm/sec-cfg.bin > out/soc/am65x/evm/sysfw-am65x-evm.its
| /bin/sh: 1: cannot create out/soc/am65x/evm/sysfw-am65x-evm.its: Directory nonexistent
| make: *** [Makefile:208: out/soc/am65x/evm/sysfw-am65x-evm.its] Error 2
| make: *** Waiting for unfinished jobs....
| Signing the SYSFW release image with ti-degenerate-key.pem key...
| ./gen_x509_cert.sh -c m3 -b /OE/new-arago-master/build/tmp-default-glibc/work/am65xx_evm_k3r5-oe-linux-gnueabi/ti-sci-fw/2022.01-r3.2/git/ti-sysfw/ti-sci-firmware-am65x-gp.bin -o out/soc/am65x/evm/sysfw.bin-gp -l 0x40000 -k ti-degenerate-key.pem -r 1;
| Certificate being generated :
|       LOADADDR = 0x00040000
|       IMAGE_SIZE = 262112
|       CERT_TYPE = 2
| SUCCESS: Image out/soc/am65x/evm/sysfw.bin-gp generated.
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

