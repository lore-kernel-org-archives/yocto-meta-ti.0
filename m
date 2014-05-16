Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 54330E00716; Fri, 16 May 2014 10:29:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from arroyo.ext.ti.com (unknown [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1D95EE006EC
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 10:29:49 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4GHThnI020849;
	Fri, 16 May 2014 12:29:43 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GHThOA029259;
	Fri, 16 May 2014 12:29:43 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 May 2014 12:29:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GHThTu018522;
	Fri, 16 May 2014 12:29:43 -0500
Date: Fri, 16 May 2014 13:29:42 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Mark O'Donovan" <shiftee@eircom.net>
Message-ID: <20140516172942.GA18053@edge>
References: <CAJv4cO2zWjwBKPVe9Xs4zs4F6ynQ6987CEdjsRnzVDkH=oThdw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJv4cO2zWjwBKPVe9Xs4zs4F6ynQ6987CEdjsRnzVDkH=oThdw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Beaglebone usb issue after first reboot
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
X-List-Received-Date: Fri, 16 May 2014 17:29:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, May 14, 2014 at 12:38:10PM +0100, Mark O'Donovan wrote:
> Issue:
> Beaglebone black detects usb devices on first boot after flashing sd-card.
> On subsequent boots it does not.
> 
> Setup:
> Yocto Project 1.5.1
> linux-ti-staging 3.12.17
> meta-ti = "dora:990d8f62257029e25fc2b8786155bcf5dc483659"
> 
> Using the diff command found here:
> http://superuser.com/a/470876
> 
> I found the following:
> diff -r CLEAN-IMAGE/etc/udev/cache.data BOOTED-IMAGE/etc/udev/cache.data
> 0a1
> > Linux version 3.12.17 (modonovan@changanu) (gcc version 4.8.1 (GCC) ) #3
> SMP PREEMPT Thu May 1 14:08:42 IST 2014console=ttyO0,115200n8
> root=/dev/mmcblk0p2 ro rootfstype=ext4 rootwaitCharacter devices:1 mem4
> /dev/vc/04 tty4 ttyS5 /dev/tty5 /dev/console5 /dev/ptmx7 vcs10 misc13
> input29 fb81 video4linux89 i2c90 mtd128 ptm136 pts180 usb188 ttyUSB189
> usb_device247 ttySDIO248 usbmon249 ttyO250 watchdog251 ptp252 pps253
> media254 rtcBlock devices:1 ramdisk259 blkext7 loop8 sd31 mtdblock65 sd66
> sd67 sd68 sd69 sd70 sd71 sd128 sd129 sd130 sd131 sd132 sd133 sd134 sd135
> sd179 mmc
> 
> 
> Running the following after booting fixes the issue on the next boot:
> echo "" > /etc/udev/cache.data
> 
> Is this a known issue??

Mark,

Thanks for the report! Yes, I've seen this issue before and had a workaround 
for it, but I didn't trace it to the udev cache. I'll check it again.

-- 
Denys

