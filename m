Return-Path: <russell@personaltelco.net>
Received: from mail.tdb.com (mail.tdb.com [216.99.214.4])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id EB788E0044A
	for <meta-ti@yoctoproject.org>; Thu,  5 Apr 2012 13:43:46 -0700 (PDT)
Received: (qmail 31412 invoked from network); 5 Apr 2012 13:43:46 -0700
Received: from unknown (HELO coulee.tdb.com) (216.99.214.7)
	by mail.tdb.com with SMTP; 5 Apr 2012 13:43:46 -0700
Received: (qmail 30787 invoked by uid 1001); 5 Apr 2012 20:43:46 -0000
To: Denys Dmytriyenko <denis@denix.org>
References: <86pqbmm4oe.fsf@coulee.tdb.com> <20120405191501.GB5144@denix.org>
From: Russell Senior <russell@personaltelco.net>
Date: Thu, 05 Apr 2012 13:43:46 -0700
In-Reply-To: <20120405191501.GB5144@denix.org> (Denys Dmytriyenko's message of
	"Thu\, 05 Apr 2012 15\:15\:01 -0400")
Message-ID: <86bon5nc3h.fsf@coulee.tdb.com>
User-Agent: Gnus/5.101 (Gnus v5.10.10) Emacs/21.4 (gnu/linux)
MIME-Version: 1.0
Cc: meta-ti@yoctoproject.org
Subject: Re: building meta-ti + poky HOWTO?
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
X-List-Received-Date: Thu, 05 Apr 2012 20:43:47 -0000
Content-Type: text/plain; charset=us-ascii

>>>>> "Denys" == Denys Dmytriyenko <denis@denix.org> writes:

Russell> I have been unable to get a booting image out of Angstrom in
Russell> about three weeks of trying and several unanswered queries to
Russell> the mailing list and elsewhere.  In my continuing effort to
Russell> get a build system that produces an image that boots on my
Russell> beaglebone, I'd like to try building meta-ti with poky, just
Russell> to see if that fails for me too.

Denys> As far as I remember, you are having problems with rootfs
Denys> images that generate an entire SD card disk image with multiple
Denys> partitions, e.g. Cloud9 image.  There are known issues with the
Denys> tools used to do that, like sometimes fdisk not making the
Denys> correct MBR and partition table that BootROM can boot from. So
Denys> far it seems to depend on the host distro and their tools. This
Denys> area still needs further investigation and probably the use of
Denys> different tools...

I am building on a Debian/unstable box with a core i7 cpu and 24 gig of RAM.

Denys> But you should not be stuck on this - why don't you use the
Denys> individual pieces, like kernel image, rootfs and load them on
Denys> SD card yourself, manually? Try working around the issue...

I have tried taking the pre-baked Angstrom image from here:

  http://www.angstrom-distribution.org/demo/beaglebone/Angstrom-Cloud9-IDE-eglibc-ipk-v2012.02-core-beaglebone-2012.02.14.img.xz

(which works for me), and replacing the uImage on the vfat partition
by copying over the existing one with one I built.  That boots, but the
rootfs isn't aligned (different kernel/module versions?).  

If I then try dropping in my rootfs, by reformatting the ext4fs and
untarring the rootfs tarball I built, I get 0.6 seconds into the boot
and then the boot stalls with some udevd messages, like so:

  U-Boot SPL 2011.09-00010-g81c8c79 (Feb 13 2012 - 14:48:03)
  Texas Instruments Revision detection unimplemented
  No AC power, disabling frequency switch
  OMAP SD/MMC: 0
  reading u-boot.img
  reading u-boot.img


  U-Boot 2011.09-00010-g81c8c79 (Feb 13 2012 - 14:48:03)

  I2C:   ready
  DRAM:  256 MiB
  No daughter card present
  NAND:  HW ECC Hamming Code selected
  nand_get_flash_type: unknown NAND device: Manufacturer ID: 0x10, Chip ID: 0x10
  No NAND device found!!!
  0 MiB
  MMC:   OMAP SD/MMC: 0
  *** Warning - readenv() failed, using default environment

  Net:   cpsw
  Hit any key to stop autoboot:  0 
  SD/MMC found on device 0
  reading uEnv.txt

  33 bytes read
  Loaded environment from uEnv.txt
  Importing environment from mmc ...
  reading uImage

  3140320 bytes read
  ## Booting kernel from Legacy Image at 80007fc0 ...
     Image Name:   Angstrom/3.2/beaglebone
     Image Type:   ARM Linux Kernel Image (uncompressed)
     Data Size:    3140256 Bytes = 3 MiB
     Load Address: 80008000
     Entry Point:  80008000
     Verifying Checksum ... OK
     XIP Kernel Image ... OK
  OK

  Starting kernel ...

  Uncompressing Linux... done, booting the kernel.
  [    0.120087] cpuidle-am33xx cpuidle-am33xx.0: failed to register driver
  [    0.251953] _omap_mux_get_by_name: Could not find signal leds-gpio
  [    0.635798] omap2_set_init_voltage: unable to get clk dpll1_ck
  [    0.642040] omap2_set_init_voltage: unable to set vdd_mpu_iva
  [    0.648112] omap2_set_init_voltage: unable to get clk l3_ick
  [    0.654099] omap2_set_init_voltage: unable to set vdd_core
  udevd[56]: worker [79] did not accept message -1 (Connection refused), kill it
  ^M
  udevd[56]: worker [80] did not accept message -1 (Connection refused), kill it
  ^M
  udevd[56]: worker [81] did not accept message -1 (Connection refused), kill it
  ^M
  udevd[56]: worker [85] did not accept message -1 (Connection refused), kill it
  ^M
  udevd[56]: worker [86] did not accept message -1 (Connection refused), kill it
  ^M
  udevd[56]: worker [87] did not accept message -1 (Connection refused), kill it
  ^M

I don't know what that means, nor where to go from there.


-- 
Russell Senior, President
russell@personaltelco.net

