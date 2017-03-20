Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2FDD5E0083C; Mon, 20 Mar 2017 13:15:23 -0700 (PDT)
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
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9E4CE00726
	for <meta-ti@yoctoproject.org>; Mon, 20 Mar 2017 13:15:18 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2KKFH1e009761;
	Mon, 20 Mar 2017 15:15:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490040917;
	bh=BKHXVug8HsgdNwKKXpcPgsRl+qKo6Vp7NY3mWaQsBPQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Q7MA8badtHQBJ1XUTE+P83eeTVFuqD9Of2pLJxGsm8J7jDHnA0r9Gk54zgbLvYlgu
	y8KGIWmcJbFQ18SpjRDhGlpcrwVPYs4XOgjlTh4bda6PwxabsKXPv6rBZl9MBho6HF
	Nhm6RN6qMbebZWTglCpUXBXvuE1fFbj+87BF9GKI=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2KKFHxv027806;
	Mon, 20 Mar 2017 15:15:17 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 20 Mar 2017 15:15:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2KKFGGU022160;
	Mon, 20 Mar 2017 15:15:17 -0500
Date: Mon, 20 Mar 2017 16:15:16 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Glenn Schmottlach <gschmottlach@gmail.com>
Message-ID: <20170320201516.GD23524@edge>
References: <CAMS2kBEyHe6y3rKD0RV=LXnSXR8kQY7yHuHtBQrb5gvDiX4RCg@mail.gmail.com>
	<20170320155459.GP14484@edge>
	<CAMS2kBE1mvJT5y=WiL1YvLY6-sdkCdZDvLMLL=i4wOqxA7QxXw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMS2kBE1mvJT5y=WiL1YvLY6-sdkCdZDvLMLL=i4wOqxA7QxXw@mail.gmail.com>
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
X-List-Received-Date: Mon, 20 Mar 2017 20:15:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 20, 2017 at 02:14:01PM -0400, Glenn Schmottlach wrote:
> On Mon, Mar 20, 2017 at 11:54 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> > On Mon, Mar 20, 2017 at 11:44:16AM -0400, Glenn Schmottlach wrote:
> >> I am having trouble modifying the kernel configuration for the
> >> following TI kernel recipe using the Yocto Morty environment:
> >>
> >> linux-ti-staging-rt_4.9.bb
> >>
> >> I have created my own layer and with a *.bbappend file for this recipe, e.g.
> >>
> >> linux-ti-staging-rt_4.9.bbappend
> >>
> >> It appears the TI kernel recipes are not (yet) proper "Yocto" kernel
> >> recipes in that they are not "fragment" aware.
> >
> > TI kernel recipe is not "Yocto" kernel (which is really to say WindRiver
> > format), but the fragment support got upstreamed to the mainline kernel and
> > kernel itself now supports config fragments! That is what TI kernel uses and
> > meta-ti kernel recipe supports.
> 
> Thanks for that clarification. I wasn't aware of the two "flavors" of
> fragment support. It certainly would be nice if a consistent approach
> (between Yocto and the Kernel) could be adopted. I suspect this will
> be sorted out in time.

Well, not that there are 2 flavors. It's just historically many BSPs pushed 
back on adopting linux-yocto/kernel-yocto.bbclass, as it was developed by an 
OSV and, besides config fragments, was also doing few other things that would 
not work for pure kernel developers. But everyone liked the config fragments 
support, so said OSV ended up upstreaming that portion to the kernel itself:
https://github.com/torvalds/linux/blob/master/scripts/kconfig/merge_config.sh


> >> It appears I cannot do
> >> the following inside of my *.bbappend recipe:
> >>
> >> FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> >> SRC_URI += "file://eem.cfg"
> >
> > You can add any additional fragments you want to be applied by the recipe to
> > KERNEL_CONFIG_FRAGMENTS variable.
> 
> This what I ultimately did . . . appended a fully qualified path to my
> fragment to the KERNEL_CONFIG_FRAGMENTS variable. As a suggestion,
> this might be something useful to include in the README for the
> meta-ti layer. I suspect others might have a similar need to modify
> the kernel configuration and once described, it (now) seems
> straightforward.

I'll look into adding some basic documentation for it...


> >> Inside of "eem.cfg" I want to set the following kernel options:
> >>
> >> CONFIG_USB_NET_CDC_EEM=m
> >> CONFIG_USB_F_EEM=m
> >> CONFIG_USB_ETH_EEM=y
> >>
> >> This has no affect. I tried creating my own defconfig based on the
> >> '.config' generated from the original recipe. I modified my *.bbappend
> >> file as follows:
> >>
> >> FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> >> SRC_URI += "file://defconfig"
> >>
> >> Again, my defconfig is not applied to the build.
> >
> > It already has file://defconfig in SRC_URI, that's how it works and gets the
> > fragments assembled.
> >
> > What's your platform? Are you sure one of the existing defconfigs are not
> > used instead?
> 
> I'm building for a BeagleBoneBlack so I expect it's using the
> defconfig for that platform.

So, beaglebone.conf sets up SOC_FAMILY to use "ti33x" override, hence it uses 
defconfig in the corresponding ti33x directory. And that defconfig is just a 
redirect to "ti_sdk_am3x_release" entry in the map file I explain below.

That said, since you prepend to FILESEXTRAPATHS and provide your own full 
defconfig, I expect it to take precedence and overwrite everything our recipe 
does - so not sure what didn't work here in your case...


> >> I even tried patching kernel-source/ti_config_fragments and placing a
> >> eem.cfg in that directory hoping the configuration generation script
> >> (defconfig_builder.sh) might apply this fragment.
> >>
> >> FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> >> SRC_URI += "file://0001-eem-config.patch"
> >>
> >> Where the patch contains:
> >>
> >> Index: kernel-source/ti_config_fragments/eem.cfg
> >> ===================================================================
> >> --- /dev/null
> >> +++ kernel-source/ti_config_fragments/eem.cfg
> >> @@ -0,0 +1,4 @@
> >> +CONFIG_USB_NET_CDC_EEM=m
> >> +CONFIG_USB_F_EEM=m
> >> +CONFIG_USB_ETH_EEM=y
> >> +
> >>
> >> Unfortunately this did not work either.
> >
> > You also need to update the "map" file, which basically lists all the
> > fragments it needs to assemble for a platform. And platform's defconfig only
> > points to one of the entries in the map file.
> 
> Sorry if I'm a bit dense, but could you elaborate on this "map" file.
> Where do I find it? What do I need to change? Do I need modify this
> file in addition to modifying the KERNEL_CONFIG_FRAGMENTS as you
> mentioned above?

Since our kernel developers don't do "yocto" builds directly, when working on 
the kernel, they needed a standalone way to assemble the defconfig from 
fragments. That's why we have this defconfig_builder.sh script and all the 
fragments inside ti_config_fragments directory. And there's defconfig_map.txt 
file along with them to define what and in which order has to be merged:
http://git.ti.com/gitweb/?p=ti-linux-kernel/ti-linux-kernel.git;a=blob;f=ti_config_fragments/defconfig_map.txt;h=1e3dbf436f3242b1239154dad734e87a08431d13;hb=refs/heads/ti-lsk-linux-4.9.y

If you use KERNEL_CONFIG_FRAGMENTS variable in the recipe to list additional 
config fragments, you don't need to do anything else - that list will be 
applied on top of what defconfig_map.txt defines and what defconfig_builder.sh 
merges.


> Thanks for your patience (and help),

No problem. Let me know if you have more questions.

-- 
Denys

