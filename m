Return-Path: <robertcnelson@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6CB1DE0074B; Mon,  1 Sep 2014 16:54:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (robertcnelson[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 00DC0E006B3
	for <meta-ti@yoctoproject.org>; Mon,  1 Sep 2014 16:54:09 -0700 (PDT)
Received: by mail-ie0-f169.google.com with SMTP id tr6so6767708ieb.14
	for <meta-ti@yoctoproject.org>; Mon, 01 Sep 2014 16:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/yewDuNu9v/ZvU8ep7tHbMX3JntdMGAvPTtixpYtK8g=;
	b=jKgHY6yw5tfocOXnT9qHLX5VeS4dd6WwnHQXgthVaKzLyF1MnTxDjQn1ZDLrb6O2SB
	Y3p56ZP0FF2oZgq44U/OEwRu9+a0mL13dD+8w/3hxMub7olGMaZe9hoWOz8qKHbMeokC
	QY+ghI8Z1ZMch8+35X6Q+PSo1C893BZMI7jxigWD5mTd3Nb/K1SJWqRN1I65vE0DS1+y
	6dDPod2IxEVTWzgj84GTjOevtgxEIdwpNQSQxV07krACi4ZYMLM17Jg2cDgh0LJ7yC9Q
	QrBmNQk31VoYRvwb4cbDB7hViwbnr3XpDx89Mb9IEwmWR8IdTY2iu5pB2QjxwUcNc5c0
	DTCQ==
MIME-Version: 1.0
X-Received: by 10.43.140.4 with SMTP id iy4mr28589958icc.23.1409615648485;
	Mon, 01 Sep 2014 16:54:08 -0700 (PDT)
Received: by 10.107.166.16 with HTTP; Mon, 1 Sep 2014 16:54:08 -0700 (PDT)
In-Reply-To: <5405010E.2070400@pabigot.com>
References: <5087658.bcI9hl3Jbj@localhost.localdomain>
	<5404E0A8.8030204@pabigot.com>
	<CAMCfZKEqU=Ric8131BA=nrToyAWxaEbHs0e-3EzKAz6CQUrtNA@mail.gmail.com>
	<5405010E.2070400@pabigot.com>
Date: Mon, 1 Sep 2014 18:54:08 -0500
Message-ID: <CAOCHtYhzAfZwae2x_SjoiXagu3jJqTiM0ts7wZPF45DMzJYPvQ@mail.gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Mon, 01 Sep 2014 23:54:14 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 1, 2014 at 6:28 PM, Peter A. Bigot <pab@pabigot.com> wrote:
> On 09/01/2014 04:53 PM, Diego Sueiro wrote:
>
> Peter,
>
> On Mon, Sep 1, 2014 at 6:10 PM, Peter A. Bigot <pab@pabigot.com> wrote:
>>
>> I am seeing the same behavior with an SD card with u-boot from current
>> meta-ti master (MLO-beaglebone-2014.07-r1+gitrAUTOINC+8bd803d2c5)
>>
>> I partition the cards and create the boot/root partitions with:
>>
>> sudo dd if=/dev/zero of=${MMC} bs=1024 count=1024
>> ( echo ,9,0x0C,* ; echo ,,,- ) \
>>   | sudo sfdisk -D -H 255 -S 63 ${MMC}
>>
>> ${SUDO} mkfs.vfat -F 16 -n boot ${MMC}1
>> ${SUDO} mkfs -t ${FSTYPE} -L rootfs ${MMC}2
>>
>> ${SUDO} cp -p MLO u-boot.img ${MPROOT}/boot
>>
>> This process works with poky master and yocto-bsp on beaglebone.
>>
>> I recall from long ago that some TI systems were picky about the
>> partitioning of the boot media.
>
>
> This is not true for recent Sitara SoCs:
> http://permalink.gmane.org/gmane.comp.handhelds.openembedded/64088
>
>
>>
>> Would somebody with an SD card image that boots the current meta-ti master
>> provide the output of fdisk -lu from it, or a pointer to instructions for
>> doing the formatting?  For reference, what doesn't work is:
>>
>> llc[325]$ sudo fdisk -lu /dev/sdh
>>
>> Disk /dev/sdh: 7892 MB, 7892631552 bytes
>> 255 heads, 63 sectors/track, 959 cylinders, total 15415296 sectors
>> Units = sectors of 1 * 512 = 512 bytes
>> Sector size (logical/physical): 512 bytes / 512 bytes
>> I/O size (minimum/optimal): 512 bytes / 512 bytes
>> Disk identifier: 0x00000000
>>
>>
>>    Device Boot      Start         End      Blocks   Id  System
>> /dev/sdh1   *          63      144584       72261    c  W95 FAT32 (LBA)
>> /dev/sdh2          144585    15406334     7630875   83  Linux
>
>
> I'm using the following partition layout (both working on eMMC and sdcard
> with u-boot_2014.07.bb):
>
> # fdisk -lu /dev/mmcblk0
>
> Disk /dev/mmcblk0: 1920 MB, 1920991232 bytes, 3751936 sectors
> Units = sectors of 1 * 512 = 512 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disk label type: dos
> Disk identifier: 0x00000000
>
>         Device Boot      Start         End      Blocks   Id  System
> /dev/mmcblk0p1   *          63       80324       40131    c  W95 FAT32 (LBA)
>
>
> Thanks.  That does appear to be an eMMC partition, which probably shouldn't
> matter, but I replicated the configuration on a 2GB class 4 uSD card, and an
> 8GB class 6, and it doesn't work on either one.
>
> llc[77]$ sudo fdisk -lu /dev/sdh
>
> Disk /dev/sdh: 3965 MB, 3965190144 bytes
> 255 heads, 63 sectors/track, 482 cylinders, total 7744512 sectors
>
> Units = sectors of 1 * 512 = 512 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disk identifier: 0x00000000
>
>    Device Boot      Start         End      Blocks   Id  System
> /dev/sdh1   *          63       80324       40131    c  W95 FAT32 (LBA)
> /dev/sdh2           80325     7743329     3831502+  83  Linux
>
> Anybody got a uSD partition layout that works?  I'm suspecting an issue with
> the heads/sectors/cylinders configuration.
>
> (FWIW: I'm also using u-boot-staging-ti, as that's the default for
> beaglebone on the master branch.)

You could bypass the whole fat partition (On omap4+ bootrom
generations (including the am335x)):

dd if=MLO of=/dev/sdX count=1 seek=1 conv=notrunc bs=128k
dd if=u-boot.img of=/dev/sdX count=2 seek=1 conv=notrunc bs=384k

Just make sure to leave a 1mb hole when you create a partition for
everything else.

Regards,

-- 
Robert Nelson
http://www.rcn-ee.com/

