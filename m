Return-Path: <radu.moisan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2566E011AF
	for <meta-ti@yoctoproject.org>; Wed, 26 Sep 2012 03:41:22 -0700 (PDT)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 26 Sep 2012 03:41:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,490,1344236400"; 
	d="scan'208,217";a="149265000"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Sep 2012 03:41:15 -0700
Message-ID: <5062DC98.20106@intel.com>
Date: Wed, 26 Sep 2012 13:44:40 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Enrico <ebutera@users.berlios.de>
References: <5061B4F0.3080505@intel.com> <5062B681.20407@intel.com>
	<CA+2YH7vDWica3F3ORcNJti_3CALGeBNyXFqBZP-nhcDE5Ueokg@mail.gmail.com>
In-Reply-To: <CA+2YH7vDWica3F3ORcNJti_3CALGeBNyXFqBZP-nhcDE5Ueokg@mail.gmail.com>
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
X-List-Received-Date: Wed, 26 Sep 2012 10:41:22 -0000
Content-Type: multipart/alternative;
	boundary="------------050406070604090501010404"

--------------050406070604090501010404
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Enrico,
I'm not sure what are you reffering to when you say bootloader env, but 
here's what I get on my console:

U-Boot SPL 2011.12-dirty (Sep 24 2012 - 17:18:42)
Texas Instruments OMAP4430 ES2.3
Bypassing DPLL failed 4a008180
OMAP SD/MMC: 0
reading u-boot.img
reading u-boot.img


U-Boot 2011.12-dirty (Sep 24 2012 - 17:18:42)

CPU  : OMAP4430 ES2.3
Board: OMAP4 Panda
I2C:   ready
DRAM:  1 GiB
MMC:   OMAP SD/MMC: 0
Using default environment

In:    serial
Out:   serial
Err:   serial
Hit any key to stop autoboot:  0
reading boot.scr

** Unable to read "boot.scr" from mmc 0:1 **
reading uImage

4176612 bytes read
Booting from mmc0 ...
## Booting kernel from Legacy Image at 82000000 ...
    Image Name:   Linux-3.1.0
    Image Type:   ARM Linux Kernel Image (uncompressed)
    Data Size:    4176548 Bytes = 4 MiB
    Load Address: 80008000
    Entry Point:  80008000
    Verifying Checksum ... OK
    Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.

All I did to build it, was to add meta-ti to my bblayers.conf and try 
bitbake with MACHINE=pandaboard. The build was screaming about some QA 
errors, which I had to disable to get the build finish. I'm assuming 
those are the reason for my failure. However, I did not investigate 
further into these.

Thanks,
Radu

On 09/26/2012 12:20 PM, Enrico wrote:
> On Wed, Sep 26, 2012 at 10:02 AM, Radu Moisan <radu.moisan@intel.com> wrote:
>> Hi guys,
>> Can anyone tell me if pandaboard is working with master branch of poky? I
>> just don't want to waste my time figuring out what I've done wrong, if the
>> build is not working anyway.
> It's a long time since i tried it but it was working, can you post
> your bootloader env? Maybe you are just missing the console=ttyO2...
> part.
>
> Enrico


--------------050406070604090501010404
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi Enrico,<br>
    I'm not sure what are you reffering to when you say bootloader env,
    but here's what I get on my console:<br>
    <br>
    <font face="Ubuntu Mono"><small>U-Boot SPL 2011.12-dirty (Sep 24
        2012 -
        17:18:42)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br>
        Texas Instruments OMAP4430
        ES2.3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <br>
        Bypassing DPLL failed 4a008180<br>
        OMAP SD/MMC: 0<br>
        reading u-boot.img<br>
        reading u-boot.img<br>
        <br>
        <br>
        U-Boot 2011.12-dirty (Sep 24 2012 - 17:18:42)<br>
        <br>
        CPU&nbsp; : OMAP4430 ES2.3<br>
        Board: OMAP4 Panda<br>
        I2C:&nbsp;&nbsp; ready<br>
        DRAM:&nbsp; 1 GiB<br>
        MMC:&nbsp;&nbsp; OMAP SD/MMC: 0<br>
        Using default environment<br>
        <br>
        In:&nbsp;&nbsp;&nbsp; serial<br>
        Out:&nbsp;&nbsp; serial<br>
        Err:&nbsp;&nbsp; serial<br>
        Hit any key to stop autoboot:&nbsp; 0 <br>
        reading boot.scr<br>
        <br>
        ** Unable to read "boot.scr" from mmc 0:1 **<br>
        reading uImage<br>
        <br>
        4176612 bytes read<br>
        Booting from mmc0 ...<br>
        ## Booting kernel from Legacy Image at 82000000 ...<br>
        &nbsp;&nbsp; Image Name:&nbsp;&nbsp; Linux-3.1.0<br>
        &nbsp;&nbsp; Image Type:&nbsp;&nbsp; ARM Linux Kernel Image (uncompressed)<br>
        &nbsp;&nbsp; Data Size:&nbsp;&nbsp;&nbsp; 4176548 Bytes = 4 MiB<br>
        &nbsp;&nbsp; Load Address: 80008000<br>
        &nbsp;&nbsp; Entry Point:&nbsp; 80008000<br>
        &nbsp;&nbsp; Verifying Checksum ... OK<br>
        &nbsp;&nbsp; Loading Kernel Image ... OK<br>
        OK<br>
        <br>
        Starting kernel ...<br>
        <br>
        Uncompressing Linux... done, booting the kernel.<br>
        <br>
      </small></font>
    <div class="moz-cite-prefix">All I did to build it, was to add
      meta-ti to my bblayers.conf and try bitbake with
      MACHINE=pandaboard. The build was screaming about some QA errors,
      which I had to disable to get the build finish. I'm assuming those
      are the reason for my failure. However, I did not investigate
      further into these.<br>
      <br>
      Thanks,<br>
      Radu<br>
      <br>
      On 09/26/2012 12:20 PM, Enrico wrote:<br>
    </div>
    <blockquote
cite="mid:CA+2YH7vDWica3F3ORcNJti_3CALGeBNyXFqBZP-nhcDE5Ueokg@mail.gmail.com"
      type="cite">
      <pre wrap="">On Wed, Sep 26, 2012 at 10:02 AM, Radu Moisan <a class="moz-txt-link-rfc2396E" href="mailto:radu.moisan@intel.com">&lt;radu.moisan@intel.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Hi guys,
Can anyone tell me if pandaboard is working with master branch of poky? I
just don't want to waste my time figuring out what I've done wrong, if the
build is not working anyway.
</pre>
      </blockquote>
      <pre wrap="">
It's a long time since i tried it but it was working, can you post
your bootloader env? Maybe you are just missing the console=ttyO2...
part.

Enrico
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------050406070604090501010404--
