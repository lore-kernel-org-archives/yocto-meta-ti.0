Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F3ED3E00DA4; Tue, 23 Jan 2018 14:16:23 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50F57E006D3
	for <meta-ti@yoctoproject.org>; Tue, 23 Jan 2018 14:16:22 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0NMGMYQ012311
	for <meta-ti@yoctoproject.org>; Tue, 23 Jan 2018 16:16:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1516745782;
	bh=iprVjPgw3jDyPTG/ZeQfZ/CQIstYInHesJpmYAer+9c=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=VQcidlMUg8scr4pP0aXQzzHHGiYev90uONlXdzW5KQkOwuJwvSWdJjzr9xeI1n08b
	DVYTaYGodkMDSeygl9rtM5vJvit7ohN01YlUGWYM/w9tIrX98d/80ICaRLk9xVIvy/
	yeB8Ey0D8aRFW8GqV0XTb/Px9dg+VDo/fRQ3FksY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0NMGMXV029960
	for <meta-ti@yoctoproject.org>; Tue, 23 Jan 2018 16:16:22 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 23 Jan 2018 16:16:21 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 23 Jan 2018 16:16:21 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0NMGLIg008140;
	Tue, 23 Jan 2018 16:16:21 -0600
Date: Tue, 23 Jan 2018 17:16:21 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Stephen Molfetta <sjmolfetta@ti.com>, "Stiffler, Jacob" <j-stiffler@ti.com>
Message-ID: <20180123221621.GA10142@edge>
References: <1516652148-16513-1-git-send-email-sjmolfetta@ti.com>
MIME-Version: 1.0
In-Reply-To: <1516652148-16513-1-git-send-email-sjmolfetta@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] dra7xx-evm.conf: removing am57xx SOCS from PDK
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
X-List-Received-Date: Tue, 23 Jan 2018 22:16:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

I assume, you want this merged into morty too, correct?

This change is fine with me, but I'd go even further and move setting initial 
TI_PDK_LIMIT_SOCS from omap-a15.inc into am57xx-evm.conf 


Jake,

Do you have any comments?


On Mon, Jan 22, 2018 at 02:15:48PM -0600, Stephen Molfetta wrote:
> opencl-monitor does not distinguish between dra7xx and am57xx devices,
> treating both as the same and attempting to build for am57xx regardless.
> However, this is dependent on common-csl-ip-rtos, a component of PDK,
> which in general does handle these devices differently.  The definition
> of am57xx SOCs in the PDK list from omap-15.conf gets inherited by
> dra7xx-evm.conf, thereby creating a rule that all dra7xx PDK recipes
> must build am57xx libraries. This results in a dra7xx image which is
> much larger than necessary, and more severely, creates an artifical
> dependency link between these two devices and introduces build failures
> for various PDK recipes.
> 
> Instead, we now override the PDK SOC definition in dra7xx-evm.conf, and
> only in the CSL RTOS recipe do we append the am57xx SOCS for dra7xx-evm
> machine build.  This allows for opencl-monitor to build successfully for
> dra7xx while preventing any other PDK recipes from attempting to build
> libraries for am57xx devices.
> 
> This is a workaround that must stay in place until opencl build can
> properly comprehend am57xx and dra7xx independently, and/or omap-a15
> is not implied to be synonymous with am57xx in various recipes.
> 
> Signed-off-by: Stephen Molfetta <sjmolfetta@ti.com>
> ---
>  conf/machine/dra7xx-evm.conf                        | 2 +-
>  recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb | 5 ++++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
> index 91afd85..7db9ff6 100644
> --- a/conf/machine/dra7xx-evm.conf
> +++ b/conf/machine/dra7xx-evm.conf
> @@ -40,4 +40,4 @@ UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
>  
>  # Set the list of device targets for ti-pdk class recipes
>  TI_PDK_LIMIT_BOARDS = "evmDRA72x evmDRA75x evmDRA78x"
> -TI_PDK_LIMIT_SOCS_append = " dra72x dra75x dra78x"
> +TI_PDK_LIMIT_SOCS = "dra72x dra75x dra78x"
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> index f4496b9..100d2f4 100644
> --- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> @@ -1,5 +1,5 @@
>  require common-csl-ip.inc
> -PR = "${INC_PR}.5"
> +PR = "${INC_PR}.6"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  COMPATIBLE_MACHINE_append = "|c66x"
> @@ -16,3 +16,6 @@ export DEST_ROOT="${S}"
>  
>  # HTML doc link params
>  PDK_COMP_LINK_TEXT = "CSL-Chip Support Library"
> +
> +# Workaround: dra7xx build requires am57xx CSL libraries for opencl-monitor
> +TI_PDK_LIMIT_SOCS_append_dra7xx = " am571x am572x"
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

