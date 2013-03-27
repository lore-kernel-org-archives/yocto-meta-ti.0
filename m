Return-Path: <grunzasr@comcast.net>
Received: from qmta13.westchester.pa.mail.comcast.net
	(qmta13.westchester.pa.mail.comcast.net [76.96.59.243])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E845CE01474
	for <meta-ti@yoctoproject.org>; Tue, 26 Mar 2013 20:07:16 -0700 (PDT)
Received: from omta16.westchester.pa.mail.comcast.net ([76.96.62.88])
	by qmta13.westchester.pa.mail.comcast.net with comcast
	id GCnz1l0071uE5Es5DT7FjA; Wed, 27 Mar 2013 03:07:15 +0000
Received: from [127.0.0.1] ([71.225.124.244])
	by omta16.westchester.pa.mail.comcast.net with comcast
	id GT7F1l0095GVvnK3cT7FAX; Wed, 27 Mar 2013 03:07:15 +0000
Message-ID: <5152628F.2020107@comcast.net>
Date: Tue, 26 Mar 2013 23:07:59 -0400
From: Steven Grunza <grunzasr@comcast.net>
User-Agent: Mozilla/5.0 (Windows NT 5.1;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
CC: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
References: <20130319172138.GQ32759@edge> <5148A9B4.5060702@comcast.net>
	<20130319182747.GH14761@denix.org> <5149C666.7040306@comcast.net>
	<20130320151759.GP14761@denix.org>
	<5149F665.9090204@comcast.net> <20130320175415.GW32759@edge>
	<5149FD74.3030906@comcast.net> <20130320182722.GX32759@edge>
	<alpine.DEB.2.02.1303201441410.28378@oneiric>
	<20130320185747.GY32759@edge>
	<alpine.DEB.2.02.1303201558250.18081@oneiric>
	<5151F315.3040900@comcast.net>
	<alpine.DEB.2.02.1303261715150.3036@oneiric>
In-Reply-To: <alpine.DEB.2.02.1303261715150.3036@oneiric>
X-Antivirus: avast! (VPS 130326-0, 03/26/2013), Outbound message
X-Antivirus-Status: Clean
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20121106; t=1364353635;
	bh=qpRvYGt/BSzmo0X4KPD2kZjZl2lj10InTjRPW+3Z6+g=;
	h=Received:Received:Message-ID:Date:From:Reply-To:MIME-Version:
	Subject:Content-Type;
	b=Pfx/CNgzU3sK2ksZIrOWBa983UovIwqgpYKj9dDDEeiyCLzBVrc0ut3BbeBXmi3Aw
	sh23RwqscaT1dqEsgJH/uZgt4YWOf22uN9PrlRDCZBj5GsuanjRZbgHvkyC5JDyD76
	t6Fhl2OWzoDMJnDwX5Wn3Q5T3Vqotr5Mv1/ewrvEqLM2fteoeS4PSEr8G92P9GkeLI
	kvOhXH2TYaDe2wszTCD/SlFuY4I2yT1qWqEaXuT5ZVXOe7scgrTWBKRUwfSxz5XMwU
	+FACELVTdDDMyXLEBIps9eGq3FDpSBB6AMYByL1emLHEooEs4GkmrYezO9xcD1GxNl
	EBu6CKnEU/O5A==
Subject: Re: Is this the correct list for AM3517 EVM questions?
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Mar 2013 03:07:17 -0000
Content-Type: multipart/alternative;
	boundary="------------030505020705020102080407"

--------------030505020705020102080407
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 8bit

On 3/26/2013 5:18 PM, Robert P. J. Day wrote:
> On Tue, 26 Mar 2013, Steven Grunza wrote:
>
> ... snip ...
>
>> So the build finished and I loaded the files onto my SD card.  MLO,
>> u-boot.img, and uImage onto the first partition.  I untarred the
>> root file system onto the second partition.  This is the result on
>> the serial console:
>>
>> 40X???H????????????ÓSPL 2011.12-dirty (Mar 21 2013 - 19:36:59)
>> Texas Instruments Revision detection unimplemented
>> OMAP SD/MMC: 0
>> reading u-boot.img
>> reading u-boot.img
>>
>>
>> U-Boot 2011.12-dirty (Mar 21 2013 - 19:36:59)
>>
>> AM35XX-GP ES1.0, CPU-OPP2, L3-165MHz, Max CPU Clock 600 Mhz
>> AM3517EVM Board + LPDDR/NAND
>> I2C:   ready
>> DRAM:  256 MiB
>> NAND:  512 MiB
>> MMC:   OMAP SD/MMC: 0
>> *** Warning - bad CRC, using default environment
>>
>> In:    serial
>> Out:   serial
>> Err:   serial
>> Die ID #1b7e0000000000000155daa60200c00f
>> Hit any key to stop autoboot:  0
>> reading boot.scr
>>
>> ** Unable to read "boot.scr" from mmc 0:1 **
>> reading uImage
>>
>> 3160284 bytes read
>> Booting from mmc ...
>> ## Booting kernel from Legacy Image at 82000000 ...
>>     Image Name:   Linux-2.6.37
>>     Image Type:   ARM Linux Kernel Image (uncompressed)
>>     Data Size:    3160220 Bytes = 3 MiB
>>     Load Address: 80008000
>>     Entry Point:  80008000
>>     Verifying Checksum ... OK
>>     Loading Kernel Image ... OK
>> OK
>>
>> Starting kernel ...
>>
>> Did I miss a step?
>    that was going to be my long weekend project ... are you saying it
> just hung at that point?
>
> rday
>
Yes.  Just hung. Here's a little more info on my system.  I changed the 
loadaddr environment variable to match the reported load address from 
u-boot reading the uImage file.  Saving the new value fixed the "*** 
Warning - bad CRC, using default environment" message.


40X?@C?UI??ÓSPL 2011.12-dirty (Mar 21 2013 - 19:36:59)
Texas Instruments Revision detection unimplemented
OMAP SD/MMC: 0
reading u-boot.img
reading u-boot.img


U-Boot 2011.12-dirty (Mar 21 2013 - 19:36:59)

AM35XX-GP ES1.0, CPU-OPP2, L3-165MHz, Max CPU Clock 600 Mhz
AM3517EVM Board + LPDDR/NAND
I2C:   ready
DRAM:  256 MiB
NAND:  512 MiB
MMC:   OMAP SD/MMC: 0
In:    serial
Out:   serial
Err:   serial
Die ID #1b7e0000000000000155daa60200c00f
Hit any key to stop autoboot:  0
AM3517_EVM # printenv
baudrate=115200
bootcmd=if mmc rescan ${mmcdev}; then if run loadbootscript; then run 
bootscript; else
if run loaduimage; then run mmcboot; else run nandboot; fi; fi; else run 
nandboot; fi
bootdelay=10
bootfile=uImage
bootscript=echo Running bootscript from mmc ...; source ${loadaddr}
console=ttyO2,115200n8
dieid#=1b7e0000000000000155daa60200c00f
loadaddr=80008000
loadbootscript=fatload mmc ${mmcdev} ${loadaddr} boot.scr
loaduimage=fatload mmc ${mmcdev} ${loadaddr} uImage
mmcargs=setenv bootargs console=${console} root=/dev/mmcblk0p2 rw 
rootfstype=ext3 rootw
ait
mmcboot=echo Booting from mmc ...; run mmcargs; bootm ${loadaddr}
mmcdev=0
nandargs=setenv bootargs console=${console} root=/dev/mtdblock4 rw 
rootfstype=jffs2
nandboot=echo Booting from nand ...; run nandargs; nand read ${loadaddr} 
280000 400000;
  bootm ${loadaddr}
stderr=serial
stdin=serial
stdout=serial

Environment size: 911/131068 bytes
AM3517_EVM #




--------------030505020705020102080407
Content-Type: text/html; charset=KOI8-R
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=KOI8-R" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 3/26/2013 5:18 PM, Robert P. J. Day
      wrote:<br>
    </div>
    <blockquote cite="mid:alpine.DEB.2.02.1303261715150.3036@oneiric"
      type="cite">
      <pre wrap="">On Tue, 26 Mar 2013, Steven Grunza wrote:

... snip ...

</pre>
      <blockquote type="cite">
        <pre wrap="">So the build finished and I loaded the files onto my SD card.š MLO,
u-boot.img, and uImage onto the first partition.š I untarred the
root file system onto the second partition.š This is the result on
the serial console:

40X???H????????????ÓSPL 2011.12-dirty (Mar 21 2013 - 19:36:59)
Texas Instruments Revision detection unimplemented
OMAP SD/MMC: 0
reading u-boot.img
reading u-boot.img


U-Boot 2011.12-dirty (Mar 21 2013 - 19:36:59)

AM35XX-GP ES1.0, CPU-OPP2, L3-165MHz, Max CPU Clock 600 Mhz
AM3517EVM Board + LPDDR/NAND
I2C:šš ready
DRAM:š 256 MiB
NAND:š 512 MiB
MMC:šš OMAP SD/MMC: 0
*** Warning - bad CRC, using default environment

In:ššš serial
Out:šš serial
Err:šš serial
Die ID #1b7e0000000000000155daa60200c00f
Hit any key to stop autoboot:š 0
reading boot.scr

** Unable to read "boot.scr" from mmc 0:1 **
reading uImage

3160284 bytes read
Booting from mmc ...
## Booting kernel from Legacy Image at 82000000 ...
šš Image Name:šš Linux-2.6.37
šš Image Type:šš ARM Linux Kernel Image (uncompressed)
šš Data Size:ššš 3160220 Bytes = 3 MiB
šš Load Address: 80008000
šš Entry Point:š 80008000
šš Verifying Checksum ... OK
šš Loading Kernel Image ... OK
OK

Starting kernel ...

Did I miss a step?
</pre>
      </blockquote>
      <pre wrap="">
  that was going to be my long weekend project ... are you saying it
just hung at that point?

rday

</pre>
    </blockquote>
    Yes.š Just hung. Here's a little more info on my system.š I changed
    the loadaddr environment variable to match the reported load address
    from u-boot reading the uImage file.š Saving the new value fixed the
    "*** Warning - bad CRC, using default environment" message.<br>
    <br>
    <br>
    <small><font face="Courier New, Courier, monospace">40X&#65533;@C&#65533;UI&#65533;&#65533;ÓSPL
        2011.12-dirty (Mar 21 2013 - 19:36:59)<br>
        Texas Instruments Revision detection unimplemented<br>
        OMAP SD/MMC: 0<br>
        reading u-boot.img<br>
        reading u-boot.img<br>
        <br>
        <br>
        U-Boot 2011.12-dirty (Mar 21 2013 - 19:36:59)<br>
        <br>
        AM35XX-GP ES1.0, CPU-OPP2, L3-165MHz, Max CPU Clock 600 Mhz<br>
        AM3517EVM Board + LPDDR/NAND<br>
        I2C:šš ready<br>
        DRAM:š 256 MiB<br>
        NAND:š 512 MiB<br>
        MMC:šš OMAP SD/MMC: 0<br>
        In:ššš serial<br>
        Out:šš serial<br>
        Err:šš serial<br>
        Die ID #1b7e0000000000000155daa60200c00f<br>
        Hit any key to stop autoboot:š 0 <br>
        AM3517_EVM # printenv<br>
        baudrate=115200<br>
        bootcmd=if mmc rescan ${mmcdev}; then if run loadbootscript;
        then run bootscript; else <br>
        if run loaduimage; then run mmcboot; else run nandboot; fi; fi;
        else run nandboot; fi<br>
        bootdelay=10<br>
        bootfile=uImage<br>
        bootscript=echo Running bootscript from mmc ...; source
        ${loadaddr}<br>
        console=ttyO2,115200n8<br>
        dieid#=1b7e0000000000000155daa60200c00f<br>
        loadaddr=80008000<br>
        loadbootscript=fatload mmc ${mmcdev} ${loadaddr} boot.scr<br>
        loaduimage=fatload mmc ${mmcdev} ${loadaddr} uImage<br>
        mmcargs=setenv bootargs console=${console} root=/dev/mmcblk0p2
        rw rootfstype=ext3 rootw<br>
        ait<br>
        mmcboot=echo Booting from mmc ...; run mmcargs; bootm
        ${loadaddr}<br>
        mmcdev=0<br>
        nandargs=setenv bootargs console=${console} root=/dev/mtdblock4
        rw rootfstype=jffs2<br>
        nandboot=echo Booting from nand ...; run nandargs; nand read
        ${loadaddr} 280000 400000;<br>
        šbootm ${loadaddr}<br>
        stderr=serial<br>
        stdin=serial<br>
        stdout=serial<br>
        <br>
        Environment size: 911/131068 bytes<br>
        AM3517_EVM # <br>
      </font></small><br>
    <br>
    <br>
  </body>
</html>

--------------030505020705020102080407--
