Return-Path: <maciej.borzecki@open-rnd.pl>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 49AA5E00B46; Tue,  2 Feb 2016 00:47:25 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 375 seconds by postgrey-1.32 at yocto-www;
	Tue, 02 Feb 2016 00:47:20 PST
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C09EE00AD8
	for <meta-ti@yoctoproject.org>; Tue,  2 Feb 2016 00:47:20 -0800 (PST)
Received: from comp-006-thk (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 14CD61A6E5B;
	Tue,  2 Feb 2016 09:41:03 +0100 (CET)
Message-ID: <1454402462.4337.5.camel@open-rnd.pl>
From: Maciek Borzecki <maciej.borzecki@open-rnd.pl>
To: winiston@futuraautomation.com, Khem Raj <raj.khem@gmail.com>
Date: Tue, 02 Feb 2016 09:41:02 +0100
In-Reply-To: <0A62DD68742E4A579C4F0ABA4650B8F9@RD3>
References: <F3717D3DA0F34B72A567796CC4DFB882@RD3>
	<CAMKF1sop2mXSyhr3Mu3LaLQuc-X=qiUGHnyNkyyb48SHO9+0rg@mail.gmail.com>
	<0A62DD68742E4A579C4F0ABA4650B8F9@RD3>
Organization: Open-RnD sp. z o.o.
X-Mailer: Evolution 3.18.4 (3.18.4-1.fc23) 
Mime-Version: 1.0
Cc: yocto texas <meta-ti@yoctoproject.org>
Subject: Re: Problem to write core-image-minimal of AM437x-evm on SD card
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: maciej.borzecki@open-rnd.pl
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Feb 2016 08:47:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On pon, 2016-02-01 at 17:36 +0530, winiston@futuraautomation.com wrote:
> Sorry...I am new to yocto project.I could not get "wic". How do I setup wic
> and "dd" it into sd card. I did not get angstrom script also. where can I
> get angstrom script ?  can you give the detailed procedure? Is there any
> related documentation available in yocto website?
> Now I used "fdisk" command to format sdcard. I am able to copy MLO &
> u-image.img to BOOT partition. I extracted rootfs to secondary partition
> using"Ark" software.  But in the secondary partition, the files are not
> visible. In properties window, it shows the number of files and size of the
> files. I used that sd card to boot my am437x evm kit. It is not booting.
> What could be the error? Kindly give me the detailed procedure to copy the
> image. What are the files I need to copy for core-image-minimal kernel?
> Note: I am using core-image-minimal

An example kickstart is provided by Poky
(scripts/lib/wic/canned-wks/sdimage-bootpart.wks):

part /boot --source bootimg-partition --ondisk mmcblk --fstype=vfat --label boot --active
--align 4 --size 16
part / --source rootfs --ondisk mmcblk --fstype=ext4 --label root --align 4

This sets up an image with 2 partitions, first one is FAT, aligned to
4kB, 16MB in size. The second one is ext4 and this is where your rootfs
will go.

To build an image run:
wic create sdimage-bootpart -e core-image-minimal

The boot partition is built by bootimg-partition wic source plugin and
it uses IMAGE_BOOT_FILES variable to figure out which files need to be
placed in the partition.  I've added a patch to meta-yocto-bsp to set
IMAGE_BOOT_FILES so that it was possible to build usable images for
BeagleBone Black. The change was not added to meta-ti, so you might want
to set it like this somewhere in your local.conf:

IMAGE_BOOT_FILES ?= "u-boot.${UBOOT_SUFFIX} MLO"

IIRC there's a number of options for building a bootable image am335x,
having MLO and uboot in a FAT partition is just one of them. If you
check the CPU manual there should be some indication on how the build
process pokes at different locations to find a first stage
bootloader.

-- 
Maciej Borzęcki
Senior Software Developer at Open-RnD Sp. z o.o., Poland
www.open-rnd.pl
mobile: +48 889 117 365, fax: +48 42 657 9079

Niniejsza wiadomość wraz z załącznikami może zawierać chronione prawem
lub poufne informacje i została wysłana wyłącznie do wiadomości i
użytku osób, do których została zaadresowana. Jeśli wiadomość została
otrzymana przypadkowo zabrania się jej kopiowania lub rozsyłania do
osób trzecich. W takim przypadku uprasza się o natychmiastowe
zniszczenie wiadomości oraz poinformowanie nadawcy o zaistniałej
sytuacji za pomocą wiadomości zwrotnej. Dziękujemy.

This message, including any attachments hereto, may contain privileged
or confidential information and is sent solely for the attention and
use of the intended addressee(s). If you are not an intended addressee,
you may neither use this message nor copy or deliver it to anyone. In
such case, you should immediately destroy this message and kindly notify
the sender by reply email. Thank you.



