Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E93B4E010C0; Fri, 13 Jul 2018 12:12:58 -0700 (PDT)
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
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E98CE00D33
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 12:12:58 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6DJCwZP101297
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 14:12:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531509178;
	bh=wcKRJ96+KihuAoiu91cyWEdynQtfM5pmyz0qmff5AYM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=lF2aER8vyNVQCaamSWwinqwyhcQvDnbSEf5xaHDAH/kPdZkZqqqn2y+AysBfilm8I
	ecKK2Ohw2UXkuVCJS8cc7CowonBu1d9B06QsFDp1MdpK247lJD0J0fbeeIu/07FtNT
	n8ZPz6CLKVncKk3s37UO6v+UhbTRdrtIgi5UtDGQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DJCwci001070
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 14:12:58 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 13 Jul 2018 14:12:57 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 13 Jul 2018 14:12:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DJCuMs008040;
	Fri, 13 Jul 2018 14:12:57 -0500
Date: Fri, 13 Jul 2018 15:12:17 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20180713191216.GL25410@beryl>
References: <1531509016-6395-1-git-send-email-e-ruei1@ti.com>
	<1531509016-6395-3-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1531509016-6395-3-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v3 2/3] ti-sgx-ddk-um: add k3 (AM654x) support
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
X-List-Received-Date: Fri, 13 Jul 2018 19:12:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jul 13, 2018 at 03:10:15PM -0400, Eric Ruei wrote:
> - add COMPATIBLE_MACHINE to distinguish AM3/4/5 with K3 (AM654x)
> - add k3 support based on SGX DDK 1.17
> 
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb      |  1 +
>  ...ddk-um_1.14.3699939.bb => ti-sgx-ddk-um_1.17.4948957.bb} | 13 +++++--------
>  2 files changed, 6 insertions(+), 8 deletions(-)
>  copy recipes-graphics/libgles/{ti-sgx-ddk-um_1.14.3699939.bb => ti-sgx-ddk-um_1.17.4948957.bb} (87%)
> 
> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> index d17411e..ef33d3a 100644
> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> @@ -3,6 +3,7 @@ HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-um-linux"
>  LICENSE = "TI-TSPA"
>  LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=550702a031857e0426ef7d6f6cf2d9f4"
>  
> +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  BRANCH = "ti-img-sgx/rocko/${PV}"
> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> similarity index 87%
> copy from recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> copy to recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> index d17411e..8ac772d 100644
> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -1,14 +1,16 @@
>  DESCRIPTION = "Userspace libraries for PowerVR SGX chipset on TI SoCs"
>  HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-um-linux"
>  LICENSE = "TI-TSPA"
> -LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=550702a031857e0426ef7d6f6cf2d9f4"
> +LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=b17390502bc89535c86cfbbae961a2a8"
> +
> +COMPATIBLE_MACHINE = "k3"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  BRANCH = "ti-img-sgx/rocko/${PV}"
>  
>  SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "358fe42d34a7570896e5d1639869da564ddd0484"
> +SRCREV = "a564d20ec1b6aed55b3e60aa9ff35f3809eca110"
>  
>  # There's only hardfp version available
>  python __anonymous() {
> @@ -17,14 +19,9 @@ python __anonymous() {
>          return
>      pkgn = d.getVar("PN")
>      pkgv = d.getVar("PV")
> -    if "callconvention-hard" not in tunes:
> -        bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
> -        raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))

Please remove the anonymous function entirely - it's useless now.


>  }
>  
> -TARGET_PRODUCT_omap-a15 = "jacinto6evm"
> -TARGET_PRODUCT_ti33x = "ti335x"
> -TARGET_PRODUCT_ti43x = "ti437x"
> +TARGET_PRODUCT_k3 = "ti654x"
>  
>  INITSCRIPT_NAME = "rc.pvr"
>  INITSCRIPT_PARAMS = "defaults 8"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

