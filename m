Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87655E0044D
	for <meta-ti@yoctoproject.org>; Sun,  8 Apr 2012 18:40:38 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M2600LV3VBAA4R0@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sun, 08 Apr 2012 20:40:27 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id EB42B201CF; Sun,
	08 Apr 2012 21:40:21 -0400 (EDT)
Date: Sun, 08 Apr 2012 21:40:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Russell Senior <russell@personaltelco.net>
Message-id: <20120409014021.GD10246@denix.org>
References: <86pqbmm4oe.fsf@coulee.tdb.com> <20120405191501.GB5144@denix.org>
	<86bon5nc3h.fsf@coulee.tdb.com> <86zkapljsw.fsf@coulee.tdb.com>
MIME-version: 1.0
In-reply-to: <86zkapljsw.fsf@coulee.tdb.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, angstrom-distro-devel@linuxtogo.org
Subject: Re: building meta-ti + poky HOWTO?
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
X-List-Received-Date: Mon, 09 Apr 2012 01:40:38 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Apr 05, 2012 at 06:40:15PM -0700, Russell Senior wrote:
> >>>>> "Russell" == Russell Senior <russell@personaltelco.net> writes:
> 
> Russell> [...] I have tried taking the pre-baked Angstrom image from here:
> 
> Russell>
> Russell> http://www.angstrom-distribution.org/demo/beaglebone/Angstrom-Cloud9-IDE-eglibc-ipk-v2012.02-core-beaglebone-2012.02.14.img.xz
> 
> Russell> (which works for me), and replacing the uImage on the vfat
> Russell> partition by copying over the existing one with one I built.
> Russell> That boots, but the rootfs isn't aligned (different
> Russell> kernel/module versions?).
> 
> With that in mind, I discovered that uEnv.txt had "quiet", so I tried
> booting without that and got some new information:
> 
>   Failed to start Journal Service                                        [FAILED]
>   See 'systemctl status systemd-journald.service' for details.                   
>   Started udev Coldplug all Devices                                      [  OK  ]
>   Started File System Check on Root Device                               [  OK  ]
>   Starting Remount Root FS...                                                    
>   Failed to start Remount Root FS                                        [FAILED]
>   See 'systemctl status remount-rootfs.service' for details.                     
>   Starting /tmp...                                                               
>   Starting Machine ID first boot configure...                                    
>   Starting Run pending postinsts...                                              
>   Failed to start /tmp                                                   [FAILED]
>   See 'systemctl status tmp.mount' for details.                                  
>   Dependency failed. Aborted start of Serial Getty on ttyO0              [ABORT]
>   Dependency failed. Aborted start of Getty on tty1                      [ABORT]
>   udevd[67]: timeout, giving up waiting for workers to finish
> 
> This looks like the same problem as here: 
> 
>   http://lists.linuxtogo.org/pipermail/angstrom-distro-devel/2012-March/005762.html
> 
> That was a month ago.  Why hasn't this been fixed?  I'm running a stock/very-recent checkout.

Russell,

It appears your kernel configuration may not have all the required options 
enabled to work properly with latest udev and systemd, according to this post:
http://lists.linuxtogo.org/pipermail/angstrom-distro-devel/2012-March/005793.html

As it was mentioned in the reply, enabling those options fixes the [FAILED] 
issues above with the Journal Service:
http://lists.linuxtogo.org/pipermail/angstrom-distro-devel/2012-March/005798.html

Also, please follow the rest of the thread for additional info:
http://thread.gmane.org/gmane.linux.distributions.angstrom.devel/6142

-- 
Denys

