Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2A5ACE00718
	for <meta-ti@yoctoproject.org>; Sat,  5 Oct 2013 11:05:15 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r95I5Egu032194;
	Sat, 5 Oct 2013 13:05:14 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r95I5ESU012032;
	Sat, 5 Oct 2013 13:05:14 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Sat, 5 Oct 2013 13:05:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r95I5DVe024448;
	Sat, 5 Oct 2013 13:05:13 -0500
Date: Sat, 5 Oct 2013 14:05:13 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Rudolf Streif <rstreif@linuxfoundation.org>
Message-ID: <20131005180512.GA6227@edge>
References: <CA+gsK-r2ve9es_X1OAOp5jd5w-zWzqWUBNxH0AhkvW55uGwM2A@mail.gmail.com>
	<20131004053354.GB2673@edge>
	<CA+gsK-o6a6SbQnq9T2derscYRJ+8gS=4COTkeeP+TRjbFDkT9g@mail.gmail.com>
	<20131004182321.GA3672@edge>
	<CA+gsK-ofzwiKXqVCQ-=_kcvZJu+aaWqa07-DgVYTh91VB70OvQ@mail.gmail.com>
	<20131004215047.GD3672@edge>
	<CA+gsK-rqwXrV1WjWx0pttqpxMkkM29cBwYMHvEaXdDDVcuW0tw@mail.gmail.com>
	<CA+gsK-o7xrHme-VAZvXooFEBid=hcc25dmwhc+2GcreJ0D=xVg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+gsK-o7xrHme-VAZvXooFEBid=hcc25dmwhc+2GcreJ0D=xVg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Buidling for am335x_evm
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
X-List-Received-Date: Sat, 05 Oct 2013 18:05:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sat, Oct 05, 2013 at 09:46:29AM -0700, Rudolf Streif wrote:
> Hi Denys,
> 
> I guess I have to follow up on this. Everything builds now and with
> core-image-base the kernel image is installed into /boot. The fdt is not
> however.

If you are finally getting the kernel image into /boot directory, but not the 
device trees, then you probably are not using the latest enough snapshot of 
meta-ti...


> I used the Beaglebone in this case because it's a known board to
> me and I have been able to boot it successfully with my own Beaglebone BSP
> many time.
> 
> This is what I did on a preformatted SD card with partition 0 with FAT and
> partition 1 with ext4 with the images built using the meta-ti layer:
> 
>    1. sudo cp MLO-beaglebone /run/media/rudi/BEAGBOOT/MLO
>    2. sudo cp u-boot-beaglebone.img /run/media/rudi/BEAGBOOT/u-boot.img
>    3. sudo tar x -C /run/media/rudi/beagroot1/ -f
>    core-image-base-beaglebone.tar.gz
>    4. sudo tar x -C /run/media/rudi/beagroot1/ -f
>    modules--3.11+3.12-rc3-r19a+gitrAUTOINC+f7579525de9f1d6086c407a6980f4f1c1c574256-beaglebone-20131005020051.tgz
>    5. cp uImage-am335x-bone.dtb
>    /run/media/rudi/beagroot1/boot/am335x-bone.dtb
> 
> For step 5 one of course has to know that the u-boot environment expects an
> fdt with the name am335x-bone.dtb in /boot.
> 
> The u-boot bootcmd is set to
> 
> bootcmd=run findfdt; run mmcboot;setenv mmcdev 1; setenv bootpart 1:2; run
> mmcboot;run nandboot;
> 
> findfdt finds and sets the fdtfile variable correctly to am335x-bone.dtb.
> 
> mmcboot eventually runs mmcloados which is set to:
> 
> mmcloados=run mmcargs; if test ${boot_fdt} = yes || test ${boot_fdt} = try;
> then if run loadfdt; then bootm ${loadaddr} - ${fdtaddr}; else if test
> ${boot_fdt} = try; then bootm; else echo WARN: Cannot load the DT; fi; fi;
> else bootm; fi;
> 
> That's the default. It loads the fdt correctly but it never loads the
> kernel image. There is no command that executes loaduimage which is set to:
> 
> loaduimage=load mmc ${bootpart} ${loadaddr} ${bootdir}/${bootfile}
> 
> 
> Now, I executed all these steps manually and loaded the fdt and the kernel
> image, etc and eventually ran bootm. u-boots loads and decompresses the
> kernel and then it stops at "Starting kernel..." Probably a device tree
> issue.
> 
> 
> There are two issues:
> 
>    1. u-boot environment does not load the kernel image. I can get around
>    that.
>    2. Device tree does not seem to match the kernel image but that's only a
>    guess at this point.
> 
> Thanks,
> Rudi

