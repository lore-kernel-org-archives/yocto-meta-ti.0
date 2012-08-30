Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3C14E002AC
	for <meta-ti@yoctoproject.org>; Thu, 30 Aug 2012 13:08:40 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7UK8awT011933;
	Thu, 30 Aug 2012 15:08:36 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7UK8ZsL024114;
	Thu, 30 Aug 2012 15:08:35 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 30 Aug 2012 15:08:35 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q7UK8YBx024073;
	Thu, 30 Aug 2012 15:08:35 -0500
Date: Thu, 30 Aug 2012 16:08:34 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Message-ID: <20120830200833.GE26145@edge>
References: <CALjj03Wphx5VuPkPxhYXsPJL9Pu-UsuFaCfxO17LVwTm-qO+mQ@mail.gmail.com>
	<20120830174807.GB26145@edge> <503FC4F8.9020509@r-finger.com>
MIME-Version: 1.0
In-Reply-To: <503FC4F8.9020509@r-finger.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Building a core-image-base
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
X-List-Received-Date: Thu, 30 Aug 2012 20:08:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Aug 30, 2012 at 08:54:32PM +0100, Tomas Frydrych wrote:
> Hi,
> 
> On 30/08/12 18:48, Denys Dmytriyenko wrote:
> > On Tue, Aug 28, 2012 at 06:22:08PM -0400, Sebasti?n Bas Kana wrote:
> >> I'm using Yocto/Poky and I'm trying to build an image for my Gumstix Overo.
> 
> Worth noting that meta-ti is not compatible with Yocto in numerous
> subtle ways that you will have to work around; for example, in addition
> to the things you noted, you might, want to add
> 'TOOLCHAIN_PATH="${STAGING_BINDIR_TOOLCHAIN}"' to your local.conf, or
> some other suitable config location, as various meta-ti packages will
> fail to compile without it.

Ah, correct, DSP components still use the old TOOLCHAIN_PATH variable that is 
no longer available from oe-core/yocto. Or rather it was never ported to 
oe-core from Classic OE as part of my updated external toolchain framework... 
Most of that still lives in CSL and Linaro recipes, but TOOLCHAIN_PATH got 
lost in the process, I guess. This needs to be fixed once we get to work on 
DSP components again...


> > Not sure what was the problem with netbase, as it's quite self contained. Are 
> > you sure you are using matching branches?
> 
> The problem is that meta-ti seems to be an endlessly moving target
> tracking the master of oe core, while people using Yocto tend to use its
> stable releases. meta-ti would really benefit from some formal release
> process/schedule, but I guess as long as TI considers it to be a
> community project only, this is unlikely to happen.

FYI, there is a "denzil" branch in meta-ti, that corresponds to the same in 
yocto, as well as most of the other layers, including meta-oe...

For our TI SDK products and the new Arago "distribution", we are using said 
"denzil" branch of meta-ti. Other distributions, like Angstrom, use the same 
concept of stable releases based on Yocto Project 1.2 and denzil maintenance 
branches.


> > Either way, you may be better off composing your own image recipe, if you 
> > don't want to enable additional layers.
> 
> You don't have much of a choice here; you will need to pick some of
> these packages from meta-openembedded into a layer of your own as for
> now combining meta-openembedded with Yocto does not work; hopefully this
> will be resolved at some point.

There are some conflicts between them, but I don't think it's correct to say 
they don't work in combination at all...

-- 
Denys

