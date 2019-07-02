Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 52F98E00C43; Tue,  2 Jul 2019 09:32:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C26F7E00961
	for <meta-ti@yoctoproject.org>; Tue,  2 Jul 2019 09:32:50 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62GWoFJ118503
	for <meta-ti@yoctoproject.org>; Tue, 2 Jul 2019 11:32:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562085170;
	bh=ixlAw8YeI8EX//2KmbY+fa8FTox4ZJHV7KtFY0uqEUo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=uS03O3k6UlqP+Sx2caJCamabL5/yi/FXC4TVr5JWYp2dl4HiNGYDNS0FojP+papH/
	3CuWCiH7rQ0TOsKLl6PEvdkaS407kvkhumejBkkauCTZg5e9pmwk3mEA/SKCt8SMAM
	jlKnKXcBohYFmbCS5nVpoGctsrfz8Ti+AkCL9goU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62GWoJC129810
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 2 Jul 2019 11:32:50 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 2 Jul 2019 11:32:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 2 Jul 2019 11:32:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62GWnTN063565;
	Tue, 2 Jul 2019 11:32:49 -0500
Date: Tue, 2 Jul 2019 12:32:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Gowtham Tammana <g-tammana@ti.com>
Message-ID: <20190702163249.GR21181@beryl>
References: <20190701234727.20511-1-g-tammana@ti.com>
MIME-Version: 1.0
In-Reply-To: <20190701234727.20511-1-g-tammana@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [thud][PATCH] ti-img-rogue-umlibs: Add missing wayland, expat rdepends
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
X-List-Received-Date: Tue, 02 Jul 2019 16:32:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jul 01, 2019 at 06:47:27PM -0500, Gowtham Tammana wrote:
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> ---
>  .../libgles/ti-img-rogue-umlibs_1.10.5187610.bb             | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb
> index f21432e2..26dfb7ca 100644
> --- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb
> +++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  COMPATIBLE_MACHINE = "j7-evm"
>  
> -PR = "r6"
> +PR = "r7"
>  
>  BRANCH = "linuxws/thud/k4.19/${PV}"
>  
> @@ -24,10 +24,10 @@ inherit update-rc.d
>  
>  PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm"
>  
> -DEPENDS += "libdrm"
> +DEPENDS += "libdrm wayland expat"

I don't believe you need these in DEPENDS - these are build-time dependencies.


>  RDEPENDS_${PN} += "bash"
>  RDEPENDS_${PN} += "python-core"
> -RDEPENDS_${PN} += "ti-img-rogue-driver"
> +RDEPENDS_${PN} += "ti-img-rogue-driver wayland expat"
>  
>  RPROVIDES_${PN} = "libegl libgles1 libgles2 libgbm"
>  RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> -- 
> 2.22.0
> 

