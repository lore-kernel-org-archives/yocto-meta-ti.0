Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.1155.1637364330182367611
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 15:25:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CF58440BEB;
	Fri, 19 Nov 2021 23:25:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P9Np0wl3XuoI; Fri, 19 Nov 2021 23:25:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A827540BEA;
	Fri, 19 Nov 2021 23:25:26 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 063321746D5; Fri, 19 Nov 2021 18:25:26 -0500 (EST)
Date: Fri, 19 Nov 2021 18:25:25 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: "Siraswar, Yogesh" <yogeshs@ti.com>
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH 2/3] ti-sci-fw: changes to build combined boot image for hs build
Message-ID: <20211119232525.GM18191@denix.org>
References: <20211112231800.64167-1-yogeshs@ti.com>
 <20211112231800.64167-3-yogeshs@ti.com>
 <20211119185748.GL18191@denix.org>
 <f146f30c-2d84-2a37-ac33-da719d0cfff5@ti.com>
MIME-Version: 1.0
In-Reply-To: <f146f30c-2d84-2a37-ac33-da719d0cfff5@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 19, 2021 at 03:35:24PM -0600, Siraswar, Yogesh wrote:
> On 11/19/2021 12:57 PM, Denys Dmytriyenko wrote:
> >Yogesh,
> >
> >Is this still the correct SECDEV to use with am64xx HS?
> >https://git.ti.com/cgit/security-development-tools/core-secdev-k3/
> 
> Yes.
> >
> >I'm getting this error in ti-sci-fw do_compile():
> >
> >| NOTE: make -j 56 CROSS_COMPILE=arm-none-linux-gnueabihf- SYSFW_DL_URL= SYSFW_HS_DL_URL= SYSFW_HS_INNER_CERT_DL_URL= SYSFW_PATH=/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/git/ti-sysfw/ti-sci-firmware-am64x-hs*.bin SOC=am64x CONFIG=evm HS=1 SW_REV=1 SYSFW_HS_PATH=/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/git/ti-sysfw/ti-sci-firmware-am64x-hs*-enc.bin SYSFW_HS_INNER_CERT_PATH=/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/git/ti-sysfw/ti-sci-firmware-am64x-hs*-cert.bin SBL=/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/recipe-sysroot/boot/u-boot-spl.bin
> >| Makefile:139: warning: overriding recipe for target '/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/git/ti-sysfw/ti-sci-firmware-am64x-hs-enc.bin'
> >| Makefile:134: warning: ignoring old recipe for target '/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/git/ti-sysfw/ti-sci-firmware-am64x-hs-enc.bin'
> >| Makefile:144: warning: overriding recipe for target '/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/git/ti-sysfw/ti-sci-firmware-am64x-hs-cert.bin'
> >| Makefile:134: warning: ignoring old recipe for target '/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/git/ti-sysfw/ti-sci-firmware-am64x-hs-cert.bin'
> >| ./gen_its.sh am64x evm sysfw.bin board-cfg.bin pm-cfg.bin rm-cfg.bin sec-cfg.bin > out/soc/am64x/evm/sysfw-am64x-evm.its
> >| ./scripts/gen_x509_combined_cert.sh -b /OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/recipe-sysroot/boot/u-boot-spl.bin -l 0x70000000 -s /OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/git/ti-sysfw/ti-sci-firmware-am64x-hs*.bin -m 0x44000 -d out/soc/am64x/evm/combined-sysfw-cfg.bin -n 0x7b000 -k /opt/secdev-k3//keys/custMpk.pem -o tiboot3.bin
> >| ERROR: SYSFW and its loadaddr are compulsory
> >| Usage: ./scripts/gen_x509_combined_cert.sh [-b Boot Loader] [-d SYSFW_DATA] [-k key_file] [-l SBL loadaddress] [-m SYSFW loadaddress] [-n SYSFW_DATA loadaddr] [-s SYSFW] [-t DM_DATA] [-y DM_DATA loadaddr]
> >
> >Any pointers?
> Check the k3-image-gen.

Was the fix part of this later commit to update K3_IMAGE_GEN_SRCREV?
https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?h=dunfell&id=f438a091c319250eed33fe058706e93c9fbefd1c

This was merged earlier today for J721e HS SR1.1 and seems unrelated to 
AM64 HS changes submitted a week ago... Was that just an oversight updating 
the SRCREV, or was there another problem I'm missing? Thanks.

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
