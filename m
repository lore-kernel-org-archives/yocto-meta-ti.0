Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23C64E016A3
	for <meta-ti@yoctoproject.org>; Tue,  8 Oct 2013 14:38:55 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUD002VUDFX2XD0@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 08 Oct 2013 16:38:37 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9625C200F4; Tue,
	08 Oct 2013 17:38:21 -0400 (EDT)
Date: Tue, 08 Oct 2013 17:38:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Mike Lewis <mikelewis@alphalem.com>
Message-id: <20131008213821.GB26051@denix.org>
References: <5254797B.5020605@alphalem.com>
MIME-version: 1.0
In-reply-to: <5254797B.5020605@alphalem.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: BeagleBone Black rootfs/boot dir empty
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
X-List-Received-Date: Tue, 08 Oct 2013 21:38:56 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Oct 08, 2013 at 02:30:35PM -0700, Mike Lewis wrote:
> Hi,
> 
> I'm trying to boot a poky-dylan core-image-basic image using meta-ti
> on my BBB and u-boot is complaining about two things (so far):
> missing boot/uImage and missing boot/am335x-boneblack.dtb. Here's
> the log:
> 
> http://pastebin.com/Aw4SzxxR
> 
> I copied uImage from partition 1 to partition 2/boot, so hopefully
> that's fine. But bitbake isn't producing the device tree file
> anywhere. Is there a fix for this somewhere or a recipe that I can
> modify to populate the partition 2 /boot dir?

It was just discussed in all the detail couple days ago:
http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/2726

-- 
Denys

