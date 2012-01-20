Return-Path: <tom.rini@gmail.com>
Received: from mail-qy0-f176.google.com (mail-qy0-f176.google.com
	[209.85.216.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6E2EE01346
	for <meta-ti@yoctoproject.org>; Fri, 20 Jan 2012 07:39:04 -0800 (PST)
Received: by qcsp19 with SMTP id p19so433904qcs.35
	for <meta-ti@yoctoproject.org>; Fri, 20 Jan 2012 07:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=u57oDrXbMmxBVoAJmbIfG6TzoqlVuTg0hxiI1JOiyNs=;
	b=DfJFogAsdqFOSU0WNbkKF+oWIm6HgL+y/Y7jEnRt+mmLV94/ta/vtJSIeA9OrmNjfg
	uBHGifvdJ3bsZMSDcnv5mEosVF1ZQQmMODMfsxu14DK8fsvqTYpelc8y30E79vjlgGPX
	SmN5qed4mu+Arp6O9T7V9qmgTSKAPrK3L0DJg=
MIME-Version: 1.0
Received: by 10.229.106.35 with SMTP id v35mr12625322qco.84.1327073944071;
	Fri, 20 Jan 2012 07:39:04 -0800 (PST)
Received: by 10.229.98.149 with HTTP; Fri, 20 Jan 2012 07:39:03 -0800 (PST)
In-Reply-To: <9F2249DF-2E56-4B4E-98CB-CE746690DCEC@dominion.thruhere.net>
References: <9F2249DF-2E56-4B4E-98CB-CE746690DCEC@dominion.thruhere.net>
Date: Fri, 20 Jan 2012 08:39:03 -0700
Message-ID: <CA+M6bXn-Rz=zrzAx0A6FVrRQrHr5uk2U17_UCPwOSC2FkN-HGg@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: meta-ti@yoctoproject.org
Subject: Re: [RFC] u-boot recipe naming
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jan 2012 15:39:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 20, 2012 at 5:41 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Hi,
>
> We currently have a problem with other layers including their own version of u-boot_2011.12.bb which confuses bitbake. To avoid such hassle in the future I'm going to propose using the kernel naming scheme for u-boot recipes as well:
>
> u-boot-denx_2011.12.bb -> u-boot from git.denx.de master + patches
> u-boot-ti_git.bb -> u-boot from git.denx.de ti branch + patches
> u-boot-psp-<soc>_git.bb -> u-boot from psp tree for $SoC + patches e.g. u-boot-psp-am18x_git.bb
>
> This should avoid filename based conflicts between layers and make it clearer which tree the recipe will be building.
>
> Thoughts/flames/opinions?

Works for me, but I do hope we need u-boot-ti_git.bb sparingly as I'm
just using that for requests for Albert to pull into u-boot-arm (it's
possible that stuff might stay in 'next' for a while, ie when merge
window closes but I don't want to lose stuff) so please make sure it's
marked as a rebasing git tree.

-- 
Tom

