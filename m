Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15162E003E4
	for <meta-ti@yoctoproject.org>; Sat,  3 Mar 2012 00:27:13 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0A000RLVH1TE80@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sat, 03 Mar 2012 02:27:02 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5670F20272; Sat,
	03 Mar 2012 03:27:00 -0500 (EST)
Date: Sat, 03 Mar 2012 03:27:00 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Gary Thomas <gary@mlbassoc.com>
Message-id: <20120303082700.GG24667@denix.org>
References: <4F50DF80.10703@mlbassoc.com> <4F50E0D4.5010606@mlbassoc.com>
MIME-version: 1.0
In-reply-to: <4F50E0D4.5010606@mlbassoc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: Can't build for BeagleBone
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
X-List-Received-Date: Sat, 03 Mar 2012 08:27:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Mar 02, 2012 at 08:01:40AM -0700, Gary Thomas wrote:
> On 2012-03-02 07:56, Gary Thomas wrote:
> >In a freshly updated Angstrom tree:
> >OE Build Configuration:
> >BB_VERSION = "1.15.1"
> >TARGET_ARCH = "arm"
> >TARGET_OS = "linux-gnueabi"
> >MACHINE = "beaglebone"
> >DISTRO = "angstrom"
> >DISTRO_VERSION = "v2012.03-core"
> >TUNE_FEATURES = "armv7a vfp neon cortexa8"
> >TARGET_FPU = "vfp-neon"
> >meta-angstrom = "master:2129eed920364abcc4f3f72d395333a041634e26"
> >meta-oe
> >meta-efl
> >meta-gpe
> >meta-gnome
> >meta-xfce
> >meta-initramfs = "master:fdff8697ea2db6254d26510adb7d11e6352d950f"
> >meta-opie = "master:efa3892b20a4ef80274e56e5633ebd62c16f9731"
> >meta-java = "master:d430de31c167cd264be74a1d82af4b732bb915dd"
> >meta-ti = "master:2dbb7f09bf1c54d505d2e84a3a614bc5ca9b89aa"
> >meta-efikamx = "master:2c09a3a780b23448e8a6ca964256ff7f5ccba65d"
> >meta-nslu2 = "master:3d9fc951b05b4df476374b6fc3085ebac7f293ee"
> >meta-htc
> >meta-nokia
> >meta-openmoko
> >meta-palm = "master:cda19686a2a3573ce50c86733c3469d926124995"
> >meta-handheld = "master:fa1e6dcb524eb7ed29a6cd971a150d35c31e96e7"
> >meta-intel
> >meta-sugarbay
> >meta-crownbay
> >meta-emenlow
> >meta-fishriver
> >meta-jasperforest
> >meta-n450 = "master:df18b721f86f0737c0f302e49b27ea232c70e683"
> >meta = "master:d94cb18f7f17a492c7a948337d7d2d1d0785573f"
> >
> >% MACHINE="beaglebone" bitbake cloud9-image
> >...
> >| cp: cannot stat `/local/new-angstrom/sources/meta-ti/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/./configs/*': No such file or directory
> >| ERROR: Function failed: Unpack failure for URL: 'file://configs/*'. Unpack command
> >PATH="/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi:/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beaglebone/usr/bin/crossscripts:/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/sbin:/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/bin:/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/sbin:/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux//bin:/local/new-angstrom/sources/openembedded-core/scripts:/local/new-angstrom/sources/bitbake/bin:/usr/lib/ccache:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/gthomas/bin:/local/new-angstrom/sources/openembedded-core/scripts"
> >cp /local/new-angstrom/sources/meta-ti/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/./configs/*
> >/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r4c+gitr09e9651bcf2ee8d86685f2a8075bc6557b1d3b91/configs/ failed
> >with return value 1
> >NOTE: package linux-ti33x-psp-3.2-r4c+gitr09e9651bcf2ee8d86685f2a8075bc6557b1d3b91: task do_unpack: Failed
> >
> >Did I miss something?
> >
> 
> To be clear, I have built this before in this same tree when the
> kernel recipe was at
>   uImage-3.2-r2e+gitr21ef5e1fa530eb8f23bfe18650e3915d7c291ca9-beaglebone-20120224112658.bin
> 
> In my tree, I execute these steps (same tree, same login window, 8 days later):
>   % ./oebb.sh update
>   % MACHINE="beaglebone" bitbake cloud9-image

Gary,

Can you please try again after updating meta-ti? Thanks.

-- 
Denys

