Return-Path: <b-brnich@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98026C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 20:39:59 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.48911.1741639196396998425
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Mar 2025 13:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gqdwyYwm;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: b-brnich@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52AKdrne508842
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Mar 2025 15:39:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741639193;
	bh=iAIij4ft4TPqZaB/GmQ6O9/2TjgIFkJE6pCyph6b0uU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=gqdwyYwmdSnizCRiHZ3DZTmqJBCwrrW4BOwZ7/jmNEfqT3j6meFjOBbSg/acr+gRm
	 zzUm7caWnSACQExTgkqvzLwhZISOvvulABixPqcVinW9LOn/ugK0rSM6QKgVvSqRdP
	 Mpu9sJB41C/wmo4mQeKZa7KgvsvrTf4sA2fCN3nU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52AKdrZw014291
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Mar 2025 15:39:53 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Mar 2025 15:39:53 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Mar 2025 15:39:53 -0500
Received: from localhost (udba0500997.dhcp.ti.com [128.247.81.249])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52AKdrj4045308;
	Mon, 10 Mar 2025 15:39:53 -0500
Date: Mon, 10 Mar 2025 15:39:53 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        Darren
 Etheridge <detheridge@ti.com>
Subject: Re: [meta-ti] [scarthgap][PATCH 1/2] ti-bsp: ti-img-encode-decode:
 Add Recipe for Building VXE-VXD Out-of-Tree Module
Message-ID: <20250310203953.odjau32sbqbulruq@udba0500997>
References: <20250306203749.794759-1-b-brnich@ti.com>
 <182A59C7642211D5.31492@lists.yoctoproject.org>
 <182B88F400236EE2.13955@lists.yoctoproject.org>
 <20250310202926.GS1879@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250310202926.GS1879@denix.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Mar 2025 20:39:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18366

Hi Denys,

On 16:29-20250310, Denys Dmytriyenko wrote:
> On Mon, Mar 10, 2025 at 03:50:56PM -0400, Denys Dmytriyenko wrote:
> > On Thu, Mar 06, 2025 at 06:15:13PM -0500, Denys Dmytriyenko wrote:
> > > On Thu, Mar 06, 2025 at 02:37:48PM -0600, Brandon Brnich via lists.yoctoproject.org wrote:
> > > > During 10.0 LTS bringup, the decision was made that it would be the last LTS
> > > > that carried the IMG VXE and VXD driver in tree. Driver is now hosted on
> > > > git.ti.com. This recipe is responsible for pulling in the driver,
> > > > building it, and packaging it within the J721e SDK.
> > > > 
> > > > Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> > > > ---
> > > > 
> > > > This build was tested by changing the kernel to point towards latest
> > > > head that has relevant device tree changes and config options. Build is
> > > > successful with those changes and no warnings are present.
> > > > 
> > > >  .../ti-vxe-vxd-driver_6.12.bb                 | 23 +++++++++++++++++++
> > > >  1 file changed, 23 insertions(+)
> > > >  create mode 100644 meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
> > > > 
> > > > diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
> > > > new file mode 100644
> > > > index 00000000..fa2d3792
> > > > --- /dev/null
> > > > +++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
> > > > @@ -0,0 +1,23 @@
> > > > +DESCRIPTION =  "Kernel drivers for the VXE384 and D5500 Video Accelerators found in the J721E TI SoC"
> > > 
> > > Shorter SUMMARY is missing?

Should I just change DESCRIPTION to SUMMARY? Why need both?

> > > 
> > > 
> > > > +LICENSE = "GPL-2.0-only"
> > > > +LIC_FILES_CHKSUM = "file://README;beginline=11;endline=12;md5=ad10b552e357ac443ec5dd2e02912b1b"
> > > > +
> > > > +inherit module
> > > > +
> > > > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > > +
> > > > +COMPATIBLE_MACHINE = "j721e"
> > > > +
> > > > +DEPENDS += "virtual/kernel"
> > > > +
> > > > +BRANCH = "scarthgap/k${PV}"
> > > > +
> > > > +SRC_URI = "git://git.ti.com/multimedia/img-vxe-vxd.git;protocol=https;branch=${BRANCH}"
> > 
> > Also, SRC_URI is incorrect - should be git://git.ti.com/git/multimedia/... for 
> > https access (i.e. one level of /git/ is missing):
> > 
> > WARNING: ti-vxe-vxd-driver-6.12-r0 do_fetch: Failed to fetch URL git://git.ti.com/multimedia/img-vxe-vxd.git;protocol=https;branch=scarthgap/k6.12, attempting MIRRORS if available
> > 
> > Just do this to see other examples in meta-ti:
> > 
> > $ grep 'git://git.ti.com' * -r

