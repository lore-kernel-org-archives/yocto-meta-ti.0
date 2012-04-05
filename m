Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A3B69E0044A
	for <meta-ti@yoctoproject.org>; Thu,  5 Apr 2012 12:15:15 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M20006SITH1Z150@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 05 Apr 2012 14:15:05 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C7298201AE; Thu,
	05 Apr 2012 15:15:01 -0400 (EDT)
Date: Thu, 05 Apr 2012 15:15:01 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Russell Senior <russell@personaltelco.net>
Message-id: <20120405191501.GB5144@denix.org>
References: <86pqbmm4oe.fsf@coulee.tdb.com>
MIME-version: 1.0
In-reply-to: <86pqbmm4oe.fsf@coulee.tdb.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Thu, 05 Apr 2012 19:15:15 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Apr 05, 2012 at 11:09:21AM -0700, Russell Senior wrote:
> 
> I have been unable to get a booting image out of Angstrom in about
> three weeks of trying and several unanswered queries to the mailing
> list and elsewhere.  In my continuing effort to get a build system
> that produces an image that boots on my beaglebone, I'd like to try
> building meta-ti with poky, just to see if that fails for me too.

As far as I remember, you are having problems with rootfs images that generate 
an entire SD card disk image with multiple partitions, e.g. Cloud9 image. 
There are known issues with the tools used to do that, like sometimes fdisk 
not making the correct MBR and partition table that BootROM can boot from. So 
far it seems to depend on the host distro and their tools. This area still 
needs further investigation and probably the use of different tools...

But you should not be stuck on this - why don't you use the individual pieces, 
like kernel image, rootfs and load them on SD card yourself, manually? Try 
working around the issue...

-- 
Denys

