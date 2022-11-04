Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA83C4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:05:13 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2872.1667595910260788348
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XAXsYIbD;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2A4L56YF083310;
	Fri, 4 Nov 2022 16:05:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1667595906;
	bh=2uKkciN39Y+1ziMqqLKmlbQVlxhJ1jHkSSwiclypG2w=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=XAXsYIbD8fDBmLvh9VFDte/iQwCSzWSIGUZA0ejZJLSYomk6HtW3CGWfaIy00cAB4
	 Xwc1eCAtEXqyVok8Cv4ikLMcNLFJzFZofKPeJ/Hl+NhXfrH3XYB2LjGwse+/VcEXQi
	 qJYAezQqCbwTRmh9vppBmCdvkw5tE/reMKjWCb4o=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2A4L56JM120808
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Nov 2022 16:05:06 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 4 Nov
 2022 16:05:06 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 4 Nov 2022 16:05:06 -0500
Received: from [10.250.38.44] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2A4L55Gk113014;
	Fri, 4 Nov 2022 16:05:05 -0500
Message-ID: <1d116e39-9e18-28ee-70c5-eae5150ff2f8@ti.com>
Date: Fri, 4 Nov 2022 16:05:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: k3-image-gen race?
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
References: <20221104194719.GH22689@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20221104194719.GH22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:05:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15224

On 11/4/22 2:47 PM, Denys Dmytriyenko wrote:
> Andrew,
> 
> There seems to be an intermittent race in the k3-image-gen Makefiles - it
> doesn't happen very often, but I've seen it couple of times, when it cannot
> create an output file because the directory is not there yet.
> 
> Would you be able to take a look? Thanks.
> 

Sure, I see the issue, makefile dependencies for the build dirs.
Sending patch to k3-image-gen now.

Thanks,
Andrew

> Here's am64x in Dunfell:
> 
> | NOTE: make -j 56 CROSS_COMPILE=arm-none-linux-gnueabihf- SOC=am64x_sr2 SOC_TYPE=hs CONFIG=evm SYSFW_DIR=/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_evm_k3r5_sr2_hs_se-linux-gnueabi/ti-sci-fw/2022.01-r3.2/git/ti-sysfw SBL=/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_evm_k3r5_sr2_hs_se-linux-gnueabi/ti-sci-fw/2022.01-r3.2/recipe-sysroot/boot/u-boot-spl.bin
> | arm-none-linux-gnueabihf-gcc -fno-builtin -Wall -Iinclude/soc/am64x -Isoc/am64x/evm -Iinclude -c -o out/soc/am64x/evm/board-cfg.o-pre-validated ./soc/am64x/evm/board-cfg.c
> | arm-none-linux-gnueabihf-gcc -fno-builtin -Wall -Iinclude/soc/am64x -Isoc/am64x/evm -Iinclude -c -o out/soc/am64x/evm/sec-cfg.o-pre-validated ./soc/am64x/evm/sec-cfg.c
> | arm-none-linux-gnueabihf-gcc -fno-builtin -Wall -Iinclude/soc/am64x -Isoc/am64x/evm -Iinclude -c -o out/soc/am64x/evm/pm-cfg.o-pre-validated ./soc/am64x/evm/pm-cfg.c
> | arm-none-linux-gnueabihf-gcc -fno-builtin -Wall -Iinclude/soc/am64x -Isoc/am64x/evm -Iinclude -c -o out/soc/am64x/evm/rm-cfg.o-pre-validated ./soc/am64x/evm/rm-cfg.c
> | Assembler messages:
> | Fatal error: can't create out/soc/am64x/evm/sec-cfg.o-pre-validated: No such file or directory
> | Makefile:242: recipe for target 'out/soc/am64x/evm/sec-cfg.o' failed
> | make: *** [out/soc/am64x/evm/sec-cfg.o] Error 1
> | make: *** Waiting for unfinished jobs....
> | Assembler messages:
> | Fatal error: can't create out/soc/am64x/evm/board-cfg.o-pre-validated: No such file or directory
> | Makefile:242: recipe for target 'out/soc/am64x/evm/board-cfg.o' failed
> | make: *** [out/soc/am64x/evm/board-cfg.o] Error 1
> | Assembler messages:
> | Fatal error: can't create out/soc/am64x/evm/pm-cfg.o-pre-validated: No such file or directory
> | Assembler messages:
> | Fatal error: can't create out/soc/am64x/evm/rm-cfg.o-pre-validated: No such file or directory
> | Makefile:242: recipe for target 'out/soc/am64x/evm/pm-cfg.o' failed
> | make: *** [out/soc/am64x/evm/pm-cfg.o] Error 1
> | Makefile:242: recipe for target 'out/soc/am64x/evm/rm-cfg.o' failed
> | make: *** [out/soc/am64x/evm/rm-cfg.o] Error 1
> | ERROR: oe_runmake failed
> | WARNING: /OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_evm_k3r5_sr2_hs_se-linux-gnueabi/ti-sci-fw/2022.01-r3.2/temp/run.do_compile.14082:1 exit 1 from 'exit 1'
> | ERROR: Execution of '/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_evm_k3r5_sr2_hs_se-linux-gnueabi/ti-sci-fw/2022.01-r3.2/temp/run.do_compile.14082' failed with exit code 1
> 
> 
> And here's am65x in Kirkstone/master that's been updated with latest Dunfell changes:
> 
> | NOTE: make -j 72 CROSS_COMPILE=arm-oe-linux-gnueabi- SOC=am65x SOC_TYPE=gp CONFIG=evm SYSFW_DIR=/OE/new-arago-master/build/tmp-default-glibc/work/am65xx_evm_k3r5-oe-linux-gnueabi/ti-sci-fw/2022.01-r3.2/git/ti-sysfw
> | ./gen_its.sh am65x gp evm out/soc/am65x/evm/sysfw.bin-gp out/soc/am65x/evm/board-cfg.bin out/soc/am65x/evm/pm-cfg.bin out/soc/am65x/evm/rm-cfg.bin out/soc/am65x/evm/sec-cfg.bin > out/soc/am65x/evm/sysfw-am65x-evm.its
> | /bin/sh: 1: cannot create out/soc/am65x/evm/sysfw-am65x-evm.its: Directory nonexistent
> | make: *** [Makefile:208: out/soc/am65x/evm/sysfw-am65x-evm.its] Error 2
> | make: *** Waiting for unfinished jobs....
> | Signing the SYSFW release image with ti-degenerate-key.pem key...
> | ./gen_x509_cert.sh -c m3 -b /OE/new-arago-master/build/tmp-default-glibc/work/am65xx_evm_k3r5-oe-linux-gnueabi/ti-sci-fw/2022.01-r3.2/git/ti-sysfw/ti-sci-firmware-am65x-gp.bin -o out/soc/am65x/evm/sysfw.bin-gp -l 0x40000 -k ti-degenerate-key.pem -r 1;
> | Certificate being generated :
> |       LOADADDR = 0x00040000
> |       IMAGE_SIZE = 262112
> |       CERT_TYPE = 2
> | SUCCESS: Image out/soc/am65x/evm/sysfw.bin-gp generated.
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> 

