Return-Path: <robertcnelson@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ADDDAE013EC
	for <meta-ti@yoctoproject.org>; Mon,  8 Jul 2013 10:58:59 -0700 (PDT)
Received: by mail-ie0-f177.google.com with SMTP id aq17so10128335iec.8
	for <meta-ti@yoctoproject.org>; Mon, 08 Jul 2013 10:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=YjPAzxayrn7VWl1iGLVLZWxHoHM+v9qSsGgZCwN6HiA=;
	b=GynyoXU7kZqBMogUnr9DcjwdWmspjZHg60F+lrPQb7tgxEO2uYCF93sIMdGx5wX2w3
	MbmFz7xSIoIRhESKu3aw4Fu/XmQRF4EOrqi8fmDHgCuXRzSv+/he85UruiOZhH4cfEOp
	Tksv6I5AqVQZCUbXGWo2bE4XzT/F4TjPAuCKuevR4+vX2rOtHt886s2vjKJFR6tGcOIg
	Savix/pfZta6yvMso92q3Z4wxvuUQOPnjqizAfduQd5RtySj0UR+Fn/by9Kp2fRSoxwt
	j6OExNSVRhy1pa3x7TJShdQHt5YD8N/1OReIGe21GGxXhCN0PmzEXMfxCyaQGCQLSCZJ
	ATJg==
MIME-Version: 1.0
X-Received: by 10.50.128.36 with SMTP id nl4mr9038166igb.38.1373306338673;
	Mon, 08 Jul 2013 10:58:58 -0700 (PDT)
Received: by 10.64.252.8 with HTTP; Mon, 8 Jul 2013 10:58:58 -0700 (PDT)
In-Reply-To: <CAGX3a9_Ykh8bUQEb3KVFah+rpHck=2V8bsjVS2yyy3_RAWhamA@mail.gmail.com>
References: <CAGX3a9_Ykh8bUQEb3KVFah+rpHck=2V8bsjVS2yyy3_RAWhamA@mail.gmail.com>
Date: Mon, 8 Jul 2013 12:58:58 -0500
Message-ID: <CAOCHtYgPdfsXQnmCMT0t1hETrtocmV=AEpXdH_gd6ukw-70_sg@mail.gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
To: Sudhangathan B S <sudhangathan@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: booting 2.6.32 kernel and rootfs
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
X-List-Received-Date: Mon, 08 Jul 2013 17:58:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 5, 2013 at 11:16 PM, Sudhangathan B S
<sudhangathan@gmail.com> wrote:
> On my way to integrate Leopard imaging camera drivers into the beagle board
> image, I successfully built a minimal image with necessary camera drivers in
> the image, this is all after I integrated meta-ti layer with yocto.
> I finally put the files in the card and powered up the beagle board.
>
> This is what i'm getting..
>
> U-Boot SPL 2011.09-01172-gfdbe8b9-dirty (Jul 05 2013 - 20:38:26)
> Texas Instruments Revision detection unimplemented
> OMAP SD/MMC: 0
> reading u-boot.img
> reading u-boot.img
>
>
> U-Boot 2011.09-01172-gfdbe8b9-dirty (Jul 05 2013 - 20:38:26)
>
> OMAP36XX/37XX-GP ES1.2, CPU-OPP2, L3-165MHz, Max CPU Clock 1 Ghz
> OMAP3 Beagle board + LPDDR/NAND
> I2C:   ready
> DRAM:  512 MiB
> WARNING: Caches not enabled
> NAND:  0 MiB
> MMC:   OMAP SD/MMC: 0
> *** Warning - readenv() failed, using default environment
>
> In:    serial
> Out:   serial
> Err:   serial
> Beagle xM Rev C
> No EEPROM on expansion board
> No EEPROM on expansion board
> Die ID #689000029ff80000016842c81202f014
> Net:   Net Initialization Skipped
> No ethernet found.
> Hit any key to stop autoboot:  0
> The user button is currently NOT pressed.
> SD/MMC found on device 0
> reading uEnv.txt
>
> ** Unable to read "uEnv.txt" from mmc 0:1 **
> Loading file "/boot/uImage" from mmc device 0:2 (xxa2)
> 3148568 bytes read
> Booting from mmc ...
> ## Booting kernel from Legacy Image at 80200000 ...
>    Image Name:   Linux-2.6.32
>    Image Type:   ARM Linux Kernel Image (uncompressed)
>    Data Size:    3148504 Bytes = 3 MiB
>    Load Address: 80008000
>    Entry Point:  80008000
>    Verifying Checksum ... OK
>    Loading Kernel Image ... OK
> OK
>
> Starting kernel ...
>
> Uncompressing
> Linux............................................................................................................................................................................................................
> done, booting the kernel.
>
> AND NOTHING AFTER THIS... Any clue how to proceed..?

Back in the 2.6.32 days, the "omap" serial driver did not exist.. So
if your still setting up console as /dev/ttyO2 change it to
/dev/ttyS2..

Regards,

-- 
Robert Nelson
http://www.rcn-ee.com/

