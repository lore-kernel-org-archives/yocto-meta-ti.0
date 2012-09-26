Return-Path: <radu.moisan@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3B3CE011AF
	for <meta-ti@yoctoproject.org>; Wed, 26 Sep 2012 05:39:17 -0700 (PDT)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Sep 2012 05:39:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,490,1344236400"; 
	d="scan'208,217";a="213545217"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by orsmga002.jf.intel.com with ESMTP; 26 Sep 2012 05:39:08 -0700
Message-ID: <5062F839.302@intel.com>
Date: Wed, 26 Sep 2012 15:42:33 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <5061B4F0.3080505@intel.com> <5062B681.20407@intel.com>
	<CA+2YH7vDWica3F3ORcNJti_3CALGeBNyXFqBZP-nhcDE5Ueokg@mail.gmail.com>
	<5062DC98.20106@intel.com> <5062DDB7.60308@mlbassoc.com>
In-Reply-To: <5062DDB7.60308@mlbassoc.com>
Subject: Re: pandaboard not booting
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
X-List-Received-Date: Wed, 26 Sep 2012 12:39:17 -0000
Content-Type: multipart/alternative;
	boundary="------------000506000003010508070704"

--------------000506000003010508070704
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 09/26/2012 01:49 PM, Gary Thomas wrote:
> On 2012-09-26 04:44, Radu Moisan wrote:
>> Hi Enrico,
>> I'm not sure what are you reffering to when you say bootloader env, 
>> but here's what I get on my console:
>>
>> U-Boot SPL 2011.12-dirty (Sep 24 2012 - 17:18:42)
>> Texas Instruments OMAP4430 ES2.3
>> Bypassing DPLL failed 4a008180
>> OMAP SD/MMC: 0
>> reading u-boot.img
>> reading u-boot.img
>>
>>
>> U-Boot 2011.12-dirty (Sep 24 2012 - 17:18:42)
>>
>> CPU  : OMAP4430 ES2.3
>> Board: OMAP4 Panda
>> I2C:   ready
>> DRAM:  1 GiB
>> MMC:   OMAP SD/MMC: 0
>> Using default environment
>>
>> In:    serial
>> Out:   serial
>> Err:   serial
>> Hit any key to stop autoboot:  0
>> reading boot.scr
>>
>> ** Unable to read "boot.scr" from mmc 0:1 **
>> reading uImage
>>
>> 4176612 bytes read
>> Booting from mmc0 ...
>> ## Booting kernel from Legacy Image at 82000000 ...
>>     Image Name:   Linux-3.1.0
>>     Image Type:   ARM Linux Kernel Image (uncompressed)
>>     Data Size:    4176548 Bytes = 4 MiB
>>     Load Address: 80008000
>>     Entry Point:  80008000
>>     Verifying Checksum ... OK
>>     Loading Kernel Image ... OK
>> OK
>>
>> Starting kernel ...
>>
>> Uncompressing Linux... done, booting the kernel.
>>
>> All I did to build it, was to add meta-ti to my bblayers.conf and try 
>> bitbake with MACHINE=pandaboard. The build was screaming about some 
>> QA errors, which I had to disable to get
>> the build finish. I'm assuming those are the reason for my failure. 
>> However, I did not investigate further into these.
>
> Break into U-Boot during the boot process and show us what you get from
> the 'printenv' command.  This will show the default value of 'bootargs'
> which is what is being used since you don't have a 'boot.scr' script
>
Panda # printenv
baudrate=115200
bootcmd=if mmc rescan ${mmcdev}; then if run loadbootscript; then run 
bootscript; else if run loaduimage; then run mmcboot; fi; fi; fi
bootdelay=3
bootscript=echo Running bootscript from mmc${mmcdev} ...; source ${loadaddr}
console=ttyO2,115200n8
loadaddr=0x82000000
loadbootscript=fatload mmc ${mmcdev} ${loadaddr} boot.scr
loaduimage=fatload mmc ${mmcdev} ${loadaddr} uImage
mmcargs=setenv bootargs console=${console} vram=${vram} root=${mmcroot} 
rootfstype=${mmcrootfstype}
mmcboot=echo Booting from mmc${mmcdev} ...; run mmcargs; bootm ${loadaddr}
mmcdev=0
mmcroot=/dev/mmcblk0p2 ro
mmcrootfstype=ext4 rootwait
usbtty=cdc_acm
vram=16M

Environment size: 686/131068 bytes

Thanks,
Radu


