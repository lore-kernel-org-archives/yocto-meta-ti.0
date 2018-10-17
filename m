Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F0115E00ABE; Wed, 17 Oct 2018 13:13:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 68652E00A0C
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 13:13:26 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9HKDP3k105915;
	Wed, 17 Oct 2018 15:13:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1539807205;
	bh=XDEdCF5k5mjlwn8rJWTtwe/U4r4O8zcOvSyA+F7frUE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=GjfOR3h6V4CPwtyQPPltIY47/oAqNRmcTr/lBya7HgpKgpyIQFf7bsXySAOFfR6Sy
	NP+FGQ5U/gxHWlE6aVxU6QeyWnah0xzcQrp3NGkAAVGyQexNZcsicZyBRbBUIW/95/
	CYhQsZ1iVVIbThLKQxfNWluNcQMTojwvtGxY1hRM=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9HKDPqD014468;
	Wed, 17 Oct 2018 15:13:25 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 17 Oct 2018 15:13:25 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 17 Oct 2018 15:13:25 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9HKDP8M027150;
	Wed, 17 Oct 2018 15:13:25 -0500
Date: Wed, 17 Oct 2018 16:13:25 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181017201324.GM4031@beryl>
References: <20181017200200.2296-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20181017200200.2296-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH V2 4/5] beaglebone.conf: Package kernel and devicetree
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
X-List-Received-Date: Wed, 17 Oct 2018 20:13:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 17, 2018 at 01:02:00PM -0700, Khem Raj wrote:
> Use variables from upstream u-boot, makes it easy to switch to
> mainline u-boot from oe-core if someone wants to

Thanks for addressing most of my comments. If you don't mind, I'll re-phrase 
this comment slightly.


> Use SPL_BINARY and UBOOT_SUFFIX to define IMAGE_BOOT_FILES
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> V2: Use SPL_BINARY var
> 
>  conf/machine/beaglebone.conf | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
> index 25147926..36920673 100644
> --- a/conf/machine/beaglebone.conf
> +++ b/conf/machine/beaglebone.conf
> @@ -1,6 +1,6 @@
>  #@TYPE: Machine
>  #@NAME: BeagleBone machine
> -#@DESCRIPTION: Machine configuration for the http://beagleboard.org/bone board 
> +#@DESCRIPTION: Machine configuration for the http://beagleboard.org/bone board
>  
>  require conf/machine/include/ti33x.inc
>  
> @@ -17,10 +17,16 @@ SERIAL_CONSOLE = "115200 ttyS0"
>  #UBOOT_MACHINE = "am335x_boneblack_config"
>  
>  WKS_FILE = "sdimage-bootpart.wks"
> -IMAGE_BOOT_FILES = "MLO u-boot.img"
> -IMAGE_FSTYPES += "tar.xz wic.xz"
>  
>  do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
> +IMAGE_BOOT_FILES ?= "u-boot.${UBOOT_SUFFIX} ${SPL_BINARY}"
> +
> +IMAGE_FSTYPES += "tar.xz wic.xz"
>  
>  # Refine the list of device targets for ti-pdk class recipes
>  TI_PDK_LIMIT_BOARDS = "bbbAM335x"
> +
> +SPL_BINARY = "MLO"
> +UBOOT_SUFFIX = "img"
> +
> +IMAGE_INSTALL_append = " kernel-devicetree kernel-image-zimage"
> -- 
> 2.19.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

