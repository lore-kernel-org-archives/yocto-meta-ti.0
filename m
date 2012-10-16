Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05A47E00292
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2012 06:37:57 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MBZ00IZZN6A8170@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 16 Oct 2012 08:37:38 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6ECB2201C0; Tue,
	16 Oct 2012 09:37:21 -0400 (EDT)
Date: Tue, 16 Oct 2012 09:37:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Message-id: <20121016133721.GB5662@denix.org>
References: <507C1073.3060703@communistcode.co.uk>
	<CA+M6bXmNfA8D0tpXb25C5jOKDgs6LsTeph=cdhNBo215S0xVsQ@mail.gmail.com>
	<507D1961.7080907@communistcode.co.uk>
	<20121016130010.GA5662@denix.org>
	<507D5E1E.8070207@communistcode.co.uk>
MIME-version: 1.0
In-reply-to: <507D5E1E.8070207@communistcode.co.uk>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: u-boot compile failure
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
X-List-Received-Date: Tue, 16 Oct 2012 13:37:57 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Oct 16, 2012 at 02:16:14PM +0100, Jack Mitchell wrote:
> On 16/10/12 14:00, Denys Dmytriyenko wrote:
> >On Tue, Oct 16, 2012 at 09:22:57AM +0100, Jack Mitchell wrote:
> >>On 16/10/12 02:20, Tom Rini wrote:
> >>>On Mon, Oct 15, 2012 at 6:32 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
> >>>>It seems that u-boot is attempting to use GCC includes from my host system
> >>>>here. This surely isn't right is it?
> >>>There are host tools to build.  That said, from the log it looks like
> >>>you have been trying to build this a few times.  If you bitbake -c
> >>>clean u-boot do you still see the problem?
> >>>
> >>I get the error[1] after the -c clean.
> >>
> >>I think I know what it is, that I upgraded my host distro yesterday
> >>which pulled in a new GCC and the old GCC libraries are still in the
> >>path. However, bitbake shouldn't be going into the host system for
> >>includes should it? Shouldn't it use it's own compiled GCC and
> >>associated libraries to generate the u-boot tools rather than rely
> >>on whatever is present on my host system, or am I missing something?
> >>I'm pretty sure a reboot would sort it out but I didn't want to kill
> >>a failure case.
> >Jack,
> >
> >It's not u-boot that fails for you, it's u-boot-mkimage-native - it's a host
> >tool to generate u-boot images, so it runs on your host and hence is built
> >with your host compiler. OE/Yocto usually builds bunch of host tools and they
> >have the "-native" suffix in their names. Upgradig your host system w/o
> >switching profiles or changing paths is a common issue in such cases.
> >
> 
> Ok, so when a package is labelled -native it is not only native in
> architecture but linked to the specific host?

Yes, because that code is used locally on the same host and only for the 
build. You don't ship that code, as it doesn't even get packaged anywhere - 
it gets populated in the sysroots and used for the builds.

For something that you need to distribute/ship, that needs to run on a host, 
there's SDK with Canadian cross, where you get a complete separation and host 
binaries that are not linked to a specific host. Moreover, you can target 
32bit x86 SDK host, while building it on a 64bit-only x86 build host. Those 
are marked with "-nativesdk" suffix instead.

> This is just out of interest since I was unaware of the level of
> host intrusion on a build.

-- 
Denys

