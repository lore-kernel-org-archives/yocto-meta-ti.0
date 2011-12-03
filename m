Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1D3CE006DD
	for <meta-ti@yoctoproject.org>; Sat,  3 Dec 2011 15:18:18 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LVN00I6YI2IQ4A0@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sat, 03 Dec 2011 17:18:18 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E5DC714AF5D; Sat,
	03 Dec 2011 18:18:17 -0500 (EST)
Date: Sat, 03 Dec 2011 18:18:17 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-id: <20111203231817.GC14132@denix.org>
References: <CAMKF1spb7EReb9Zdjfarb7aoKTAcJ_eEL2jFTpytPm5NoVXGLg@mail.gmail.com>
	<CAMKF1sr+w_5PtYQhi-p6epp+pAyJkHPbWwcWK1YUmwo6nqmHSg@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAMKF1sr+w_5PtYQhi-p6epp+pAyJkHPbWwcWK1YUmwo6nqmHSg@mail.gmail.com>
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
X-List-Received-Date: Sat, 03 Dec 2011 23:18:19 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Dec 03, 2011 at 01:42:30PM -0800, Khem Raj wrote:
> On Sat, Dec 3, 2011 at 1:13 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > Hi
> >
> > I am seeing this kind of error all over in meta-ti recipes
> >
> >
> > ERROR: Unable to analyse format of PR variable: ${MACHINE_KERNEL_PR}e
> > ERROR: Unable to parse
> > /home/kraj/work/angstrom/sources/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager_1.24.02.09.bb
> >
> > Problem seems to be that these recipes are not getting
> > MACHINE_KERNEL_PR from anywhere but they are using it
> > and its not a standard variable in bitbake.conf either. I have
> > manually patched recipes-ti/includes/ti-staging.inc
> > to contain MACHINE_KERNEL_PR ?= "r0"
> >
> > and patched few recipes which did not include this include to have the
> > definition in them
> >
> > I don't know if this is the right way to fix it but this has got me
> > over the parsing problems
> 
> btw. I am using qemuarm machine with angstrom distro on top of oe-core
> and qemuarm conf does not define MACHINE_KERNEL_PR either

Ah, that explains it. Why do you need meta-ti layer with qemuarm? Is there a 
specific recipe you need from it or you are just trying all layers in default 
setup?

-- 
Denys

