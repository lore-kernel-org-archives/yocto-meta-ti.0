Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8BDADE0059A
	for <meta-ti@yoctoproject.org>; Wed, 21 Mar 2012 20:16:30 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1900FSZNQWHMT0@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 21 Mar 2012 22:16:09 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9313F202A6; Wed,
	21 Mar 2012 23:16:08 -0400 (EDT)
Date: Wed, 21 Mar 2012 23:16:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: roystonvasey@slingshot.co.nz, arago-devel@gforge.ti.com,
	meta-ti@yoctoproject.org
Message-id: <20120322031608.GG6857@denix.org>
References: <005001cd07aa$eb9e7e80$c2db7b80$@slingshot.co.nz>
MIME-version: 1.0
In-reply-to: <005001cd07aa$eb9e7e80$c2db7b80$@slingshot.co.nz>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [arago-devel] ti-eula-unpack
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
X-List-Received-Date: Thu, 22 Mar 2012 03:16:30 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Mar 22, 2012 at 10:38:14AM +1300, R U Local wrote:
> Dear List,
> 
> A resent change to ti-eula-unpack.inc to test for 32 bit compatibility on 64
> bit systems has broken the build on Ubuntu x64 11.10 machines.
> 
> Ubuntu created multi-arch functionality between 11.4 and 11.10. There is are
> now /lib /lib64 and /lib32 directories and no symlinks.
> 
> The following patch corrects this on my system but I have no idea of its
> effect on others.

Thanks for the patch, but it's a wrong list - it has been discussed a few days 
ago on meta-ti (copied here):

https://lists.yoctoproject.org/pipermail/meta-ti/2012-March/000804.html

While it may fix Ubuntu 11.10, I'm still not sure about other distros. One of 
the suggestions was to switch it to warning, so it won't stop the build if the 
check fails, but user gets notified.

-- 
Denys


> diff --git a/recipes-ti/includes/ti-eula-unpack.inc
> b/recipes-ti/includes/ti-eula-unpack.inc
> 
> index dcabe9d..f37f026 100644
> 
> --- a/recipes-ti/includes/ti-eula-unpack.inc
> 
> +++ b/recipes-ti/includes/ti-eula-unpack.inc
> 
> @@ -21,7 +21,7 @@ python ti_bin_do_unpack() {
> 
>  
> 
>      # InstallJammer requires 32bit version of glibc
> 
>      lib32path = '/lib'
> 
> -    if os.path.exists('/lib64') and ( os.path.islink('/lib64') or
> os.path.islink('/lib') ):
> 
> +    if os.path.exists('/lib64') and ( os.path.islink('/lib64') or
> os.path.islink('/lib') or os.path.exists('/lib32')):
> 
>         lib32path = '/lib32'
> 
>      if not os.path.exists('%s/libc.so.6' % lib32path):
> 
>         raise bb.build.FuncFailed, \
> 
>  
> 
> Cheers Mike.
> 
>  
> 

> _______________________________________________
> arago-devel mailing list
> arago-devel@gforge.ti.com
> https://gforge.ti.com/mailman/listinfo/arago-devel


