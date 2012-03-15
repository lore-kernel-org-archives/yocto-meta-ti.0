Return-Path: <russell@personaltelco.net>
Received: from mail.tdb.com (mail.tdb.com [216.99.214.4])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id A16BCE011D1
	for <meta-ti@yoctoproject.org>; Thu, 15 Mar 2012 00:17:38 -0700 (PDT)
Received: (qmail 378 invoked from network); 15 Mar 2012 00:17:37 -0700
Received: from unknown (HELO coulee.tdb.com) (216.99.214.7)
	by mail.tdb.com with SMTP; 15 Mar 2012 00:17:37 -0700
Received: (qmail 21831 invoked by uid 1001); 15 Mar 2012 07:17:37 -0000
To: meta-ti@yoctoproject.org
From: Russell Senior <russell@personaltelco.net>
Date: Thu, 15 Mar 2012 00:17:37 -0700
Message-ID: <86lin21gfi.fsf@coulee.tdb.com>
User-Agent: Gnus/5.101 (Gnus v5.10.10) Emacs/21.4 (gnu/linux)
MIME-Version: 1.0
Subject: [Angstrom-devel] Can't build cloud9 image
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
X-List-Received-Date: Thu, 15 Mar 2012 07:17:38 -0000
Content-Type: text/plain; charset=us-ascii


>>> At the risk of responding to a practical joke: /etc/fstab entries
>>> need to be created with the user flag for the loop devices, the
>>> error message even includes the exact entry you need to add.
>> 
>> I see that, but what if I'm "Joe user" who can't (or doesn't want
>> to)
>> edit /etc/fstab?

> Then you can't build this image.

FWIW, I added the /etc/fstab entry provide (for /dev/loop2) but I
still get this at the end (from build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/cloud9-image-1.0-r0/temp/log.do_rootfs

[...]
./media/mmc1/
./media/union/
./media/realroot/
loop: can't delete device /dev/loop1: Permission denied
loop: can't delete device /dev/loop2: Permission denied
loop: can't delete device /dev/loop3: Permission denied
/dev/loop1: Permission denied

>>  Everything else builds with no special "root" style
>> privileges, why does this one image need it?

> Simply put: because the tools suck. A this point in time there is no
> tool (or tools plural) that allows creating 2 partitions (vfat and
> extX) and concatenating them into a valid image with an MBR. The
> biggest lack is something like 'genfatfs', mcopy is a step in the
> right direction but is too limited to work in this scenario.
> And genext2fs will likely OOM on a lot of buildmachines.

Are you familiar with makebootfat?

  http://linux.die.net/man/1/makebootfat


-- 
Russell Senior, President
russell@personaltelco.net

