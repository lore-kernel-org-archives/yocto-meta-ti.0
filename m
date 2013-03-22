Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C9D76E01471
	for <meta-ti@yoctoproject.org>; Fri, 22 Mar 2013 14:26:38 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MK200FHBZJIRZP1@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 22 Mar 2013 16:26:21 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 59873200BE; Fri,
	22 Mar 2013 17:26:06 -0400 (EDT)
Date: Fri, 22 Mar 2013 17:26:06 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20130322212606.GB30363@denix.org>
References: <8F29D6B095ED194EA1980491A5E029710C3EA216@DFLE09.ent.ti.com>
MIME-version: 1.0
In-reply-to: <8F29D6B095ED194EA1980491A5E029710C3EA216@DFLE09.ent.ti.com>
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
X-List-Received-Date: Fri, 22 Mar 2013 21:26:38 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Franklin,

I put this discussion on back-burner for a bit, to let the dust settle and to 
gather some thoughts...


On Tue, Mar 19, 2013 at 01:50:22PM +0000, Cooper Jr., Franklin wrote:
> I am not in favor for some of these new namespace changes for legacy 
> recipes. There are a lot of history behind those recipes names 
> (arago-classic) including the PSP version. Old documentation also refer to 
> that PSP release 
> http://processors.wiki.ti.com/index.php/DaVinci_PSP_03.21.00.04_Release_Notes
> 
> Ex
> u-boot-am180x: modify am180x specific version to use new namespace feature
> 
> --- a/recipes-bsp/u-boot/u-boot_2010.12-psp03.21.00.04.sdk.bb
> 
> +++ b/recipes-bsp/u-boot/u-boot-am180x_2010.12.bb
> 
> 
> I don't have a problem with adding the machine name to the recipe especially 
> if COMPATIBLE_MACHINE is set for only one machine.

I understand your position here. I happened to have originally introduced 
those -psp version suffixes to the recipes several years ago. These days this 
concept is no longer relevant... Let me list few reasons:

1. The internal org has changed, hence the naming - new recipes don't have 
this same suffix.
2. Other recipes also come from different sources and don't have -psp suffix.
3. The recipe you mentioned above for am180x happens to be the only one left 
with this suffix - time to unify versioning schema.
4. Yocto principles and the concept of "rolling" releases - meaning not having 
multiple versions of the same recipe around and using SCM for historic 
purposes, not the metadata. In other words - there are git tags, branches and 
even linear history for past versions, so no need to cling to them in the 
recipes. That means if we have a newer u-boot available for am180x that works, 
we would remove the 2010.12 as being very old one, PSP or not.
5. With the SoC/machine in the recipe name, there's no worry to have the name 
collision between u-boot_2010.12 for am180x and the same u-boot version for 
another machine, so no need to keep the -psp versioning suffix for the purpose 
of unique version.
6. The PSP version corresponding to that release is still recorded inside the 
recipe, as a tag/SRCREV.
7. I know you need to set PSPREL variable for the SDK - we can still do that 
in meta-arago as a bbappend.


> Also changing the ti33x PREFERRED_PROVIDER to a kernel that is still being 
> developed (not released) is another problem.
> 
> Ex:
> 
> ti33x: switch default preference to ti-staging tree
> 
> PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"

As Chase mentioned, this is gearing up for the release next month and we need 
as many people to start using and testing it, as possible, at least within 
meta-ti.
Again, for SDK stable releases, it can be set to an older 3.2 version - it's 
just a matter of setting PREFERRED_PROVIDER and PREFERRED_VERSION accordingly.

-- 
Denys

