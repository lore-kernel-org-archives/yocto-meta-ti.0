Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.447.1637357730366034727
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 13:35:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=eq2Er8Rs;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AJLZP3R097598;
	Fri, 19 Nov 2021 15:35:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637357725;
	bh=hc8SBxN4Q75//pj77wDV8jaWaOyDv0ea0bVrapBg4Nc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=eq2Er8Rst6uKPCRphKSLKHX/QhYpHCWTGWpM3hGZnsjzTmLzMs5ty4Ks8GF6v07/F
	 O/nxB+Guxmo3JHkB4QvPfieNI9CxNFwrtGg5fwBfGpsEfCmwxboQA3onXgmB4yYYk+
	 mZh8Oo4ywFuIR9UQj9NzpHO6ltEpIUmunue7N83s=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AJLZPqt111714
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 19 Nov 2021 15:35:25 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 19
 Nov 2021 15:35:25 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 19 Nov 2021 15:35:24 -0600
Received: from [10.249.32.113] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AJLZO3n103074;
	Fri, 19 Nov 2021 15:35:24 -0600
Message-ID: <f146f30c-2d84-2a37-ac33-da719d0cfff5@ti.com>
Date: Fri, 19 Nov 2021 15:35:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [meta-ti][dunfell][PATCH 2/3] ti-sci-fw: changes to build combined boot image for hs build
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20211112231800.64167-1-yogeshs@ti.com>
 <20211112231800.64167-3-yogeshs@ti.com> <20211119185748.GL18191@denix.org>
From: "Yogesh Siraswar" <yogeshs@ti.com>
In-Reply-To: <20211119185748.GL18191@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/19/2021 12:57 PM, Denys Dmytriyenko wrote:
> Yogesh,
> 
> Is this still the correct SECDEV to use with am64xx HS?
> https://git.ti.com/cgit/security-development-tools/core-secdev-k3/

Yes.
> 
> I'm getting this error in ti-sci-fw do_compile():
> 
> | NOTE: make -j 56 CROSS_COMPILE=arm-none-linux-gnueabihf- SYSFW_DL_URL= SYSFW_HS_DL_URL= SYSFW_HS_INNER_CERT_DL_URL= SYSFW_PATH=/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/git/ti-sysfw/ti-sci-firmware-am64x-hs*.bin SOC=am64x CONFIG=evm HS=1 SW_REV=1 SYSFW_HS_PATH=/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/git/ti-sysfw/ti-sci-firmware-am64x-hs*-enc.bin SYSFW_HS_INNER_CERT_PATH=/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/git/ti-sysfw/ti-sci-firmware-am64x-hs*-cert.bin SBL=/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/recipe-sysroot/boot/u-boot-spl.bin
> | Makefile:139: warning: overriding recipe for target '/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/git/ti-sysfw/ti-sci-firmware-am64x-hs-enc.bin'
> | Makefile:134: warning: ignoring old recipe for target '/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/git/ti-sysfw/ti-sci-firmware-am64x-hs-enc.bin'
> | Makefile:144: warning: overriding recipe for target '/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/git/ti-sysfw/ti-sci-firmware-am64x-hs-cert.bin'
> | Makefile:134: warning: ignoring old recipe for target '/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/git/ti-sysfw/ti-sci-firmware-am64x-hs-cert.bin'
> | ./gen_its.sh am64x evm sysfw.bin board-cfg.bin pm-cfg.bin rm-cfg.bin sec-cfg.bin > out/soc/am64x/evm/sysfw-am64x-evm.its
> | ./scripts/gen_x509_combined_cert.sh -b /OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/recipe-sysroot/boot/u-boot-spl.bin -l 0x70000000 -s /OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/git/ti-sysfw/ti-sci-firmware-am64x-hs*.bin -m 0x44000 -d out/soc/am64x/evm/combined-sysfw-cfg.bin -n 0x7b000 -k /opt/secdev-k3//keys/custMpk.pem -o tiboot3.bin
> | ERROR: SYSFW and its loadaddr are compulsory
> | Usage: ./scripts/gen_x509_combined_cert.sh [-b Boot Loader] [-d SYSFW_DATA] [-k key_file] [-l SBL loadaddress] [-m SYSFW loadaddress] [-n SYSFW_DATA loadaddr] [-s SYSFW] [-t DM_DATA] [-y DM_DATA loadaddr]
> 
> Any pointers?
Check the k3-image-gen.
> 
