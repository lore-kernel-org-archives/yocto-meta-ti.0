Return-Path: <pab@pabigot.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F5ECE00842; Tue,  2 Sep 2014 04:42:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [68.178.252.102 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from p3plsmtpa11-01.prod.phx3.secureserver.net
	(p3plsmtpa11-01.prod.phx3.secureserver.net [68.178.252.102])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C4C53E00837
	for <meta-ti@yoctoproject.org>; Tue,  2 Sep 2014 04:42:13 -0700 (PDT)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa11-01.prod.phx3.secureserver.net with 
	id mBiB1o00G1mTNtu01BiCuk; Tue, 02 Sep 2014 04:42:13 -0700
Message-ID: <5405AD13.7000306@pabigot.com>
Date: Tue, 02 Sep 2014 06:42:11 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>, 
 meta-ti@yoctoproject.org
References: <5087658.bcI9hl3Jbj@localhost.localdomain>
	<CAMCfZKEqU=Ric8131BA=nrToyAWxaEbHs0e-3EzKAz6CQUrtNA@mail.gmail.com>
	<5405010E.2070400@pabigot.com>
	<3756859.1y16KtP05K@localhost.localdomain>
In-Reply-To: <3756859.1y16KtP05K@localhost.localdomain>
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
X-List-Received-Date: Tue, 02 Sep 2014 11:42:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2014 02:56 AM, Maciej Borzecki wrote:
> On Monday 01 of September 2014 18:28:14 Peter A. Bigot wrote:
>> On 09/01/2014 04:53 PM, Diego Sueiro wrote:
>>> Peter,
>>>
>>> On Mon, Sep 1, 2014 at 6:10 PM, Peter A. Bigot <pab@pabigot.com
>>>
>>> <mailto:pab@pabigot.com>> wrote:
>>>      I am seeing the same behavior with an SD card with u-boot from
>>>      current meta-ti master
>>>      (MLO-beaglebone-2014.07-r1+gitrAUTOINC+8bd803d2c5)
>>>      
>>>      I partition the cards and create the boot/root partitions with:
>>>      
>>>      sudo dd if=/dev/zero of=${MMC} bs=1024 count=1024
>>>      ( echo ,9,0x0C,* ; echo ,,,- ) \
>>>      
>>>        | sudo sfdisk -D -H 255 -S 63 ${MMC}
>>>      
>>>      ${SUDO} mkfs.vfat -F 16 -n boot ${MMC}1
>>>      ${SUDO} mkfs -t ${FSTYPE} -L rootfs ${MMC}2
>>>      
>>>      ${SUDO} cp -p MLO u-boot.img ${MPROOT}/boot
>>>      
>>>      This process works with poky master and yocto-bsp on beaglebone.
>>>      
>>>      I recall from long ago that some TI systems were picky about the
>>>      partitioning of the boot media.
>>>
>>> This is not true for recent Sitara SoCs:
>>> http://permalink.gmane.org/gmane.comp.handhelds.openembedded/64088
>>>
>>>      Would somebody with an SD card image that boots the current
>>>      meta-ti master provide the output of fdisk -lu from it, or a
>>>      pointer to instructions for doing the formatting?  For reference,
>>>      what doesn't work is:
>>>      
>>>      llc[325]$ sudo fdisk -lu /dev/sdh
>>>      
>>>      Disk /dev/sdh: 7892 MB, 7892631552 bytes
>>>      255 heads, 63 sectors/track, 959 cylinders, total 15415296 sectors
>>>      Units = sectors of 1 * 512 = 512 bytes
>>>      Sector size (logical/physical): 512 bytes / 512 bytes
>>>      I/O size (minimum/optimal): 512 bytes / 512 bytes
>>>      Disk identifier: 0x00000000
>>>      
>>>         Device Boot      Start         End      Blocks  Id  System
>>>      
>>>      /dev/sdh1   *          63      144584       72261    c W95 FAT32 (LBA)
>>>      /dev/sdh2          144585    15406334     7630875   83 Linux
>>>
>>> I'm using the following partition layout (both working on eMMC and
>>>
>>> sdcard with u-boot_2014.07.bb <http://u-boot_2014.07.bb>):
>>>      # fdisk -lu /dev/mmcblk0
>>>      
>>>      Disk /dev/mmcblk0: 1920 MB, 1920991232 bytes, 3751936 sectors
>>>      Units = sectors of 1 * 512 = 512 bytes
>>>      Sector size (logical/physical): 512 bytes / 512 bytes
>>>      I/O size (minimum/optimal): 512 bytes / 512 bytes
>>>      Disk label type: dos
>>>      Disk identifier: 0x00000000
>>>      
>>>              Device Boot      Start     End      Blocks   Id  System
>>>      
>>>      /dev/mmcblk0p1   *          63   80324       40131    c  W95 FAT32
>>>      (LBA)
>> Thanks.  That does appear to be an eMMC partition, which probably
>> shouldn't matter, but I replicated the configuration on a 2GB class 4
>> uSD card, and an 8GB class 6, and it doesn't work on either one.
>>
>> llc[77]$ sudo fdisk -lu /dev/sdh
>>
>> Disk /dev/sdh: 3965 MB, 3965190144 bytes
>> 255 heads, 63 sectors/track, 482 cylinders, total 7744512 sectors
>> Units = sectors of 1 * 512 = 512 bytes
>> Sector size (logical/physical): 512 bytes / 512 bytes
>> I/O size (minimum/optimal): 512 bytes / 512 bytes
>> Disk identifier: 0x00000000
>>
>>      Device Boot      Start         End      Blocks   Id  System
>> /dev/sdh1   *          63       80324       40131    c  W95 FAT32 (LBA)
>> /dev/sdh2           80325     7743329     3831502+  83  Linux
>>
>> Anybody got a uSD partition layout that works?  I'm suspecting an issue
>> with the heads/sectors/cylinders configuration.
> Try looking here:
> http://article.gmane.org/gmane.linux.embedded.yocto.meta-ti/4371
>
> Although I could not confirm this, it seems that the first partition on SD
> needs to have an even block count (not sure about eMMC though, but I'm
> guessing the same rules apply).

I had seen that, and did try even block counts, which didn't help. 
Please try applying the u-boot patch I sent to your build and seeing if 
that fixes the issue for you.  The symptoms you described fit it precisely.

It's not obvious whether the problem remains when the upstream changes 
to u-boot that conflict with it are present, but they're past 2014.07 so 
it'd be good to get that patch into meta-ti or the TI u-boot branch.  
I'd push it to OE Core but they're still at 2013.07 which doesn't have 
this problem.  If it also fixes the problems you and Diego are having 
that's more evidence it's worth adding.

Peter

