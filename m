Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9A971E00AFD; Mon, 20 Mar 2017 08:55:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DFE93E00AA7
	for <meta-ti@yoctoproject.org>; Mon, 20 Mar 2017 08:55:28 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2KFt7nx029741;
	Mon, 20 Mar 2017 10:55:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490025307;
	bh=HwadwxQ+vNwMPVrQvSJgWbfS54vOOw7YM+0bQBtuUmU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=tmdO5F3/8tLo+SGVpUHlXZLx1U9TjrHsmJIHN8KhnNccheBnHeBycE9EU5bQVH75y
	IdT6ZOyKQS1K3Dn4ZZoWXQsKUxBLhdzddAByqbWCvGEgZ8TpJ+gCCF3uqJQNMgCbbh
	ro2itZgvfcBj23DaoSES+St+VLoWXBnpk50BGnnM=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2KFt1W6013280;
	Mon, 20 Mar 2017 10:55:02 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 20 Mar 2017 10:55:02 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2KFt2wD013253;
	Mon, 20 Mar 2017 10:55:02 -0500
Date: Mon, 20 Mar 2017 11:54:59 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Glenn Schmottlach <gschmottlach@gmail.com>
Message-ID: <20170320155459.GP14484@edge>
References: <CAMS2kBEyHe6y3rKD0RV=LXnSXR8kQY7yHuHtBQrb5gvDiX4RCg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMS2kBEyHe6y3rKD0RV=LXnSXR8kQY7yHuHtBQrb5gvDiX4RCg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Trouble modifying defconfig for linux-ti-staging_rt recipe
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
X-List-Received-Date: Mon, 20 Mar 2017 15:55:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 20, 2017 at 11:44:16AM -0400, Glenn Schmottlach wrote:
> I am having trouble modifying the kernel configuration for the
> following TI kernel recipe using the Yocto Morty environment:
> 
> linux-ti-staging-rt_4.9.bb
> 
> I have created my own layer and with a *.bbappend file for this recipe, e.g.
> 
> linux-ti-staging-rt_4.9.bbappend
> 
> It appears the TI kernel recipes are not (yet) proper "Yocto" kernel
> recipes in that they are not "fragment" aware.

TI kernel recipe is not "Yocto" kernel (which is really to say WindRiver 
format), but the fragment support got upstreamed to the mainline kernel and 
kernel itself now supports config fragments! That is what TI kernel uses and 
meta-ti kernel recipe supports.


> It appears I cannot do
> the following inside of my *.bbappend recipe:
> 
> FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> SRC_URI += "file://eem.cfg"

You can add any additional fragments you want to be applied by the recipe to 
KERNEL_CONFIG_FRAGMENTS variable.


> Inside of "eem.cfg" I want to set the following kernel options:
> 
> CONFIG_USB_NET_CDC_EEM=m
> CONFIG_USB_F_EEM=m
> CONFIG_USB_ETH_EEM=y
> 
> This has no affect. I tried creating my own defconfig based on the
> '.config' generated from the original recipe. I modified my *.bbappend
> file as follows:
> 
> FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> SRC_URI += "file://defconfig"
> 
> Again, my defconfig is not applied to the build.

It already has file://defconfig in SRC_URI, that's how it works and gets the 
fragments assembled.

What's your platform? Are you sure one of the existing defconfigs are not 
used instead?


> I even tried patching kernel-source/ti_config_fragments and placing a
> eem.cfg in that directory hoping the configuration generation script
> (defconfig_builder.sh) might apply this fragment.
> 
> FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> SRC_URI += "file://0001-eem-config.patch"
> 
> Where the patch contains:
> 
> Index: kernel-source/ti_config_fragments/eem.cfg
> ===================================================================
> --- /dev/null
> +++ kernel-source/ti_config_fragments/eem.cfg
> @@ -0,0 +1,4 @@
> +CONFIG_USB_NET_CDC_EEM=m
> +CONFIG_USB_F_EEM=m
> +CONFIG_USB_ETH_EEM=y
> +
> 
> Unfortunately this did not work either.

You also need to update the "map" file, which basically lists all the 
fragments it needs to assemble for a platform. And platform's defconfig only 
points to one of the entries in the map file.


> I suspect this question has been asked before, but what is the
> RECOMMENDED procedure for making kernel configuration changes to the
> TI kernel recipes in a Yocto environment? What methods have others
> used to tweak the TI kernel options from their *.bbappend files?
> 
> Thanks for any insights . . .
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

