Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 22CBBE011AF
	for <meta-ti@yoctoproject.org>; Wed, 26 Sep 2012 05:54:24 -0700 (PDT)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 34A38F811E9; Wed, 26 Sep 2012 06:54:24 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 79212F811E3;
	Wed, 26 Sep 2012 06:54:22 -0600 (MDT)
Message-ID: <5062FB00.7080307@mlbassoc.com>
Date: Wed, 26 Sep 2012 06:54:24 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <5061B4F0.3080505@intel.com> <5062B681.20407@intel.com>
	<CA+2YH7vDWica3F3ORcNJti_3CALGeBNyXFqBZP-nhcDE5Ueokg@mail.gmail.com>
	<5062DC98.20106@intel.com> <5062DDB7.60308@mlbassoc.com>
	<5062F839.302@intel.com>
In-Reply-To: <5062F839.302@intel.com>
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
X-List-Received-Date: Wed, 26 Sep 2012 12:54:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-09-26 06:42, Radu Moisan wrote:
>
> On 09/26/2012 01:49 PM, Gary Thomas wrote:
>> On 2012-09-26 04:44, Radu Moisan wrote:
>>> Hi Enrico,
>>> I'm not sure what are you reffering to when you say bootloader env, but here's what I get on my console:
>>>
>>> U-Boot SPL 2011.12-dirty (Sep 24 2012 - 17:18:42)
>>> Texas Instruments OMAP4430 ES2.3
>>> Bypassing DPLL failed 4a008180
>>> OMAP SD/MMC: 0
>>> reading u-boot.img
>>> reading u-boot.img
>>>
>>>
>>> U-Boot 2011.12-dirty (Sep 24 2012 - 17:18:42)
>>>
>>> CPU  : OMAP4430 ES2.3
>>> Board: OMAP4 Panda
>>> I2C:   ready
>>> DRAM:  1 GiB
>>> MMC:   OMAP SD/MMC: 0
>>> Using default environment
>>>
>>> In:    serial
>>> Out:   serial
>>> Err:   serial
>>> Hit any key to stop autoboot:  0
>>> reading boot.scr
>>>
>>> ** Unable to read "boot.scr" from mmc 0:1 **
>>> reading uImage
>>>
>>> 4176612 bytes read
>>> Booting from mmc0 ...
>>> ## Booting kernel from Legacy Image at 82000000 ...
>>>     Image Name:   Linux-3.1.0
>>>     Image Type:   ARM Linux Kernel Image (uncompressed)
>>>     Data Size:    4176548 Bytes = 4 MiB
>>>     Load Address: 80008000
>>>     Entry Point:  80008000
>>>     Verifying Checksum ... OK
>>>     Loading Kernel Image ... OK
>>> OK
>>>
>>> Starting kernel ...
>>>
>>> Uncompressing Linux... done, booting the kernel.
>>>
>>> All I did to build it, was to add meta-ti to my bblayers.conf and try bitbake with MACHINE=pandaboard. The build was screaming about some QA errors, which I had to disable to get
>>> the build finish. I'm assuming those are the reason for my failure. However, I did not investigate further into these.
>>
>> Break into U-Boot during the boot process and show us what you get from
>> the 'printenv' command.  This will show the default value of 'bootargs'
>> which is what is being used since you don't have a 'boot.scr' script
>>
> Panda # printenv
> baudrate=115200
> bootcmd=if mmc rescan ${mmcdev}; then if run loadbootscript; then run bootscript; else if run loaduimage; then run mmcboot; fi; fi; fi
> bootdelay=3
> bootscript=echo Running bootscript from mmc${mmcdev} ...; source ${loadaddr}
> console=ttyO2,115200n8
> loadaddr=0x82000000
> loadbootscript=fatload mmc ${mmcdev} ${loadaddr} boot.scr
> loaduimage=fatload mmc ${mmcdev} ${loadaddr} uImage
> mmcargs=setenv bootargs console=${console} vram=${vram} root=${mmcroot} rootfstype=${mmcrootfstype}
> mmcboot=echo Booting from mmc${mmcdev} ...; run mmcargs; bootm ${loadaddr}
> mmcdev=0
> mmcroot=/dev/mmcblk0p2 ro
> mmcrootfstype=ext4 rootwait
> usbtty=cdc_acm
> vram=16M
>
> Environment size: 686/131068 bytes

This looks correct - the important bit is that console=ttyO2

Diagnosing why this doesn't come up may be a bit trickier.  One thing that you
can do is to look at the kernel messages (which are not being printed!).  Thankfully,
those are kept buffered in memory and you should be able to print them manually.

Give these steps a go:
   * Boot as you have been, letting it hang after starting the kernel
   * Press the RESET button on the PandaBoard
   * Break into U-Boot
   * Dump the kernel messages via:
       U-Boot> md LOG_BUF_ADDRESS
     This will display 256 bytes at LOG_BUF_ADDRESS.  If you just press return, you'll
     get to see the next 256 bytes, etc.  Keep doing this until the messages stop...

To find the LOG_BUF_ADDRESS, search for __log_buf in the System.map which was created
when you built your kernel.  This will be in your Yocto build tree .../tmp/work/pandaboard*/linux*/git
(I think - I don't have a build for this machine handy)  You'll see something like this:
    $ grep __log_buf tmp/work/panda*/linux*/git/System.map
    c06d66e9 b __log_buf
That's a virtual address which corresponds to 0x806d66e9 in physical RAM.  Truncate
the address to a longword value, i.e. 0x806d66e8 - that's LOG_BUF_ADDRESS

See what you get, it may provide a clue where the kernel is crashing.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

