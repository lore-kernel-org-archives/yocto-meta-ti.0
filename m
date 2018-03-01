Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9EBAEE00E1A; Thu,  1 Mar 2018 13:36:10 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 92F5BE00DEE
	for <meta-ti@yoctoproject.org>; Thu,  1 Mar 2018 13:36:09 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w21La88I026577
	for <meta-ti@yoctoproject.org>; Thu, 1 Mar 2018 15:36:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519940168;
	bh=8BLDuuvOPDxhQ4lpkpsAp7+dYt6FEILpg/wTnVazW7Q=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZYN/lwQFNLJ1WKoUz3oQBsU/SQdCRA44druYH0E+jLytI5SVoqPZQJv0JC7PfyAe0
	srkIMAdMpuWqPvQ5AHvRRnXlCSrdpoq918F/USzDaumrOmleL8yJbsoljVcsFafbPp
	0Ofk5sV/h3Mq/jiVZwWB50bA60f/TSStSi/7L53E=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21La84L029278
	for <meta-ti@yoctoproject.org>; Thu, 1 Mar 2018 15:36:08 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 1 Mar 2018 15:36:08 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 1 Mar 2018 15:36:08 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21La8xe011641;
	Thu, 1 Mar 2018 15:36:08 -0600
Date: Thu, 1 Mar 2018 16:36:07 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Anand Balagopalakrishnan <anandb@ti.com>
Message-ID: <20180301213607.GT22424@edge>
References: <1519921195-10423-1-git-send-email-anandb@ti.com>
MIME-Version: 1.0
In-Reply-To: <1519921195-10423-1-git-send-email-anandb@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [FOR-KROGOTH 1/1] ti-sgx-ddk-um: wlpvr_ws: Map DBM buffers and populate meminfo
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
X-List-Received-Date: Thu, 01 Mar 2018 21:36:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Have you tested this patch?

On Thu, Mar 01, 2018 at 09:49:55PM +0530, Anand Balagopalakrishnan wrote:
> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> ---
>  recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> index 3a9a2b2..3e689cb 100644
> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> @@ -8,7 +8,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  BRANCH = "ti-img-sgx/${PV}"
>  
>  SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "d184140aa5c17e13e1bf21151f1a7bc068bdf8bf"
> +SRCREV = "2736a396f9c801fc0818d830f8a3215aeb8b6534"
>  
>  # There's only hardfp version available
>  python __anonymous() {
> @@ -31,7 +31,7 @@ INITSCRIPT_PARAMS = "defaults 8"
>  
>  inherit update-rc.d
>  
> -PR = "r23"
> +PR = "r24"
>  PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-um-linux"
>  
>  DEPENDS += "libdrm udev libgbm wayland libffi"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

