Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37B46E00736
	for <meta-ti@yoctoproject.org>; Mon,  4 Feb 2013 21:17:01 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MHQ00KZAEO1Z3G5@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 04 Feb 2013 23:17:00 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9BAEE20031; Tue,
	05 Feb 2013 00:16:49 -0500 (EST)
Date: Tue, 05 Feb 2013 00:16:49 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-id: <20130205051649.GD27526@denix.org>
References: <alpine.DEB.2.02.1301301812590.3879@oneiric>
MIME-version: 1.0
In-reply-to: <alpine.DEB.2.02.1301301812590.3879@oneiric>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: couple issues trying to build ti-hw-bringup-image.bb for AM1808 exp kit
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
X-List-Received-Date: Tue, 05 Feb 2013 05:17:01 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Can the below patch help:

https://lists.yoctoproject.org/pipermail/meta-ti/2012-September/001541.html

Otherwise, entire recipes-misc folder of meta-ti is currently not supported 
and may be removed in the _near_ future. Although, ti-hw-bringup maybe 
preserved, but modified.

-- 
Denys


On Wed, Jan 30, 2013 at 06:21:15PM -0500, Robert P. J. Day wrote:
> 
>   i want to build a stock ti-hw-bringup-image.bb for am180x-evm, so if
> anyone else has done that, here are the two issues i've run into.
> first, i dropped the connman packages from the meta-angstrom layer:
> 
> diff --git a/recipes-images/angstrom/systemd-image.bb b/recipes-images/angstrom/systemd-image.bb
> index c3232d9..b1cc338 100644
> --- a/recipes-images/angstrom/systemd-image.bb
> +++ b/recipes-images/angstrom/systemd-image.bb
> @@ -14,7 +14,6 @@ CONMANPKGS_libc-uclibc = ""
>  IMAGE_INSTALL += " \
>         angstrom-packagegroup-boot \
>         packagegroup-basic \
> -       ${CONMANPKGS} \
>         ${ROOTFS_PKGMANAGE_PKGS} \
>         timestamp-service \
>  "
> 
> as that was causing a failure due to a missing "ofono.service" file,
> which i didn't really care about so it was just easier to delete that
> line to get the build to finish.
> 
>   at that point, i was so close, and then this when trying to build
> the rootfs:
> 
> ... snip ...
> | Configuring packagegroup-ti-test.
> | Configuring alsa-utils-aseqnet.
> | Configuring alsa-utils-aseqdump.
> | Configuring alsa-utils.
> | Collected errors:
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies for angstrom-packagegroup-boot:
> |  * 	systemd *
> |  * opkg_install_cmd: Cannot install package angstrom-packagegroup-boot.
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies for packagegroup-basic:
> |  * 	systemd * 	systemd * 	systemd *
> |  * opkg_install_cmd: Cannot install package packagegroup-basic.
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies for timestamp-service:
> |  * 	systemd *
> |  * opkg_install_cmd: Cannot install package timestamp-service.
> | ERROR: Function failed: do_rootfs (see /home/rpjday/oe/builds/ti/arago/tmp-eglibc/work/am180x_evm-oe-linux-gnueabi/ti-hw-bringup-image/1.0-r0/temp/log.do_rootfs.2444 for further information)
> ERROR: Task 7 (/home/rpjday/oe/dist/layers/meta-ti/recipes-misc/images/ti-hw-bringup-image.bb, do_rootfs) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 2679 tasks of which 2678 didn't need to be rerun and 1 failed.
> No currently running tasks (2678 of 2680)
> 
> Summary: 1 task failed:
>   /home/rpjday/oe/dist/layers/meta-ti/recipes-misc/images/ti-hw-bringup-image.bb, do_rootfs
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> $
> 
>   has anyone actually built that HW bringup image?  and can explain
> how to get around what happened above?  thanks.
> 
> rday
> 
> p.s.  here's the relevant part of my bblayers.conf file:
> 
> BBLAYERS ?= " \
>   /home/rpjday/oe/dist/layers/oe-core/meta \
>   /home/rpjday/oe/dist/layers/meta-ti \
>   /home/rpjday/oe/dist/layers/meta-angstrom \
>   /home/rpjday/oe/dist/layers/meta-openembedded/meta-systemd \
>   /home/rpjday/oe/dist/layers/meta-openembedded/meta-oe \
>   "
> 
> 
> -- 
> 
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
> 
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

