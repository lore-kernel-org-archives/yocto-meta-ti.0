Return-Path: <pab@pabigot.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EF691E0074B; Mon,  1 Sep 2014 16:29:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [68.178.252.109 listed in list.dnswl.org]
X-Greylist: delayed 91 seconds by postgrey-1.32 at yocto-www;
	Mon, 01 Sep 2014 16:29:48 PDT
Received: from p3plsmtpa11-08.prod.phx3.secureserver.net
	(p3plsmtpa11-08.prod.phx3.secureserver.net [68.178.252.109])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40010E006B3
	for <meta-ti@yoctoproject.org>; Mon,  1 Sep 2014 16:29:48 -0700 (PDT)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa11-08.prod.phx3.secureserver.net with 
	id lzUF1o0021mTNtu01zUFvv; Mon, 01 Sep 2014 16:28:16 -0700
Message-ID: <5405010E.2070400@pabigot.com>
Date: Mon, 01 Sep 2014 18:28:14 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Diego Sueiro <diego.sueiro@gmail.com>
References: <5087658.bcI9hl3Jbj@localhost.localdomain>
	<5404E0A8.8030204@pabigot.com>
	<CAMCfZKEqU=Ric8131BA=nrToyAWxaEbHs0e-3EzKAz6CQUrtNA@mail.gmail.com>
In-Reply-To: <CAMCfZKEqU=Ric8131BA=nrToyAWxaEbHs0e-3EzKAz6CQUrtNA@mail.gmail.com>
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
X-List-Received-Date: Mon, 01 Sep 2014 23:29:50 -0000
Content-Type: multipart/alternative;
	boundary="------------020400080007030804050008"

--------------020400080007030804050008
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/01/2014 04:53 PM, Diego Sueiro wrote:
> Peter,
>
> On Mon, Sep 1, 2014 at 6:10 PM, Peter A. Bigot <pab@pabigot.com 
> <mailto:pab@pabigot.com>> wrote:
>
>     I am seeing the same behavior with an SD card with u-boot from
>     current meta-ti master
>     (MLO-beaglebone-2014.07-r1+gitrAUTOINC+8bd803d2c5)
>
>     I partition the cards and create the boot/root partitions with:
>
>     sudo dd if=/dev/zero of=${MMC} bs=1024 count=1024
>     ( echo ,9,0x0C,* ; echo ,,,- ) \
>       | sudo sfdisk -D -H 255 -S 63 ${MMC}
>
>     ${SUDO} mkfs.vfat -F 16 -n boot ${MMC}1
>     ${SUDO} mkfs -t ${FSTYPE} -L rootfs ${MMC}2
>
>     ${SUDO} cp -p MLO u-boot.img ${MPROOT}/boot
>
>     This process works with poky master and yocto-bsp on beaglebone.
>
>     I recall from long ago that some TI systems were picky about the
>     partitioning of the boot media.
>
>
> This is not true for recent Sitara SoCs:
> http://permalink.gmane.org/gmane.comp.handhelds.openembedded/64088
>
>     Would somebody with an SD card image that boots the current
>     meta-ti master provide the output of fdisk -lu from it, or a
>     pointer to instructions for doing the formatting?  For reference,
>     what doesn't work is:
>
>     llc[325]$ sudo fdisk -lu /dev/sdh
>
>     Disk /dev/sdh: 7892 MB, 7892631552 bytes
>     255 heads, 63 sectors/track, 959 cylinders, total 15415296 sectors
>     Units = sectors of 1 * 512 = 512 bytes
>     Sector size (logical/physical): 512 bytes / 512 bytes
>     I/O size (minimum/optimal): 512 bytes / 512 bytes
>     Disk identifier: 0x00000000
>
>
>        Device Boot      Start         End      Blocks  Id  System
>     /dev/sdh1   *          63      144584       72261    c W95 FAT32 (LBA)
>     /dev/sdh2          144585    15406334     7630875   83 Linux
>
>
> I'm using the following partition layout (both working on eMMC and 
> sdcard with u-boot_2014.07.bb <http://u-boot_2014.07.bb>):
>
>     # fdisk -lu /dev/mmcblk0
>
>     Disk /dev/mmcblk0: 1920 MB, 1920991232 bytes, 3751936 sectors
>     Units = sectors of 1 * 512 = 512 bytes
>     Sector size (logical/physical): 512 bytes / 512 bytes
>     I/O size (minimum/optimal): 512 bytes / 512 bytes
>     Disk label type: dos
>     Disk identifier: 0x00000000
>
>             Device Boot      Start     End      Blocks   Id  System
>     /dev/mmcblk0p1   *          63   80324       40131    c  W95 FAT32
>     (LBA)
>

