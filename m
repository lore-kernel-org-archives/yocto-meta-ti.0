Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3C6DE006AD
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 11:09:28 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2JI9Smq028784
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 13:09:28 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JI9SCI022081
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 13:09:28 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 19 Mar 2013 13:09:28 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r2JI9ROg022858;
	Tue, 19 Mar 2013 13:09:27 -0500
Date: Tue, 19 Mar 2013 14:09:27 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130319180927.GS32759@edge>
References: <8F29D6B095ED194EA1980491A5E029710C3EA216@DFLE09.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED101594850C5@DLEE11.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C3EA290@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C3EA290@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Lastest Patches
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
X-List-Received-Date: Tue, 19 Mar 2013 18:09:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ouch, can we do a proper quoting on public mailing lists, please? I do realise 
I am top-posting here, but below looks like a one continuous blob of text to 
me. I even think if each of your replies had been top-posted, it would have 
looked much better than it is now... :) And "lastest", really? :)

Anyway, jokes aside, I'll try to reply to individual posts separately.

-- 
Denys


On Tue, Mar 19, 2013 at 10:17:41AM -0400, Cooper Jr., Franklin wrote:
>     
> 
>     
> 
>    From: Maupin, Chase
>    Sent: Tuesday, March 19, 2013 9:04 AM
>    To: Cooper Jr., Franklin; Dmytriyenko, Denys
>    Cc: meta-ti@yoctoproject.org
>    Subject: RE: Lastest Patches
> 
>     
> 
>     
> 
>     
> 
>    From: meta-ti-bounces@yoctoproject.org
>    [mailto:meta-ti-bounces@yoctoproject.org] On Behalf Of Cooper Jr.,
>    Franklin
>    Sent: Tuesday, March 19, 2013 8:50 AM
>    To: Dmytriyenko, Denys
>    Cc: meta-ti@yoctoproject.org
>    Subject: [meta-ti] Lastest Patches
> 
>     
> 
>    I am not in favor for some of these new namespace changes for legacy
>    recipes. There are a lot of history behind those recipes names
>    (arago-classic) including the PSP version. Old documentation also refer to
>    that PSP release
>    http://processors.wiki.ti.com/index.php/DaVinci_PSP_03.21.00.04_Release_Notes
> 
>    Ex
> 
>    u-boot-am180x: modify am180x specific version to use new namespace feature
> 
>    --- a/recipes-bsp/u-boot/u-boot_2010.12-psp03.21.00.04.sdk.bb
> 
>    +++ b/recipes-bsp/u-boot/u-boot-am180x_2010.12.bb
> 
>     
> 
>    [CEM] So is your opposition the removal of the PSP version?  Sounds like
>    we need an alignment on "release" recipe names.
> 
>     
> 
>    FC: Correct. I believe we are aligned for future recipes based on the
>    super long email thread we recently had J. But I don't think those changes
>    should apply to these older recipes.
> 
>     
> 
>    I don't have a problem with adding the machine name to the recipe
>    especially if COMPATIBLE_MACHINE is set for only one machine.
> 
>     
> 
>    Also changing the ti33x PREFERRED_PROVIDER to a kernel that is still being
>    developed (not released) is another problem.
> 
>    Ex:
> 
>    ti33x: switch default preference to ti-staging tree
> 
>    PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
> 
>     
> 
>    [CEM] As Denys pointed out the arago.conf sets this to the old recipe for
>    now while using an Arago distribution.  Making the default point to the
>    kernel being developed makes it easy for people to work with that kernel
>    and provide feedback.  Is you issue that they may not set their build to
>    use the older kernel (i.e. not using Arago distro) and encounter issues?
> 
>     
> 
>    FC: So I did notice that Denys didn't make similar changes in meta-arago
>    so for Arago distributions users nothing has changed. While meta-ti users
>    weren't using our official kernel in the first place. So to answer your
>    question yes. But it doesn't affect me so I was just pointing it out for
>    others.
> 
>     
> 
>     
> 
>    Regards,
> 
>    Franklin Cooper Jr.
> 
>    Texas Instruments
> 
>    Application Engineer
> 
>    fcooper@ti.com
> 
>     

