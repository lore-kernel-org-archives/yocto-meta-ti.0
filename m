Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82AC2E002AB
	for <meta-ti@yoctoproject.org>; Mon, 14 Jan 2013 15:31:42 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MGN004NV2NRHKJ3@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 14 Jan 2013 17:31:19 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D9FBA20077; Mon,
	14 Jan 2013 18:31:02 -0500 (EST)
Date: Mon, 14 Jan 2013 18:31:02 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-id: <20130114233102.GB10163@denix.org>
References: <1356784589-14296-1-git-send-email-gary@mlbassoc.com>
MIME-version: 1.0
In-reply-to: <1356784589-14296-1-git-send-email-gary@mlbassoc.com>
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
X-List-Received-Date: Mon, 14 Jan 2013 23:31:42 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Dec 29, 2012 at 05:36:29AM -0700, Gary Thomas wrote:
> This .bbappend file is used to override the 'interfaces' file for
> certain targets.  The current version is broken in that it does not
> search the correct path(s).  This patch fixes that, as well as marking
> the resulting package as target specific.

Thanks. There was similar patch earlier, but w/o marking resulting package as 
machine specific. For that matter, shouldn't the main netbase recipe in 
oe-core do it instead? As it comes with bunch of qemu-arch-specific interfaces 
files anyway, and we just add one more for beagleboard...

-- 
Denys


> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>  recipes-core/netbase/netbase_5.0.bbappend |    5 ++---
>  1 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-core/netbase/netbase_5.0.bbappend b/recipes-core/netbase/netbase_5.0.bbappend
> index 4b8d0e6..e5fa909 100644
> --- a/recipes-core/netbase/netbase_5.0.bbappend
> +++ b/recipes-core/netbase/netbase_5.0.bbappend
> @@ -1,3 +1,2 @@
> -THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
> -FILESPATH =. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
> -
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-${PV}:"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> -- 
> 1.7.7.6
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

