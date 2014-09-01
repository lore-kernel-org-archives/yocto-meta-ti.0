Return-Path: <pab@pabigot.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CBEC8E006B5; Mon,  1 Sep 2014 14:10:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [173.201.192.234 listed in list.dnswl.org]
Received: from p3plsmtpa07-05.prod.phx3.secureserver.net
	(p3plsmtpa07-05.prod.phx3.secureserver.net [173.201.192.234])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45243E004F5
	for <meta-ti@yoctoproject.org>; Mon,  1 Sep 2014 14:10:07 -0700 (PDT)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa07-05.prod.phx3.secureserver.net with 
	id lxA11o0061mTNtu01xA1Vb; Mon, 01 Sep 2014 14:10:03 -0700
Message-ID: <5404E0A8.8030204@pabigot.com>
Date: Mon, 01 Sep 2014 16:10:00 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <5087658.bcI9hl3Jbj@localhost.localdomain>
In-Reply-To: <5087658.bcI9hl3Jbj@localhost.localdomain>
Subject: Re: BBB + uboot 2014.07 - not booting
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
X-List-Received-Date: Mon, 01 Sep 2014 21:10:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I am seeing the same behavior with an SD card with u-boot from current 
meta-ti master (MLO-beaglebone-2014.07-r1+gitrAUTOINC+8bd803d2c5)

I partition the cards and create the boot/root partitions with:

sudo dd if=/dev/zero of=${MMC} bs=1024 count=1024
( echo ,9,0x0C,* ; echo ,,,- ) \
   | sudo sfdisk -D -H 255 -S 63 ${MMC}

${SUDO} mkfs.vfat -F 16 -n boot ${MMC}1
${SUDO} mkfs -t ${FSTYPE} -L rootfs ${MMC}2

${SUDO} cp -p MLO u-boot.img ${MPROOT}/boot

This process works with poky master and yocto-bsp on beaglebone.

I recall from long ago that some TI systems were picky about the 
partitioning of the boot media.  Would somebody with an SD card image 
that boots the current meta-ti master provide the output of fdisk -lu 
from it, or a pointer to instructions for doing the formatting?  For 
reference, what doesn't work is:

llc[325]$ sudo fdisk -lu /dev/sdh

Disk /dev/sdh: 7892 MB, 7892631552 bytes
255 heads, 63 sectors/track, 959 cylinders, total 15415296 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00000000

    Device Boot      Start         End      Blocks   Id  System
/dev/sdh1   *          63      144584       72261    c  W95 FAT32 (LBA)
/dev/sdh2          144585    15406334     7630875   83  Linux

Thanks.

Peter


On 08/19/2014 04:29 AM, Maciej Borzecki wrote:
> Hi all,
>
> There seems to be a problem booting BBB from SD card with uboot 2014.07 from
> meta-ti, 2013.07 from yocto seems to work.
> The card is partitioned as follows:
>
> Device         Boot     Start       End Blocks  Id System
> /dev/mmcblk0p1 *         2048     22527  10240   c W95 FAT32 (LBA)
> /dev/mmcblk0p2          22528    227327 102400  83 Linux
>
> I've already tried different cards.
>
> This is all I get on the serial console:
>
> U-Boot SPL 2014.07 (Aug 19 2014 - 10:45:01)
> MMC: block number 0x100 exceeds max(0x0)
> MMC: block number 0x200 exceeds max(0x0)
> *** Error - No Valid Environment Area found
> Using default environment
>
> MMC: block number 0x1 exceeds max(0x0)
> ** Can't read partition table on 0:0 **
> ** Partition 1 not valid on device 0 **
> spl_register_fat_device: fat register err - -1
> ### ERROR ### Please RESET the board ###
>


