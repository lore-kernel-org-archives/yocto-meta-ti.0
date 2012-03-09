Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DAD84E013A7
	for <meta-ti@yoctoproject.org>; Fri,  9 Mar 2012 11:36:50 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0M00L3EUGV16G1@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 09 Mar 2012 13:36:32 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7ACD720120; Fri,
	09 Mar 2012 14:36:31 -0500 (EST)
Date: Fri, 09 Mar 2012 14:36:31 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120309193631.GC27573@denix.org>
References: <1331235244-5173-1-git-send-email-trini@ti.com>
	<20120308210125.GE10587@denix.org>
	<EEF3E563-5B95-4864-ACB7-85101641A086@dominion.thruhere.net>
	<20120309150156.GA27573@denix.org>
	<733E8AC8-86F5-4673-AA9E-49D02AC2F400@dominion.thruhere.net>
	<20120309191716.GB27573@denix.org>
	<CCE23D31-0F9B-44CD-A88C-B25D8E50BA39@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <CCE23D31-0F9B-44CD-A88C-B25D8E50BA39@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Tom Rini <trini@ti.com>, meta-ti@yoctoproject.org
Subject: Re: [PATCH 0/4] IMAGE_FSTYPES fixes / improvements
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
X-List-Received-Date: Fri, 09 Mar 2012 19:36:51 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Mar 09, 2012 at 08:19:48PM +0100, Koen Kooi wrote:
> 
> Op 9 mrt. 2012, om 20:17 heeft Denys Dmytriyenko het volgende geschreven:
> 
> > On Fri, Mar 09, 2012 at 07:43:40PM +0100, Koen Kooi wrote:
> >> 
> >> Op 9 mrt. 2012, om 16:01 heeft Denys Dmytriyenko het volgende geschreven:
> >> 
> >>> On Fri, Mar 09, 2012 at 07:20:30AM +0100, Koen Kooi wrote:
> >>>> 
> >>>> Op 8 mrt. 2012, om 22:01 heeft Denys Dmytriyenko het volgende geschreven:
> >>>> 
> >>>>> On Thu, Mar 08, 2012 at 12:34:00PM -0700, Tom Rini wrote:
> >>>>>> Hey all,
> >>>>>> 
> >>>>>> This short series does two things.  For 3 machines we fix a bug of using
> >>>>>> '?=' rather than '+=' for setting IMAGE_FSTYPES (these are all of the
> >>>>>> machines that have this issue today except for...) and on the 4th,
> >>>>>> am335x-evm we add UBI support as well.  On the first three, these are
> >>>>>> correct by inspection and on the fourth, I've written to and mounted
> >>>>>> systemd-image from NAND on my EVM (it didn't work as I was using a custom
> >>>>>> uImage that's not systemd-sane, and fixing that and confirming the config
> >>>>>> used here works is on my list).
> >>>>> 
> >>>>> All,
> >>>>> 
> >>>>> Tom and I started talking on IRC and then decided to move the discussion back 
> >>>>> to the mailing list for others to participate.
> >>>>> 
> >>>>> So, basically, the proposal is to do this in our machine.conf files:
> >>>>> 
> >>>>> -IMAGE_FSTYPES ?= "jffs2 tar.bz2"
> >>>>> +IMAGE_FSTYPES += "jffs2 tar.bz2"
> >>>>> 
> >>>>> My response was that we shouldn't do that.
> >>>> 
> >>>> += is the OE classic way of doing things and is IMNSHO the right thing.
> >>> 
> >>> Not convinced:
> >>> 
> >>> $ grep IMAGE_FSTYPES openembedded/conf/machine/*|awk '{print $2}'|sort|uniq -c
> >>>    30 =
> >>>     1 -
> >>>    44 ?=
> >>>    31 +=
> >>> 
> >>> BTW, dash in there is a fluke coming from here:
> >>> cm-x270.conf:#     - IMAGE_FSTYPES = "jffs2 tar cpio.gz"
> >>> 
> >>>>> The conf files that may set, append 
> >>>>> or overwrite IMAGE_FSTYPES are parsed in the order of local.conf, machine.conf 
> >>>>> and distro.conf. And if none of those set IMAGE_FSTYPES, bitbake.conf defaults 
> >>>>> to a sane tar.gz. From end-user perspective, they expect the setting in their 
> >>>>> local.conf to be obeyed. If they don't care and don't set IMAGE_FSTYPES, then 
> >>>>> machine.conf will set it to supported values, i.e. jffs2 and tar.bz2 in our 
> >>>>> case. Of course, distro has the last word and potentially can alter it, but in 
> >>>>> most cases it shouldn't. That's how it works now and I believe it's the 
> >>>>> correct behaviour. Changing it to append additional values to what user wants 
> >>>>> is slightly heavy-handed, in my opinion. In other words, those are suggested 
> >>>>> image types, not enforced ones.
> >>>>> 
> >>>>> As Tom poined out, this is the same behaviour as currently used in OE-Core, 
> >>>>> where qemu machines all have IMAGE_FSTYPES ?= "tar.bz2 ext3".
> >>>>> 
> >>>>> The original issue in question may be coming from the way some setup scripts 
> >>>>> pre-configure user settings in local.conf, defaulting IMAGE_FSTYPES to 
> >>>>> something, that is not very suitable for the machines being used. This needs 
> >>>>> to be left unset and for the end-user to decide and set specifically, IMHO.
> >>>>> 
> >>>>> Comments, opinions?
> >>>> 
> >>>> See the discussion on OE-core a while back. There was a lot of handwaving 
> >>>> done and suggested that IMAGE_FSTYPES_append_$machine = " foo" in local.conf 
> >>>> is the right way to do this. I think it's not intuitive because you have to 
> >>>> remember that += and _append are expanded in different points during 
> >>>> parsing, which requires either deep bitbake knowledge or minor braindamage.
> >>> 
> >>> Link or it never happened :)
> >> 
> >> No link, but:
> >> 
> >> 19:41 < Tartarus> But, where's the oe-core thread?
> >> 19:41 < koen> somewhere on OE-core
> >> 19:42 < koen> [OE-core] [PATCH 1/2] qemu.inc: append to IMAGE_FSTYPES instead of weakly assigning them
> >> 19:42 < koen> july 2011
> > 
> > Ok, here's the link:
> > http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/2060/focus=2061
> > 
> > It was discussed, there was no resolution, there were no changes.
> > 
> > Claiming that's how it's done in Classic OE (aka .dev) is not correct - as I 
> > showed above, 44 machines use ?=, 31 use += and 31 use =
> 
> And how many of those machines are broken/unmaintained/etc

And how many were you responsible for changing to += in .dev? :)


> > OE-Core still uses ?=
> > 
> > Please give me the use case that this is meant to enable, which is not 
> > possible now.
> 
> Setting a global, additional type in local.conf without needing deep 
> knowledge of bitbake. People just don't understand why they need to do 
> IMAGE_FSTYPES_append = foo instead of IMAGE_FSTYPES += or IMAGE_FSTYPE = "foo"

Let's say a machine has IMAGE_FSTYPES ?= "jffs2 ubi".
And setting IMAGE_FSTYPES = "ubi tag.gz jffs2 ext3" in local.conf still works!

On the other hand, with the change to += I won't be able to set it to just 
"tar.gz" and NOT build everything that machine supports, i.e. jffs2, ubi etc.

I still believe the change breaks an existing valid use case w/o adding much 
value... But, I'm willing to be convinced otherwise, if people vote it that 
way. So, we need more opinions to weigh on the topic. :)

-- 
Denys

