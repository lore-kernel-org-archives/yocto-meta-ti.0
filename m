Return-Path: <russell@personaltelco.net>
Received: from mail.tdb.com (mail.tdb.com [216.99.214.4])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id D44DFE0044A
	for <meta-ti@yoctoproject.org>; Sun,  1 Apr 2012 21:57:06 -0700 (PDT)
Received: (qmail 18709 invoked from network); 1 Apr 2012 21:57:06 -0700
Received: from unknown (HELO coulee.tdb.com) (216.99.214.7)
	by mail.tdb.com with SMTP; 1 Apr 2012 21:57:06 -0700
Received: (qmail 18257 invoked by uid 1001); 2 Apr 2012 04:57:05 -0000
To: Denys Dmytriyenko <denis@denix.org>
References: <86lin21gfi.fsf@coulee.tdb.com> <20120329012237.GE32193@denix.org>
From: Russell Senior <russell@personaltelco.net>
Date: Sun, 01 Apr 2012 21:57:05 -0700
In-Reply-To: <20120329012237.GE32193@denix.org> (Denys Dmytriyenko's message
	of "Wed\, 28 Mar 2012 21\:22\:37 -0400")
Message-ID: <86iphivihq.fsf@coulee.tdb.com>
User-Agent: Gnus/5.101 (Gnus v5.10.10) Emacs/21.4 (gnu/linux)
MIME-Version: 1.0
Cc: meta-ti@yoctoproject.org
Subject: Re: [Angstrom-devel] Can't build cloud9 image
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
X-List-Received-Date: Mon, 02 Apr 2012 04:57:07 -0000
Content-Type: text/plain; charset=us-ascii

>>>>> "Denys" == Denys Dmytriyenko <denis@denix.org> writes:

Denys> On Thu, Mar 15, 2012 at 12:17:37AM -0700, Russell Senior wrote:
>> > Then you can't build this image.
>> 
>> FWIW, I added the /etc/fstab entry provide (for /dev/loop2) but I
>> still get this at the end (from
>> build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/cloud9-image-1.0-r0/temp/log.do_rootfs
>> 
>> [...]  ./media/mmc1/ ./media/union/ ./media/realroot/ loop: can't
>> delete device /dev/loop1: Permission denied loop: can't delete
>> device /dev/loop2: Permission denied loop: can't delete device
>> /dev/loop3: Permission denied /dev/loop1: Permission denied

Denys> Well, mine gets further (although it's not my main focus now):

Yeah, that was just because i wasn't in the 'disk' group in
/etc/groups.  Thank you to the interwebs for digging that one up for
me.

The compile is finishing for me currently, but I still can't get it to
boot, built on debian/unstable.  The MLO I build doesn't seem to get
recognized by my A4 beaglebone.  The ROM code spits C's at me as if
the microSD card wasn't there.  The microSD card is okay though (an 8
gig Kingston class 10 thing), because I can /sbin/dd the online
angstrom cloud9 demo image[1] on it and that boots.

[1] http://www.angstrom-distribution.org/demo/beaglebone/Angstrom-Cloud9-IDE-eglibc-ipk-v2012.02-core-beaglebone-2012.02.14.img.xz


-- 
Russell Senior, President
russell@personaltelco.net

