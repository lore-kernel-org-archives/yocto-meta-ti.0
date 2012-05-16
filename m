Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A6D11E0140C
	for <meta-ti@yoctoproject.org>; Wed, 16 May 2012 10:12:20 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M4400G4LL3V4KP0@vms173015.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 16 May 2012 12:11:57 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 493CA20053; Wed,
	16 May 2012 13:11:54 -0400 (EDT)
Date: Wed, 16 May 2012 13:11:54 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-id: <20120516171154.GM14763@denix.org>
References: <CAN-pQATO_EjYx2g5oM5Hja-FawTOy00wOBkDFEgutwaCRh1kxQ@mail.gmail.com>
	<CAN-pQAT-__u2-f6YiM307YeDUUeUOCOx9=AQ3+rZJBVU1sXSJA@mail.gmail.com>
	<CAMKF1sq1+NSzD3WWTVJLrxJDXuzkA_w9hO7r4WrTL1CFe3hD_Q@mail.gmail.com>
	<CAN-pQAS=L-VKUYqYRNqYHGOrhHf69KjZJ0PGFtFjJHccefHGng@mail.gmail.com>
	<CAMKF1sqiMSbf6+KSc-L5w7Aqeg2zbLB3xgKSf-CSPTn4iVug_Q@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAMKF1sqiMSbf6+KSc-L5w7Aqeg2zbLB3xgKSf-CSPTn4iVug_Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Building issues with meta-toolchain on Beaglebone
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
X-List-Received-Date: Wed, 16 May 2012 17:12:20 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, May 16, 2012 at 09:57:29AM -0700, Khem Raj wrote:
> On Wed, May 16, 2012 at 9:32 AM, Nick G <exosyst+metaTI@gmail.com> wrote:
> > /media/scratch/poky-denzil-7.0/beaglebone/tmp/sysroots/i686-linux/usr/lib/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.6.4/include-fixed/limits.h:169:61:
> > error: no include path in which to search for limits.h
> 
> this is the error. I have seen this error in past look for patches in
> master against
> gcc recipes where this might be fixed.

include-fixed/limits.h is many years old issue! I remember fixing it at least 
4 years ago. I'm surprised it still happens these days... :)

What is the way to reproduce it?

-- 
Denys

