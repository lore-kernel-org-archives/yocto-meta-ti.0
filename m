Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4D0C6E00828; Fri,  9 Jan 2015 13:47:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CCE58E0070B
	for <meta-ti@yoctoproject.org>; Fri,  9 Jan 2015 13:46:54 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t09LkoEv021840;
	Fri, 9 Jan 2015 15:46:50 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t09Lkoav002862;
	Fri, 9 Jan 2015 15:46:50 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 9 Jan 2015 15:46:49 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t09Lkn5M013870;
	Fri, 9 Jan 2015 15:46:49 -0600
Date: Fri, 9 Jan 2015 16:46:48 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Message-ID: <20150109214648.GU4759@edge>
References: <549D8379.2060800@inventec.ch>
 <549D8CF3.4080006@pabigot.com>
MIME-Version: 1.0
In-Reply-To: <549D8CF3.4080006@pabigot.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, nm@ti.com,
	Christian d'Heureuse <chdh@inventec.ch>
Subject: Re: mis-definition of SLEWCTRL_FAST in dt-bindings amxxxx header
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
X-List-Received-Date: Fri, 09 Jan 2015 21:47:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Dec 26, 2014 at 10:29:39AM -0600, Peter A. Bigot wrote:
> On 12/26/2014 09:49 AM, Christian d'Heureuse wrote:
> >Hi Peter
> >
> >I stumbled on the same error in am33xx.h as you described in September:
> >https://lists.yoctoproject.org/pipermail/meta-ti/2014-September/005211.html
> >
> >
> >Did you get any reactions?
> 
> Just the follow-up theorizing it'd been fixed upstream.  As of
> today, it's still wrong in both am33xx.h and am43xx.h when
> "upstream" means the torvalds master branch.
> 
> I keep hoping a TIer will step up, but if not I suppose somebody
> else has to do it.
> 
> Maybe E2E will yield results. http://e2e.ti.com/support/arm/sitara_arm/f/791/p/367445/1382229#1382229


Peter,

For the record, here are 2 replies from one of our kernel developers (Cc-ed) 
that I received for my inquiries on your question back in September, stating 
it's in upstream, after which I closed it:


> 1. Should rather be SLEWCONTROL like DRA7 rather than _FAST or _SLOW. that 
> avoids all kind of messed up translation.
> 
> OR should define both _FAST and SLOW for all SoCs equally..


> 2. Even better - if the change - like this one is already present in 
> upstream kernel(which in this case is actually in upstream) - ask the public 
> person to directly ask on linux-omap mailing list (public).


Since meta-ti is not specifically a kernel mailing list, there's less chance 
to get it resolved through here. Please use corresponding upstream mailing 
lists - linux-omap@vger.kernel.org is the closest one here, or either 
devicetree@vger.kernel.org or linux-soc@vger.kernel.org or even E2E forums. 

You wouldn't send this to Debian, Ubuntu or even Buildroot mailing lists, 
would you? Similarly, this list is for OpenEmbedded/Yocto layer - the best I 
can do is forward questions and answers back and forth, which is not very 
efficient. So, reporting this on one of the kernel lists would have yelded 
better results, I'd say, since that's where kernel devs are hanging out - 
they don't usually frequent Yocto lists, unfortunately.

Best regards,

-- 
Denys


> >The error is still in the current Linux source:
> >
> >https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/tree/include/dt-bindings/pinctrl/am33xx.h
> >
> >
> >#define SLEWCTRL_FAST           (1 << 6)
> >
> >In the old Rowboat kernel, the definition was correct:
> >
> >https://gitorious.org/rowboat/kernel/source/03f2a1e9ea7f8b11ff6809f5a75b614011f8adb6:arch/arm/mach-omap2/mux.h
> >
> >
> >#define AM33XX_SLEWCTRL_FAST            (0 << 6)
> >#define AM33XX_SLEWCTRL_SLOW            (1 << 6)
> >
> >An in the AM335X Technical Reference Manual
> >http://www.ti.com/lit/ug/spruh73k/spruh73k.pdf
> >"slewctrl" bit:
> >"9.2.2 Pad Control Registers"
> >"9.3.1.50 conf_<module>_<pin> Register"
> >
> >According to https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/log/include/dt-bindings/pinctrl/am33xx.h
> >the author is
> >Florian Vaussard <florian.vaussard@epfl.ch> and the committer is
> >Benoit Cousson <benoit.cousson@linaro.org>. Maybe we could write
> >one of them?
> >
> >Christian
> >http://www.source-code.biz  http://www.inventec.ch/chdh
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

