Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17AE3E00596
	for <meta-ti@yoctoproject.org>; Wed, 28 Mar 2012 18:23:02 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1M00EBWH5QIDF0@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 28 Mar 2012 20:22:39 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C3971201C7; Wed,
	28 Mar 2012 21:22:37 -0400 (EDT)
Date: Wed, 28 Mar 2012 21:22:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Russell Senior <russell@personaltelco.net>
Message-id: <20120329012237.GE32193@denix.org>
References: <86lin21gfi.fsf@coulee.tdb.com>
MIME-version: 1.0
In-reply-to: <86lin21gfi.fsf@coulee.tdb.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Thu, 29 Mar 2012 01:23:02 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Mar 15, 2012 at 12:17:37AM -0700, Russell Senior wrote:
> > Then you can't build this image.
> 
> FWIW, I added the /etc/fstab entry provide (for /dev/loop2) but I
> still get this at the end (from build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/cloud9-image-1.0-r0/temp/log.do_rootfs
> 
> [...]
> ./media/mmc1/
> ./media/union/
> ./media/realroot/
> loop: can't delete device /dev/loop1: Permission denied
> loop: can't delete device /dev/loop2: Permission denied
> loop: can't delete device /dev/loop3: Permission denied
> /dev/loop1: Permission denied

Well, mine gets further (although it's not my main focus now):

| ./bin/tinylogin
| ./boot/
| ./boot/uImage-3.2.11
| ./boot/uImage
| ./boot/uEnv.txt
| losetup: /dev/loop1: detach failed: No such device or address
| losetup: /dev/loop3: detach failed: No such device or address
| 1024+0 records in
| 1024+0 records out
| 1048576 bytes (1.0 MB) copied, 0.00349814 s, 300 MB/s
| Disk /dev/loop1 doesn't contain a valid partition table
| Checking that no-one is using this disk right now ...
| BLKRRPART: Invalid argument
| OK
| sfdisk: Disk /dev/loop1: cannot get geometry
| 
| 
| Disk /dev/loop1: 444 cylinders, 255 heads, 63 sectors/track
| 
| sfdisk: ERROR: sector 0 does not have an msdos signature
| sfdisk:  /dev/loop1: unrecognized partition table type
| 
| sfdisk: No partitions found
| 
| Old situation:
| New situation:
| Units = cylinders of 8225280 bytes, blocks of 1024 bytes, counting from 0
| 
|    Device Boot Start     End   #cyls    #blocks   Id  System
| /dev/loop1p1   *      0+      8       9-     72261    c  W95 FAT32 (LBA)
| /dev/loop1p2          9     443     435    3494137+  83  Linux
| /dev/loop1p3          0       -       0          0    0  Empty
| /dev/loop1p4          0       -       0          0    0  Empty
| Successfully wrote the new partition table
| 
| Re-reading the partition table ...
| BLKRRPART: Invalid argument
| 
| If you created or changed a DOS partition, /dev/foo7, say, then use dd(1)
| to zero the first 512 bytes:  dd if=/dev/zero of=/dev/foo7 bs=512 count=1
| (See fdisk(8).)
| Warning: block count mismatch: found 3566398 but assuming 72261.
| mkfs.vfat 3.0.12 (29 Oct 2011)
| Loop device does not match a floppy size, using default hd params
| ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded: ignored.
| mount: /dev/loop0: can't read superblock
NOTE: package cloud9-image-1.0-r0: task do_rootfs: Failed


> > Simply put: because the tools suck. A this point in time there is no
> > tool (or tools plural) that allows creating 2 partitions (vfat and
> > extX) and concatenating them into a valid image with an MBR. The
> > biggest lack is something like 'genfatfs', mcopy is a step in the
> > right direction but is too limited to work in this scenario.
> > And genext2fs will likely OOM on a lot of buildmachines.

FWIW, there's a new patchset published in OE-Core ML to address memory issues 
of genext2fs...


> Are you familiar with makebootfat?
> 
>   http://linux.die.net/man/1/makebootfat

Interesting... I think I looked at it before, just need time to try to 
integrate it, time permitting.

-- 
Denys

