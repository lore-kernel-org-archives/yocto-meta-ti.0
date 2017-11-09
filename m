Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A59B8E009CB; Thu,  9 Nov 2017 08:37:44 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B0960E00928
	for <meta-ti@yoctoproject.org>; Thu,  9 Nov 2017 08:37:43 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vA9GbgBf008091;
	Thu, 9 Nov 2017 10:37:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1510245462;
	bh=xZ3hDQQ9Qg2FKiJoqWcjaDJRRcSUczHkrxNR6IPfFz0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=igMzvqp+EIRI7pYTUciO32zdJURPldw47pXxtraJviSdpcHzDAHtainV7o+Yf96vu
	l/9bcFrmxk9LpmTQcEhXIuebdM//+mzUyMqWwH2c9ITamf75WuEoI63Pwudx/UXm7b
	hjr0fz1xFSTovZ5ru334dTL2KOW63cYkrGoUARK4=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vA9GbgDD031729;
	Thu, 9 Nov 2017 10:37:42 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 9 Nov 2017 10:37:42 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 9 Nov 2017 10:37:42 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vA9GbghU021374;
	Thu, 9 Nov 2017 10:37:42 -0600
Date: Thu, 9 Nov 2017 11:37:26 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Katu Txakur <katutxakurra@gmail.com>
Message-ID: <20171109163726.GB24755@edge>
References: <CAM1ZcoW-XS3Eijj5fpBSD3fggroU5fd2j2HjpzGm=AUA1J-Fvw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAM1ZcoW-XS3Eijj5fpBSD3fggroU5fd2j2HjpzGm=AUA1J-Fvw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: u-boot-ti-staging am355x uEnv.txt support booting from eMMC
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
X-List-Received-Date: Thu, 09 Nov 2017 16:37:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

I was told uEnv.txt is only supported on SD/MMC.

You are welcome to discuss this question further on e2e.ti.com forums.

-- 
Denys


On Thu, Nov 02, 2017 at 02:07:51PM +0000, Katu Txakur wrote:
> Hi,
> 
> I'm using Yocto Pyro branch with meta-ti layer and beaglebone machine to
> build u-boot-ti-staging 2017.01+gitAUTOINC+5861b3bd34-r7 package.
> 
> I create an SD card with a FAT partition labelled BOOT containing
> MLO
> u-boot.img
> uEnv.txt
> and an ext4 partition labeled ROOT with the root file system.
> 
> When I boot a BeagleBone Black with this card, the file uEnv.txt it's read
> and used correctly.
> 
> When I follow the same logic to flash this image to the NAND flash of the
> BeagleBone Black, the uEnv.txt file in the first partition it's not read.
> Is there support for this in uEnv.txt?
> 
> This is the output of u-boot booting from eMMC:
> ###############################################
> U-Boot 2017.01 (Nov 02 2017 - 13:23:03 +0000)
> 
> CPU  : AM335X-GP rev 2.1
> I2C:   ready
> DRAM:  512 MiB
> MMC:   OMAP SD/MMC: 0, OMAP SD/MMC: 1
> *** Warning - bad CRC, using default environment
> 
> <ethaddr> not set. Validating first E-fuse MAC
> Net:   cpsw, usb_ether
> Press SPACE to abort autoboot in 2 seconds
> Card did not respond to voltage select!
> Card did not respond to voltage select!
> Card did not respond to voltage select!
> Card did not respond to voltage select!
> Card did not respond to voltage select!
> switch to partitions #0, OK
> mmc1(part 0) is current device
> Scanning mmc 1:1...
> switch to partitions #0, OK
> mmc1(part 0) is current device
> SD/MMC found on device 1
> 4179616 bytes read in 364 ms (11 MiB/s)
> 37806 bytes read in 24 ms (1.5 MiB/s)
> ## Flattened Device Tree blob at 88000000
>    Booting using the fdt blob at 0x88000000
>    Loading Device Tree to 8fff3000, end 8ffff3ad ... OK
> 
> Starting kernel ...
> ###############################################
> 
> 
> It doesn't seem to be looking for uEnv.txt.
> The output booting from SD card is:
> 
> ###############################################
> ...
> SD/MMC found on device 0
> reading boot.scr
> ** Unable to read file boot.scr **
> reading uEnv.txt
> 969 bytes read in 7 ms (134.8 KiB/s)
> Loaded env from uEnv.txt
> Importing environment from mmc0 ...
> Running uenvcmd ...
> 37784 bytes read in 61 ms (604.5 KiB/s)
> ...
> ###############################################
> 
> I've read a bit of the u-boot code and the "Scanning mmc" string in u-boot
> output brings me to the file
> include/config_distro_bootcmd.h
> where there is no mention of uEnv.txt or the CONFIG_EXTRA_ENV_SETTINGS
> defined in include/configs/am335x_evm.h that seem to give support for the
> uEnv.txt file when the SD card is used.
> 
> Is this a known issue or am I doing something wrong?
> 
> Regards,
> Katu

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