--------------000506000003010508070704
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <div class="moz-cite-prefix">On 09/26/2012 01:49 PM, Gary Thomas
      wrote:<br>
    </div>
    <blockquote cite="mid:5062DDB7.60308@mlbassoc.com" type="cite">On
      2012-09-26 04:44, Radu Moisan wrote:
      <br>
      <blockquote type="cite">Hi Enrico,
        <br>
        I'm not sure what are you reffering to when you say bootloader
        env, but here's what I get on my console:
        <br>
        <br>
        U-Boot SPL 2011.12-dirty (Sep 24 2012 - 17:18:42)
        <br>
        Texas Instruments OMAP4430 ES2.3
        <br>
        Bypassing DPLL failed 4a008180
        <br>
        OMAP SD/MMC: 0
        <br>
        reading u-boot.img
        <br>
        reading u-boot.img
        <br>
        <br>
        <br>
        U-Boot 2011.12-dirty (Sep 24 2012 - 17:18:42)
        <br>
        <br>
        CPU&nbsp; : OMAP4430 ES2.3
        <br>
        Board: OMAP4 Panda
        <br>
        I2C:&nbsp;&nbsp; ready
        <br>
        DRAM:&nbsp; 1 GiB
        <br>
        MMC:&nbsp;&nbsp; OMAP SD/MMC: 0
        <br>
        Using default environment
        <br>
        <br>
        In:&nbsp;&nbsp;&nbsp; serial
        <br>
        Out:&nbsp;&nbsp; serial
        <br>
        Err:&nbsp;&nbsp; serial
        <br>
        Hit any key to stop autoboot:&nbsp; 0
        <br>
        reading boot.scr
        <br>
        <br>
        ** Unable to read "boot.scr" from mmc 0:1 **
        <br>
        reading uImage
        <br>
        <br>
        4176612 bytes read
        <br>
        Booting from mmc0 ...
        <br>
        ## Booting kernel from Legacy Image at 82000000 ...
        <br>
        &nbsp;&nbsp;&nbsp; Image Name:&nbsp;&nbsp; Linux-3.1.0
        <br>
        &nbsp;&nbsp;&nbsp; Image Type:&nbsp;&nbsp; ARM Linux Kernel Image (uncompressed)
        <br>
        &nbsp;&nbsp;&nbsp; Data Size:&nbsp;&nbsp;&nbsp; 4176548 Bytes = 4 MiB
        <br>
        &nbsp;&nbsp;&nbsp; Load Address: 80008000
        <br>
        &nbsp;&nbsp;&nbsp; Entry Point:&nbsp; 80008000
        <br>
        &nbsp;&nbsp;&nbsp; Verifying Checksum ... OK
        <br>
        &nbsp;&nbsp;&nbsp; Loading Kernel Image ... OK
        <br>
        OK
        <br>
        <br>
        Starting kernel ...
        <br>
        <br>
        Uncompressing Linux... done, booting the kernel.
        <br>
        <br>
        All I did to build it, was to add meta-ti to my bblayers.conf
        and try bitbake with MACHINE=pandaboard. The build was screaming
        about some QA errors, which I had to disable to get
        <br>
        the build finish. I'm assuming those are the reason for my
        failure. However, I did not investigate further into these.
        <br>
      </blockquote>
      <br>
      Break into U-Boot during the boot process and show us what you get
      from
      <br>
      the 'printenv' command.&nbsp; This will show the default value of
      'bootargs'
      <br>
      which is what is being used since you don't have a 'boot.scr'
      script
      <br>
      <br>
    </blockquote>
    <font face="Ubuntu Mono">Panda # printenv<br>
      baudrate=115200<br>
      bootcmd=if mmc rescan ${mmcdev}; then if run loadbootscript; then
      run bootscript; else if run loaduimage; then run mmcboot; fi; fi;
      fi<br>
      bootdelay=3<br>
      bootscript=echo Running bootscript from mmc${mmcdev} ...; source
      ${loadaddr}<br>
      console=ttyO2,115200n8<br>
      loadaddr=0x82000000<br>
      loadbootscript=fatload mmc ${mmcdev} ${loadaddr} boot.scr<br>
      loaduimage=fatload mmc ${mmcdev} ${loadaddr} uImage<br>
      mmcargs=setenv bootargs console=${console} vram=${vram}
      root=${mmcroot} rootfstype=${mmcrootfstype}<br>
      mmcboot=echo Booting from mmc${mmcdev} ...; run mmcargs; bootm
      ${loadaddr}<br>
      mmcdev=0<br>
      mmcroot=/dev/mmcblk0p2 ro<br>
      mmcrootfstype=ext4 rootwait<br>
      usbtty=cdc_acm<br>
      vram=16M<br>
      <br>
      Environment size: 686/131068 bytes</font><br>
    <br>
    Thanks,<br>
    Radu<br>
    <br>
  </body>
</html>

--------------000506000003010508070704--
