Return-Path: <wmills@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E1C3E013BB
	for <meta-ti@yoctoproject.org>; Wed,  1 Aug 2012 11:24:07 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q71IO5KH013436;
	Wed, 1 Aug 2012 13:24:05 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q71IO41t021807;
	Wed, 1 Aug 2012 13:24:04 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 1 Aug 2012 13:24:05 -0500
Received: from gtwmills.gt.design.ti.com (gtwmills.gt.design.ti.com
	[158.218.102.52])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q71IO4AS008088;	Wed, 1 Aug 2012 13:24:04 -0500
Message-ID: <50197444.2070406@ti.com>
Date: Wed, 1 Aug 2012 14:24:04 -0400
From: William Mills <wmills@ti.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.27) Gecko/20120216 Thunderbird/3.1.19
MIME-Version: 1.0
To: Matthew Spencer <matthew@thespencers.me.uk>
References: <CA+itjEGUuhwLOVADq5c5cntPyZQa1qqDZ2v4Y2YdpAC4bTHeaQ@mail.gmail.com>
In-Reply-To: <CA+itjEGUuhwLOVADq5c5cntPyZQa1qqDZ2v4Y2YdpAC4bTHeaQ@mail.gmail.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: OMAP4 SGX drivers
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
X-List-Received-Date: Wed, 01 Aug 2012 18:24:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/01/2012 01:59 AM, Matthew Spencer wrote:
> Hi Guys
>
> I am looking into using the meta-ti project to help me build a demo
> platform around the Pandaboard. I need to get the SGX drivers working
> for the demo - but I notice that the virtual/egl package is only
> available for OMAP3 based platforms and excludes the pandaboard from its
> configuration.
>
> Am I supposed to be able to build the SGX packages through the meta-ti
> project - and if so how?

Its been a good bit since I played with panda.  But I will tell you what 
I know.

You can build a recipie to rebundle an SGX package for the OE ecosystem. 
  You can not build the core SGX user space libraries from source as the 
source for these pieces is not published.  The same is true on OMAP3.

[The SGX binary packages are available for anonymous download and can be 
redistributed.]

>
> If the package is not available through the meta-ti project, what is my
> best approach for including is?

Panda board officially supports Ubuntu.  I would look at the graphics 
package enablement for Ubuntu 11.10 and repackage that into an OE form 
factor.

[I would not use the 12.04 packages since that is hardfloat ABI and 
YP/oe-core are still on softfloat ABI.]

[We are still looking for a panda board maintainer for meta-ti.]

>
> Kind regards
>
> Matt
>
>
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

