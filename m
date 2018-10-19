Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 82071E00A54; Thu, 18 Oct 2018 17:27:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5B12CE0097C
	for <meta-ti@yoctoproject.org>; Thu, 18 Oct 2018 17:27:13 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9J0RC11075015;
	Thu, 18 Oct 2018 19:27:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1539908832;
	bh=x385f/S6TqzGWhdkb1XziABUpWLvAT66n84Yb1vudKI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=b0vlle0ALeFheBovij6yp+ULKJ3Wgcnu7lOPxLFHCH2WHoB7qfw2ZY6laoGqKMWpk
	7bqCdfkvXL/ENJE1bGuRn3XyLi3Y/lWWLyZVBwBnVS+o3EH2hCV0mpfnWJE3H5xfYc
	0MtRhqLbsU+PIXPZHHmVcqdu3Rs0fGo10RfOnmVc=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9J0RCkE031141;
	Thu, 18 Oct 2018 19:27:12 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 18 Oct 2018 19:27:11 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 18 Oct 2018 19:27:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9J0RBvC011191;
	Thu, 18 Oct 2018 19:27:11 -0500
Date: Thu, 18 Oct 2018 20:27:11 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181019002711.GA10501@beryl>
References: <20181018054946.22407-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20181018054946.22407-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org, Tom Rini <trini@konsulko.com>
Subject: Re: [PATCH] u-boot: Alawys build with disabled PIE
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
X-List-Received-Date: Fri, 19 Oct 2018 00:27:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 17, 2018 at 10:49:46PM -0700, Khem Raj wrote:
> some OE distros can default to hardened toolchains which means PIE is
> added implicitly to compiler cmdline, here this options makes sure that
> whattever the default toolchain are, u-boot is not impacted
> 
> Fixes errors e.g.
> 
> | arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not fit in region `.sram'
> | arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 bytes
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: Denys Dmytriyenko <denys@ti.com>

Thanks, merged!


> ---
>  .../0001-Always-build-with-fno-PIE.patch      | 35 +++++++++++++++++++
>  .../u-boot/u-boot-ti-staging_2018.01.bb       |  2 ++
>  2 files changed, 37 insertions(+)
>  create mode 100644 recipes-bsp/u-boot/files/0001-Always-build-with-fno-PIE.patch
> 
> diff --git a/recipes-bsp/u-boot/files/0001-Always-build-with-fno-PIE.patch b/recipes-bsp/u-boot/files/0001-Always-build-with-fno-PIE.patch
> new file mode 100644
> index 00000000..dfd99c66
> --- /dev/null
> +++ b/recipes-bsp/u-boot/files/0001-Always-build-with-fno-PIE.patch
> @@ -0,0 +1,35 @@
> +From ec81bbe3ea7e077512f4b9d2b4aa87e7f1494bcc Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 17 Oct 2018 22:32:57 -0700
> +Subject: [PATCH] Always build with -fno-PIE
> +
> +GNU Toolchains can be configured to generate PIE by default
> +while PIE could be ok, it is known that u-boot/SPL on ARM starts to
> +generate bigger code and starts to overflow the SRAM size, therefore
> +disabling PIE explcitly insulates against toolchain intrinsic defaults
> +
> +Fixes errors like
> +| arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not fit in region `.sram'
> +| arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 bytes
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Cc: Tom Rini <trini@konsulko.com>
> +---
> + Makefile | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/Makefile b/Makefile
> +index 45cd751ba3..9eb8ac564e 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -592,6 +592,7 @@ KBUILD_CFLAGS	+= -O2
> + endif
> + 
> + KBUILD_CFLAGS += $(call cc-option,-fno-stack-protector)
> ++KBUILD_CFLAGS += $(call cc-option,-fno-PIE)
> + KBUILD_CFLAGS += $(call cc-option,-fno-delete-null-pointer-checks)
> + 
> + KBUILD_CFLAGS	+= -g
> +-- 
> +2.19.1
> +
> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
> index cbb8857a..c9c97111 100644
> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
> @@ -5,3 +5,5 @@ PR = "r24"
>  BRANCH = "ti-u-boot-2018.01"
>  
>  SRCREV = "2cc52408bf1357f11b96548e78223a1df321c1ae"
> +
> +SRC_URI += "file://0001-Always-build-with-fno-PIE.patch"
> -- 
> 2.19.1
> 