Okay will also fix.

> 
> And it fails to build:
> 
> | /OE/arago-master/build/arago-tmp-default/work/j721e_evm-oe-linux/ti-vxe-vxd-driver/6.12/git/encoder/vxe_enc.c:24:9: warning: "MAX" redefined
> |    24 | #define MAX(a, b, type) ({ \
> |       |         ^~~
> | In file included from /OE/arago-master/build/arago-tmp-default/work-shared/j721e-evm/kernel-source/include/linux/kernel.h:28,
> |                  from /OE/arago-master/build/arago-tmp-default/work-shared/j721e-evm/kernel-source/arch/arm64/include/asm/cpufeature.h:26,
> |                  from /OE/arago-master/build/arago-tmp-default/work-shared/j721e-evm/kernel-source/arch/arm64/include/asm/processor.h:38,
> |                  from /OE/arago-master/build/arago-tmp-default/work-shared/j721e-evm/kernel-source/include/linux/sched.h:13,
> |                  from /OE/arago-master/build/arago-tmp-default/work-shared/j721e-evm/kernel-source/include/linux/ratelimit.h:6,
> |                  from /OE/arago-master/build/arago-tmp-default/work-shared/j721e-evm/kernel-source/include/linux/dev_printk.h:16,
> |                  from /OE/arago-master/build/arago-tmp-default/work-shared/j721e-evm/kernel-source/include/linux/device.h:15,
> |                  from /OE/arago-master/build/arago-tmp-default/work-shared/j721e-evm/kernel-source/include/linux/dma-mapping.h:8,
> |                  from /OE/arago-master/build/arago-tmp-default/work/j721e_evm-oe-linux/ti-vxe-vxd-driver/6.12/git/encoder/vxe_enc.c:16:
> | /OE/arago-master/build/arago-tmp-default/work-shared/j721e-evm/kernel-source/include/linux/minmax.h:330:9: note: this is the location of the previous definition
> |   330 | #define MAX(a,b) __cmp(max,a,b)
> |       |         ^~~
> |   LD [M]  /OE/arago-master/build/arago-tmp-default/work/j721e_evm-oe-linux/ti-vxe-vxd-driver/6.12/git/vxe-enc.o
> |   LD [M]  /OE/arago-master/build/arago-tmp-default/work/j721e_evm-oe-linux/ti-vxe-vxd-driver/6.12/git/vxd-dec.o
> |   MODPOST /OE/arago-master/build/arago-tmp-default/work/j721e_evm-oe-linux/ti-vxe-vxd-driver/6.12/git/Module.symvers
> | ERROR: modpost: "vb2_dma_sg_memops" [/OE/arago-master/build/arago-tmp-default/work/j721e_evm-oe-linux/ti-vxe-vxd-driver/6.12/git/vxe-enc.ko] undefined!
> | ERROR: modpost: "vb2_dma_sg_memops" [/OE/arago-master/build/arago-tmp-default/work/j721e_evm-oe-linux/ti-vxe-vxd-driver/6.12/git/vxd-dec.ko] undefined!
> | make[4]: *** [/OE/arago-master/build/arago-tmp-default/work-shared/j721e-evm/kernel-source/scripts/Makefile.modpost:145: /OE/arago-master/build/arago-tmp-default/work/j721e_evm-oe-linux/ti-vxe-vxd-driver/6.12/git/Module.symvers] Error 1
> 

I added this in the notes section that the kernel commit needed to point
at the HEAD of TI's 6.12.y-cicd branch in order to build due to a config
issue. The driver built and was validated against Scarthgap.

This patch can already be found in scarthgap tree[0]. I will submit new
patch to fix up the other comments you have made.

[0]: https://git.ti.com/cgit/arago-project/meta-ti/commit/?h=scarthgap&id=296344c8ea44b958269352cd5a417adfd9df9857

Best,
Brandon

> 
> 
> > > > +
> > > > +SRCREV = "99d063aa0ef53633057042570411b84bd967624b"
> > > > +
> > > > +TARGET_PRODUCT:j721e = "j721e_linux"
> > > > +
> > > > +S = "${WORKDIR}/git"
> > > > +
> > > > +EXTRA_OEMAKE += 'KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
> > > > -- 
> > > > 2.34.1

