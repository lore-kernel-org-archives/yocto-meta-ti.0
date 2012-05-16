Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 98B28E0140C
	for <meta-ti@yoctoproject.org>; Wed, 16 May 2012 11:00:45 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M44006RUNCK0A56@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 16 May 2012 13:00:21 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5D486201AE; Wed,
	16 May 2012 14:00:19 -0400 (EDT)
Date: Wed, 16 May 2012 14:00:19 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nick G <exosyst+metaTI@gmail.com>
Message-id: <20120516180019.GN14763@denix.org>
References: <CAN-pQAQhz3g_R-UvX8Fqv9My944rU-47Kwff1h1JV=kj1M3-FQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAN-pQAQhz3g_R-UvX8Fqv9My944rU-47Kwff1h1JV=kj1M3-FQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Reference to am335x-pm-firmware.bin is hardcoded
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
X-List-Received-Date: Wed, 16 May 2012 18:00:45 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, May 16, 2012 at 05:11:57PM +0100, Nick G wrote:
> The file firmware/am335x-pm-firmware.bin.gen.S contains a hardcoded path -

As the name suggests, it's a generated file.

> in my case it was set to
> /media/scratch/poky-git/beaglebone/tmp/work/beaglebone-poky-linux-gnueabi/linux-ti33x-psp-3.2-r0/git/firmware/am335x-pm-firmware.bin
> 
> The firmware binary, am335x-pm-firmware.bin, is successfully copied into
> the directory but the hardcoded reference remains.
> 
> That patch for this is trivial in the kernel source - just strip the
> location back to "firmware/am335x-pm-firmware.bin" but I'm not sure how to
> fix this with the meta-ti layer but would be happy to do so with
> instruction.

Why do you need it this way? Can you clean your sources and rebuild - it will 
get the correct path again.

-- 
Denys

