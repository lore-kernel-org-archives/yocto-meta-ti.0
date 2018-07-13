Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 682EFE0120A; Fri, 13 Jul 2018 12:50:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B4A2E0080A
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 12:50:18 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6DJoIuh022995
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 14:50:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531511418;
	bh=iHfww/gqqhm2dxYEHd3/aBQPOyIxZfpFe0/CNlfAbo8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=H2Joy7mCrhMDjdc3Z9CakjQRWl/8Ovn1XFOFoMZzhwgXayXiT6WmO/rL19rk1uHiP
	sINFUUtkmfPsAxX9Z4cJGq8SoC35I1UmWj9UM5ByBWatN16xdtX9GU8F6wR8dImnGP
	+6H7aJn6A4WTB+vXhgp7hI8lQBOyAkKbZrTdc6aM=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DJoIK8013862
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 14:50:18 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 13 Jul 2018 14:50:18 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 13 Jul 2018 14:50:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DJoHip021471;
	Fri, 13 Jul 2018 14:50:17 -0500
Date: Fri, 13 Jul 2018 15:49:39 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Ruei, Eric" <e-ruei1@ti.com>
Message-ID: <20180713194938.GN25410@beryl>
References: <1531509016-6395-1-git-send-email-e-ruei1@ti.com>
	<1531509016-6395-4-git-send-email-e-ruei1@ti.com>
	<20180713191439.GM25410@beryl>
	<f2cb8560ec1246eba91c8b3db3f1defb@ti.com>
MIME-Version: 1.0
In-Reply-To: <f2cb8560ec1246eba91c8b3db3f1defb@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v3 3/3] ti-sgx-ddk-km: add k3 (AM654x) support
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jul 2018 19:50:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Fair point about kernel module. I was more concerned about UM binaries.
I wonder if we should keep the kernel module and its path synced up with 
UM part, or otherwise it may be confusing...

-- 
Denys


On Fri, Jul 13, 2018 at 03:21:46PM -0400, Ruei, Eric wrote:
> The kernel module is the same for all window system.
> The DDK 1.17 provides three window systems (nulldrmws, wayland and org (default)).
>  I can create the one for nulldrmws by export the environment variable WINDOW_SYSTEM=nulldrmws
> Is there a way that I can do that at the recipe?
> 
> Best regards,
> 
> Eric
> 
> 
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Friday, July 13, 2018 3:15 PM
> To: Ruei, Eric
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH v3 3/3] ti-sgx-ddk-km: add k3 (AM654x) support
> 
> On Fri, Jul 13, 2018 at 03:10:16PM -0400, Eric Ruei wrote:
> > - add K3 (AM654x) support based on SGX DDK 1.17
> > 
> > Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> > ---
> >  ...gx-ddk-km_1.14.3699939.bb => ti-sgx-ddk-km_1.17.4948957.bb} | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> >  copy recipes-bsp/powervr-drivers/{ti-sgx-ddk-km_1.14.3699939.bb => ti-sgx-ddk-km_1.17.4948957.bb} (75%)
> > 
> > diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> > similarity index 75%
> > copy from recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
> > copy to recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> > index a4eb82a..3ce9105 100644
> > --- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
> > +++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> > @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=74506d9
> >  
> >  inherit module
> >  
> > -COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
> > +COMPATIBLE_MACHINE = "k3"
> >  
> >  MACHINE_KERNEL_PR_append = "o"
> >  PR = "${MACHINE_KERNEL_PR}"
> > @@ -26,11 +26,9 @@ SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch
> >  
> >  S = "${WORKDIR}/git"
> >  
> > -SRCREV = "d2b3959738cfcc6209e8e882d1989de790866c8f"
> > +SRCREV = "b630d462f5fbb86e5f98965ba1af35da1207822f"
> >  
> > -TARGET_PRODUCT_omap-a15 = "jacinto6evm"
> > -TARGET_PRODUCT_ti33x = "ti335x"
> > -TARGET_PRODUCT_ti43x = "ti437x"
> > +TARGET_PRODUCT_k3 = "ti654x"
> >  
> >  EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" TARGET_PRODUCT=${TARGET_PRODUCT}'
> >  
> > @@ -39,5 +37,5 @@ do_compile_prepend() {
> >  }
> >  
> >  do_install() {
> > -    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary2_omap_linux_release/target/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
> > +    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary_omap_linux_xorg_release/target_aarch64/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
> 
> BTW, are these binaries with X11 or Wayland support? I see path has xorg here ^^^
> 
> 
> >  }
> > -- 
> > 1.9.1
> > 
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

