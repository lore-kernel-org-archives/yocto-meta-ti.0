Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE784E004AB
	for <meta-ti@yoctoproject.org>; Wed, 19 Sep 2012 09:26:43 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8JGQeFE025231;
	Wed, 19 Sep 2012 11:26:40 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8JGQeKn024707;
	Wed, 19 Sep 2012 11:26:40 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 19 Sep 2012 11:26:40 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q8JGQeGl003212;
	Wed, 19 Sep 2012 11:26:40 -0500
Date: Wed, 19 Sep 2012 12:26:40 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nicolas Dechesne <ndec13@gmail.com>
Message-ID: <20120919162639.GC589@edge>
References: <CAOT3mi+f4Wsaba4S3uiw1p27R585EBY4OSA8K=pPCpbATwRmcA@mail.gmail.com>
	<20120919135659.GA589@edge>
	<CAOT3miK4MM-LqDC0AFuZh3hH145qrYoxW1w27P4dXRTCR2X=hQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOT3miK4MM-LqDC0AFuZh3hH145qrYoxW1w27P4dXRTCR2X=hQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: building yocto images with meta-ti
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
X-List-Received-Date: Wed, 19 Sep 2012 16:26:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Sep 19, 2012 at 06:04:09PM +0200, Nicolas Dechesne wrote:
> hi,
> 
> thanks for your answers
> 
> On Wed, Sep 19, 2012 at 3:57 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> > On Wed, Sep 19, 2012 at 08:16:05AM +0200, Nicolas Dechesne wrote:
> >> hi there,
> >
> > Hi Nicolas,
> >
> >> i was able to build a 'vanilla' yocto image using the yocto git repo.
> >> then i wanted to add meta-ti layer. so i have done the following:
> >
> > First, a little rant... :)
> >
> > It's unfortunate, but this still causes lots of confusion. Some purists among
> > us will say that is not Yocto, but Poky. Case in point - which "yocto" git
> > repository you cloned from http://git.yoctoproject.org/ ?
> 
> so yes, I meant Poky. It was indeed quite subtle to me, and I didn't
> realize there was a difference between yocto and poky ;-)

It is somewhat convoluted, but in general, Poky is a reference distribution 
and released product built on top of OpenEmbedded-Core. The Yocto Project is 
an umbrella entity for different projects and initiatives based on the common 
infrastructure, such as OpenEmbedded-Core, BitBake etc. There are other 
distributions and projects building on top of OE-Core, such as Angstrom, Arago 
etc., that are supposed to be part of the Yocto Project as well. See Yocto 
Project branding compliance program for official guidelines, that were 
standardized recently... But the Yocto Project Universe is much larger than 
Poky - there are at least 50 different layers that you can mix and match, 
ranging from different BSPs to different Software stacks...


> just to clarify, I had cloned:
> 
> git://git.yoctoproject.org/poky.git, commit
> 913944d904266bf90af0cad94b4f0fb3652bd29d (master)
> git://git.yoctoproject.org/meta-ti, commit
> 9ef35da0c8ff3be8f37214e09d0fc1d4987a11fc (master)
> 
> and I had put in my local.conf:
> 
> BBMASK = "meta-ti/recipes-misc"
> 
> as per the README. I didn't find any other useful information in the
> README, though.
> 
> is there a good wiki / doc that explains what each of this thing is:
> OE vs poky vs yocto vs arago?

Some of that is explained above. I can go into more details offline, if you 
wish.


> is that wrong to expect to be able to build a poky image by combining
> meta-ti and poky.git?

Absolutely not! And I've been building that combination among other things - 
either core-image-minimal or core-image-sato.


> > Same applies to a 'vanilla' yocto image, which does not exist. It would rather
> > be useful to specify which exact image for which MACHINE you are trying to
> > build. A little bit more detail is always helpful...
> >
> >
> > And now to the resolution part. I see you already used BBMASK as prescribed in
> > the README, since you get past the unset LICENSE error... The below error
> > happens when you build for a MACHINE that is overshadowed by another BSP
> > layer that does not define MACHINE_KERNEL_PR. This MACHINE_KERNEL_PR variable
> > is set in MACHINE definitions of meta-ti BSP layer and then used in other
> > recipes within meta-ti and different layers.
> >
> > In other words, you are trying to build for "beagleboard" machine, which gets
> > also defined by meta-yocto-bsp layer, besides meta-ti. The solution is simple -
> > you need to move meta-ti above meta-yocto-bsp in your bblayers.conf or just
> > remove meta-yocto-bsp from the list, if you are not planning on building any
> > of the reference platforms. That way you'll get the machine definition from
> > meta-ti layer and not from meta-yocto-bsp.
> >
> > After that, core-image-minimal and some other images should build fine. Good
> > luck!
> 
> ok, so based on the feedback, i have moved poky.git to denzil branch,
> and meta-ti to denzil branch too. is that expected to be a good
> combination?

Depends on which direction you go. Denzil branch is usually considered more 
stable than master, although master is now feature-frozen for stabilization 
before the next release. Unless you start mixing meta-oe and step on to 
systemd issues, as systemd in denzil is not that clean. Anyway, for a simple 
poky+meta-ti combination and images from meta/ directory it should be fine. 


> my build has restarted fine... i will check the build when they complete.

Let us know. Like I said, I've been building both core-image-minimal and 
core-image-sato w/o problems before.

-- 
Denys