Thanks.  That does appear to be an eMMC partition, which probably 
shouldn't matter, but I replicated the configuration on a 2GB class 4 
uSD card, and an 8GB class 6, and it doesn't work on either one.

llc[77]$ sudo fdisk -lu /dev/sdh

Disk /dev/sdh: 3965 MB, 3965190144 bytes
255 heads, 63 sectors/track, 482 cylinders, total 7744512 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00000000

    Device Boot      Start         End      Blocks   Id  System
/dev/sdh1   *          63       80324       40131    c  W95 FAT32 (LBA)
/dev/sdh2           80325     7743329     3831502+  83  Linux

Anybody got a uSD partition layout that works?  I'm suspecting an issue 
with the heads/sectors/cylinders configuration.

(FWIW: I'm also using u-boot-staging-ti, as that's the default for 
beaglebone on the master branch.)

Peter

--------------020400080007030804050008
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 09/01/2014 04:53 PM, Diego Sueiro
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAMCfZKEqU=Ric8131BA=nrToyAWxaEbHs0e-3EzKAz6CQUrtNA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">Peter,</div>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Mon, Sep 1, 2014 at 6:10 PM, Peter
            A. Bigot <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:pab@pabigot.com" target="_blank">pab@pabigot.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
              <div id=":2bw" class="" style="overflow:hidden">I am
                seeing the same behavior with an SD card with u-boot
                from current meta-ti master (MLO-beaglebone-2014.07-r1+gitrAUTOINC+8bd803d2c5)<br>
                <br>
                I partition the cards and create the boot/root
                partitions with:<br>
                <br>
                sudo dd if=/dev/zero of=${MMC} bs=1024 count=1024<br>
                ( echo ,9,0x0C,* ; echo ,,,- ) \<br>
                  | sudo sfdisk -D -H 255 -S 63 ${MMC}<br>
                <br>
                ${SUDO} mkfs.vfat -F 16 -n boot ${MMC}1<br>
                ${SUDO} mkfs -t ${FSTYPE} -L rootfs ${MMC}2<br>
                <br>
                ${SUDO} cp -p MLO u-boot.img ${MPROOT}/boot<br>
                <br>
                This process works with poky master and yocto-bsp on
                beaglebone.<br>
                <br>
                I recall from long ago that some TI systems were picky
                about the partitioning of the boot media.</div>
            </blockquote>
            <div><br>
            </div>
            <div>This is not true for recent Sitara SoCs:</div>
            <div><a moz-do-not-send="true"
