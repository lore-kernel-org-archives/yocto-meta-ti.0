Return-Path: <radu.moisan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46674E0049D
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2012 01:04:58 -0700 (PDT)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Sep 2012 01:04:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,494,1344236400"; d="scan'208";a="198448431"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by orsmga001.jf.intel.com with ESMTP; 27 Sep 2012 01:04:56 -0700
Message-ID: <50640976.9070402@intel.com>
Date: Thu, 27 Sep 2012 11:08:22 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Christian.Schulenberg@bmw.de
References: <5061B4F0.3080505@intel.com> <5062B681.20407@intel.com>
	<CA+2YH7vDWica3F3ORcNJti_3CALGeBNyXFqBZP-nhcDE5Ueokg@mail.gmail.com>
	<5062DC98.20106@intel.com> <5062DDB7.60308@mlbassoc.com>
	<5062F839.302@intel.com> <5062FB00.7080307@mlbassoc.com>
	<506307F1.6030303@intel.com>
	<EF446FF9DAC93B479C74AB9153DE173F111237C8@SMUCM08V.europe.bmw.corp>
In-Reply-To: <EF446FF9DAC93B479C74AB9153DE173F111237C8@SMUCM08V.europe.bmw.corp>
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Thu, 27 Sep 2012 08:04:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Same led story on my side as well.

Radu

On 09/27/2012 10:25 AM, Christian.Schulenberg@bmw.de wrote:
> Hi,
>
> I would like to jump into this discussion, as I'm facing exact the same problem. I try to build the meta-ivi System. Therefore, I have setup my system with the following layers:
>
> - meta-ivi
> - meta-systemd
> - poky
> - meta-ti
>
> bblayers.conf looks like this:
>
> # LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
> # changes incompatibly
> LCONF_VERSION = "5"
>
> BBPATH = "${TOPDIR}"
> BBFILES ?= ""
>
> BBLAYERS ?= " \
>    /home/csb/yocto-excalibur/yocto-ivi/meta-ti \
>    /home/csb/yocto-excalibur/yocto-ivi/poky/meta \
>    /home/csb /yocto-excalibur/yocto-ivi/poky/meta-yocto \
>    /home/csb /yocto-excalibur/yocto-ivi/meta-ivi \
>    /home/csb /yocto-excalibur/yocto-ivi/meta-systemd \
>    "
>
> The meta-ti misc subdir is excluded from build via BBMASK = "meta-ti/recipes-misc" in local.conf. MACHINE is set to pandabaord -> MACHINE ??= "pandaboard"
>
> The build process went through without any suspicious warnings. But in the end, I stuck with the same problem as Radu, except the fact, that I'm using a boot.scr. Here is my console output:
>
> U-Boot SPL 2011.12-dirty (Sep 27 2012 - 07:42:14)
> Texas Instruments OMAP4460 ES1.1
> OMAP SD/MMC: 0
> reading u-boot.img
> reading u-boot.img
>
>
> U-Boot 2011.12-dirty (Sep 27 2012 - 07:42:14)
>
> CPU  : OMAP4460 ES1.1
> Board: OMAP4 Panda
> I2C:   ready
> DRAM:  1 GiB
> MMC:   OMAP SD/MMC: 0
> Using default environment
>
> In:    serial
> Out:   serial
> Err:   serial
> Hit any key to stop autoboot:  0
> reading boot.scr
>
> 390 bytes read
> Running bootscript from mmc0 ...
> ## Executing script at 82000000
> reading uImage
>
> 4176496 bytes read
> ## Booting kernel from Legacy Image at 80000000 ...
>     Image Name:   Linux-3.1.0
>     Image Type:   ARM Linux Kernel Image (uncompressed)
>     Data Size:    4176432 Bytes = 4 MiB
>     Load Address: 80008000
>     Entry Point:  80008000
>     Verifying Checksum ... OK
>     Loading Kernel Image ... OK
> OK
>
> Starting kernel ...
>
> Uncompressing Linux... done, booting the kernel.
>
> At the end, both LED's on Pandaboard (D1 and D2) are switched on. Pressing reset does not help, only LED D1 is switched off.
>
> I used the meta.ivi layer in combination with meta-ti before in a much older version, which worked fine for me, but at the moment I have no idea what's wrong with my configuration.
>
>
> Best regards,
> Christian
>
> -----Ursprüngliche Nachricht-----
> Von: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject.org] Im Auftrag von Radu Moisan
> Gesendet: Mittwoch, 26. September 2012 15:50
> An: meta-ti@yoctoproject.org
> Betreff: Re: [meta-ti] pandaboard not booting
>
>
>> This looks correct - the important bit is that console=ttyO2
>>
>> Diagnosing why this doesn't come up may be a bit trickier.  One thing
>> that you
>> can do is to look at the kernel messages (which are not being
>> printed!).  Thankfully,
>> those are kept buffered in memory and you should be able to print them
>> manually.
>>
>> Give these steps a go:
>>    * Boot as you have been, letting it hang after starting the kernel
>>    * Press the RESET button on the PandaBoard
>>    * Break into U-Boot
>>    * Dump the kernel messages via:
>>        U-Boot> md LOG_BUF_ADDRESS
>>      This will display 256 bytes at LOG_BUF_ADDRESS.  If you just press
>> return, you'll
>>      get to see the next 256 bytes, etc.  Keep doing this until the
>> messages stop...
>>
>> To find the LOG_BUF_ADDRESS, search for __log_buf in the System.map
>> which was created
>> when you built your kernel.  This will be in your Yocto build tree
>> .../tmp/work/pandaboard*/linux*/git
>> (I think - I don't have a build for this machine handy)  You'll see
>> something like this:
>>     $ grep __log_buf tmp/work/panda*/linux*/git/System.map
>>     c06d66e9 b __log_buf
>> That's a virtual address which corresponds to 0x806d66e9 in physical
>> RAM.  Truncate
>> the address to a longword value, i.e. 0x806d66e8 - that's LOG_BUF_ADDRESS
>>
>> See what you get, it may provide a clue where the kernel is crashing.
>>
> Everything went ok, except the board doesn't reset when I press the
> reset button, or at least I can't see that in the serial console, it
> stays stuck at line "booting kernel..."
>
> Radu
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


