Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC628E006DD
	for <meta-ti@yoctoproject.org>; Sat,  3 Dec 2011 16:24:26 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LVN00BXJL4H3JR5@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sat, 03 Dec 2011 18:24:17 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3EC2414AF5D; Sat,
	03 Dec 2011 19:24:17 -0500 (EST)
Date: Sat, 03 Dec 2011 19:24:17 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-id: <20111204002417.GD14132@denix.org>
References: <CAMKF1spb7EReb9Zdjfarb7aoKTAcJ_eEL2jFTpytPm5NoVXGLg@mail.gmail.com>
	<CAMKF1sr+w_5PtYQhi-p6epp+pAyJkHPbWwcWK1YUmwo6nqmHSg@mail.gmail.com>
	<20111203231817.GC14132@denix.org>
	<CAMKF1sqxbhAVY8XNyts1-8qGYwnXoMzaJGHZuzuJOg4wsAXJ1w@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAMKF1sqxbhAVY8XNyts1-8qGYwnXoMzaJGHZuzuJOg4wsAXJ1w@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: meta-ti@yoctoproject.org
Subject: Re: Use of MACHINE_KERNEL_PR in meta-ti recipes
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
X-List-Received-Date: Sun, 04 Dec 2011 00:24:27 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Dec 03, 2011 at 03:26:32PM -0800, Khem Raj wrote:
> On Sat, Dec 3, 2011 at 3:18 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > On Sat, Dec 03, 2011 at 01:42:30PM -0800, Khem Raj wrote:
> >> On Sat, Dec 3, 2011 at 1:13 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >> > Hi
> >> >
> >> > I am seeing this kind of error all over in meta-ti recipes
> >> >
> >> >
> >> > ERROR: Unable to analyse format of PR variable: ${MACHINE_KERNEL_PR}e
> >> > ERROR: Unable to parse
> >> > /home/kraj/work/angstrom/sources/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager_1.24.02.09.bb
> >> >
> >> > Problem seems to be that these recipes are not getting
> >> > MACHINE_KERNEL_PR from anywhere but they are using it
> >> > and its not a standard variable in bitbake.conf either. I have
> >> > manually patched recipes-ti/includes/ti-staging.inc
> >> > to contain MACHINE_KERNEL_PR ?= "r0"
> >> >
> >> > and patched few recipes which did not include this include to have the
> >> > definition in them
> >> >
> >> > I don't know if this is the right way to fix it but this has got me
> >> > over the parsing problems
> >>
> >> btw. I am using qemuarm machine with angstrom distro on top of oe-core
> >> and qemuarm conf does not define MACHINE_KERNEL_PR either
> >
> > Ah, that explains it. Why do you need meta-ti layer with qemuarm? Is there a
> > specific recipe you need from it or you are just trying all layers in default
> > setup?
> 
> I am trying angstrom defaults. I think a COMPATIBLE_MACHINE is nice to contain
> the recipes for your machine layer only so it can be used in default
> angstrom setup
> for non TI machines. Since I build TI and non TI machines in same
> tmpdir I dont want
> to keep editing my layers.txt every time I use a different machine

Actually, we'd like to ease off of COMPATIBLE_MACHINE use in our recipes to 
make them more generic wherever possible.

I understand that MACHINE_KERNEL_PR is not entirely standard variable and 
probably we should try to find a better alternative for its purpose...

-- 
Denys

