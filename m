Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1A34E0030B
	for <meta-ti@yoctoproject.org>; Thu,  8 Mar 2012 13:01:49 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0L00GDO3QEEJO0@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 08 Mar 2012 15:01:31 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id EB848200AA; Thu,
	08 Mar 2012 16:01:25 -0500 (EST)
Date: Thu, 08 Mar 2012 16:01:25 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Tom Rini <trini@ti.com>
Message-id: <20120308210125.GE10587@denix.org>
References: <1331235244-5173-1-git-send-email-trini@ti.com>
MIME-version: 1.0
In-reply-to: <1331235244-5173-1-git-send-email-trini@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Thu, 08 Mar 2012 21:01:49 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Mar 08, 2012 at 12:34:00PM -0700, Tom Rini wrote:
> Hey all,
> 
> This short series does two things.  For 3 machines we fix a bug of using
> '?=' rather than '+=' for setting IMAGE_FSTYPES (these are all of the
> machines that have this issue today except for...) and on the 4th,
> am335x-evm we add UBI support as well.  On the first three, these are
> correct by inspection and on the fourth, I've written to and mounted
> systemd-image from NAND on my EVM (it didn't work as I was using a custom
> uImage that's not systemd-sane, and fixing that and confirming the config
> used here works is on my list).

All,

Tom and I started talking on IRC and then decided to move the discussion back 
to the mailing list for others to participate.

So, basically, the proposal is to do this in our machine.conf files:

-IMAGE_FSTYPES ?= "jffs2 tar.bz2"
+IMAGE_FSTYPES += "jffs2 tar.bz2"

My response was that we shouldn't do that. The conf files that may set, append 
or overwrite IMAGE_FSTYPES are parsed in the order of local.conf, machine.conf 
and distro.conf. And if none of those set IMAGE_FSTYPES, bitbake.conf defaults 
to a sane tar.gz. From end-user perspective, they expect the setting in their 
local.conf to be obeyed. If they don't care and don't set IMAGE_FSTYPES, then 
machine.conf will set it to supported values, i.e. jffs2 and tar.bz2 in our 
case. Of course, distro has the last word and potentially can alter it, but in 
most cases it shouldn't. That's how it works now and I believe it's the 
correct behaviour. Changing it to append additional values to what user wants 
is slightly heavy-handed, in my opinion. In other words, those are suggested 
image types, not enforced ones.

As Tom poined out, this is the same behaviour as currently used in OE-Core, 
where qemu machines all have IMAGE_FSTYPES ?= "tar.bz2 ext3".

The original issue in question may be coming from the way some setup scripts 
pre-configure user settings in local.conf, defaulting IMAGE_FSTYPES to 
something, that is not very suitable for the machines being used. This needs 
to be left unset and for the end-user to decide and set specifically, IMHO.

Comments, opinions?

-- 
Denys

