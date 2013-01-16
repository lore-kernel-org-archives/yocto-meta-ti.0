Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4103AE006D7
	for <meta-ti@yoctoproject.org>; Wed, 16 Jan 2013 10:10:32 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MGQ0034BD4Y9BG1@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 16 Jan 2013 12:10:16 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 540402016B; Wed,
	16 Jan 2013 13:10:10 -0500 (EST)
Date: Wed, 16 Jan 2013 13:10:10 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-id: <20130116181010.GA19126@denix.org>
References: <1356784589-14296-1-git-send-email-gary@mlbassoc.com>
	<20130114233102.GB10163@denix.org> <50F6BF5E.3020705@mlbassoc.com>
MIME-version: 1.0
In-reply-to: <50F6BF5E.3020705@mlbassoc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] netbase: Fix file search path for 'interfaces'
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
X-List-Received-Date: Wed, 16 Jan 2013 18:10:32 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jan 16, 2013 at 07:55:26AM -0700, Gary Thomas wrote:
> On 2013-01-14 16:31, Denys Dmytriyenko wrote:
> >On Sat, Dec 29, 2012 at 05:36:29AM -0700, Gary Thomas wrote:
> >>This .bbappend file is used to override the 'interfaces' file for
> >>certain targets.  The current version is broken in that it does not
> >>search the correct path(s).  This patch fixes that, as well as marking
> >>the resulting package as target specific.
> >
> >Thanks. There was similar patch earlier, but w/o marking resulting package as
> >machine specific. For that matter, shouldn't the main netbase recipe in
> >oe-core do it instead? As it comes with bunch of qemu-arch-specific interfaces
> >files anyway, and we just add one more for beagleboard...
> >
> 
> Agreed.  When I get two minutes, I'll propose a new patch for meta-ti
> for this as well as one for OE-core.

Actually, there is no need for an explicit PACKAGE_ARCH = MACHINE_ARCH neither 
in bbappend nor in the main recipe in oe-core - bitbake does it automatically 
when it detects machine-overriden files being packaged.

-- 
Denys

