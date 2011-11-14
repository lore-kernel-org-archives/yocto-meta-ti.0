Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36484E00305
	for <meta-ti@yoctoproject.org>; Sun, 13 Nov 2011 21:00:21 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LUM00DMJWJVTR51@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sun, 13 Nov 2011 23:00:08 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8A08814AF5D; Sun,
	13 Nov 2011 23:59:55 -0500 (EST)
Date: Sun, 13 Nov 2011 23:59:55 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Peter Bigot <bigotp@acm.org>
Message-id: <20111114045955.GB15557@denix.org>
References: <CAPOJ94MU-om2UXuHBi+Vfdqr8e_MpWgTnHL__Y0KCELBv1tcpw@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAPOJ94MU-om2UXuHBi+Vfdqr8e_MpWgTnHL__Y0KCELBv1tcpw@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: meta-ti@yoctoproject.org
Subject: Re: checksum and path issues building gstreamer-ti
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
X-List-Received-Date: Mon, 14 Nov 2011 05:00:21 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Nov 13, 2011 at 09:37:47PM -0600, Peter Bigot wrote:
> I didn't get an answer to this when I asked it as an aside on the
> BeagleBoard google group, but just verified that the same problems are
> present in oe-classic as is in oe-core.
> 
> The recipe checksums don't match the current downloads:
> 
> vmserver[52]$ cd Downloads/
> vmserver[53]$ md5sum ti_cgt_c6000_6.1.17_setup_linux_x86.bin
> 5ee5c8e573ab0a1ba1249511d4a06c27 ti_cgt_c6000_6.1.17_setup_linux_x86.bin
> vmserver[54]$ sha256sum ti_cgt_c6000_6.1.17_setup_linux_x86.bin
> 0cb99e755f5d06a74db22d7c814e4dfd36aa5fcb35eeab01ddb000aef99c08c1
> ti_cgt_c6000_6.1.17_setup_linux_x86.bin
> 
> When that's corrected still doesn't work because do_unpack puts the
> toolchain in  /opt/TI/TI_CGT_C6000_6.1.17/ instead of under
> ${installdir} where ti-paths.inc expects it.
> 
> NOTE: package ti-cgt6x-1_6_1_17-r4: task do_install: Started
> ERROR: Logfile of failure stored in:
> /prj/oe/oe-dev/build/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-cgt6x-1_6_1_17-r4/temp/log.do_install.20024
> Log data follows:
> | + do_install
> | + install -d /prj/oe/oe-dev/build/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-cgt6x-1_6_1_17-r4/image/usr/share/ti/ti-cgt6x-tree
> | + cp -pPrf '/prj/oe/oe-dev/build/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-cgt6x-1_6_1_17-r4/cgt6x_6_1_17/*'
> /prj/oe/oe-dev/build/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-cgt6x-1_6_1_17-r4/image/usr/share/ti/ti-cgt6x-tree
> | cp: cannot stat
> `/prj/oe/oe-dev/build/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-cgt6x-1_6_1_17-r4/cgt6x_6_1_17/*':
> No such file or directory
> NOTE: package ti-cgt6x-1_6_1_17-r4: task do_install: Failed
> 
> For the version in meta-ti, the LIC_FILES_CHKSUM value was reverted to
> a wrong checksum when it got moved to the recipe file in commit
> 7feec8987.
> 
> Or maybe somebody at TI updated
> ti_cgt_c6000_6.1.17_setup_linux_x86.bin and the recipe is now broken
> for anybody who doesn't have a cached copy of a previous release.  I'm
> going to scrap this and move on, but it'd probably be worth verifying
> that current Angstrom (classic or core) works with current downloads
> of the codegen tools.

Yes, the binary download of CGT 6.1.17 was updated, unfortunately:

https://lists.yoctoproject.org/pipermail/meta-ti/2011-October/000016.html

And we did follow up with CGT team. As one of the options to handle this 
situation more gracefully, I pointed out at the way FSF handled it for when 
they needed to update all previous releases of binutils - they made available 
the updated binaries with a suffix.

Anyway, we need to ping them again and see if this can be done similarly with 
CGT updates...

Roger/Jason,

Would you mind?

-- 
Denys