href="http://permalink.gmane.org/gmane.comp.handhelds.openembedded/64088">http://permalink.gmane.org/gmane.comp.handhelds.openembedded/64088</a><br>
            </div>
            <div><br>
            </div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
              <div id=":2bw" class="" style="overflow:hidden">
                Would somebody with an SD card image that boots the
                current meta-ti master provide the output of fdisk -lu
                from it, or a pointer to instructions for doing the
                formatting?  For reference, what doesn't work is:<br>
                <br>
                llc[325]$ sudo fdisk -lu /dev/sdh<br>
                <br>
                Disk /dev/sdh: 7892 MB, 7892631552 bytes<br>
                255 <span class="">heads</span>, 63 <span class="">sectors</span>/track,
                959 cylinders, total 15415296 <span class="">sectors</span><br>
                Units = <span class="">sectors</span> of 1 * 512 = 512
                bytes<br>
                <span class="">Sector</span> size (logical/physical):
                512 bytes / 512 bytes<br>
                I/O size (minimum/optimal): 512 bytes / 512 bytes<br>
                Disk identifier: 0x00000000
                <div class=""><br>
                  <br>
                     Device Boot      Start         End      Blocks 
                   Id  System<br>
                </div>
                /dev/sdh1   *          63      144584       72261    c 
                W95 FAT32 (LBA)<br>
                /dev/sdh2          144585    15406334     7630875   83 
                Linux<br>
              </div>
            </blockquote>
          </div>
          <br>
          I'm using the following partition layout (both working on eMMC
          and sdcard with <a moz-do-not-send="true"
            href="http://u-boot_2014.07.bb">u-boot_2014.07.bb</a>):</div>
        <div class="gmail_extra"><br>
        </div>
        <blockquote style="margin:0px 0px 0px
          40px;border:none;padding:0px">
          <div class="gmail_extra">
            <div class="gmail_extra"># fdisk -lu /dev/mmcblk0</div>
          </div>
          <div class="gmail_extra">
            <div class="gmail_extra">
              <br>
            </div>
          </div>
          <div class="gmail_extra">
            <div class="gmail_extra">Disk /dev/mmcblk0: 1920 MB,
              1920991232 bytes, 3751936 sectors</div>
          </div>
          <div class="gmail_extra">
            <div class="gmail_extra">Units = sectors of 1 * 512 = 512
              bytes</div>
          </div>
          <div class="gmail_extra">
            <div class="gmail_extra">Sector size (logical/physical): 512
              bytes / 512 bytes</div>
          </div>
          <div class="gmail_extra">
            <div class="gmail_extra">I/O size (minimum/optimal): 512
              bytes / 512 bytes</div>
          </div>
          <div class="gmail_extra">
            <div class="gmail_extra">Disk label type: dos</div>
          </div>
          <div class="gmail_extra">
            <div class="gmail_extra">Disk identifier: 0x00000000</div>
          </div>
          <div class="gmail_extra">
            <div class="gmail_extra">
              <br>
            </div>
          </div>
          <div class="gmail_extra">
            <div class="gmail_extra">        Device Boot      Start    
                  End      Blocks   Id  System</div>
          </div>
          <div class="gmail_extra">
            <div class="gmail_extra">/dev/mmcblk0p1   *          63    
                80324       40131    c  W95 FAT32 (LBA)</div>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <br>
    Thanks.  That does appear to be an eMMC partition, which probably
    shouldn't matter, but I replicated the configuration on a 2GB class
    4 uSD card, and an 8GB class 6, and it doesn't work on either one.<br>
    <br>
    llc[77]$ sudo fdisk -lu /dev/sdh<br>
    <br>
    Disk /dev/sdh: 3965 MB, 3965190144 bytes<br>
    255 heads, 63 sectors/track, 482 cylinders, total 7744512 sectors<br>
    Units = sectors of 1 * 512 = 512 bytes<br>
    Sector size (logical/physical): 512 bytes / 512 bytes<br>
    I/O size (minimum/optimal): 512 bytes / 512 bytes<br>
    Disk identifier: 0x00000000<br>
    <br>
       Device Boot      Start         End      Blocks   Id  System<br>
    /dev/sdh1   *          63       80324       40131    c  W95 FAT32
    (LBA)<br>
    /dev/sdh2           80325     7743329     3831502+  83  Linux<br>
    <br>
    Anybody got a uSD partition layout that works?  I'm suspecting an
    issue with the heads/sectors/cylinders configuration.<br>
    <br>
    (FWIW: I'm also using u-boot-staging-ti, as that's the default for
    beaglebone on the master branch.)<br>
    <br>
    Peter<br>
  </body>
</html>

--------------020400080007030804050008--
