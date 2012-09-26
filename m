Return-Path: <radu.moisan@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E63F5E0049F
	for <meta-ti@yoctoproject.org>; Wed, 26 Sep 2012 00:58:48 -0700 (PDT)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Sep 2012 00:58:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,489,1344236400"; 
	d="scan'208,217";a="226888130"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by fmsmga002.fm.intel.com with ESMTP; 26 Sep 2012 00:58:45 -0700
Message-ID: <5062B681.20407@intel.com>
Date: Wed, 26 Sep 2012 11:02:09 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <5061B4F0.3080505@intel.com>
In-Reply-To: <5061B4F0.3080505@intel.com>
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
X-List-Received-Date: Wed, 26 Sep 2012 07:58:49 -0000
Content-Type: multipart/alternative;
	boundary="------------080204050803000504010601"

--------------080204050803000504010601
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi guys,
Can anyone tell me if pandaboard is working with master branch of poky? 
I just don't want to waste my time figuring out what I've done wrong, if 
the build is not working anyway.

Thanks,
Radu

On 09/25/2012 04:43 PM, Radu Moisan wrote:
> Hi guys,
> I tried to start pandaboard with latest from master but it got stuck 
> booting the kernel.
> This is all I got, do you have any idea what am I missing?
>
>
> U-Boot SPL 2011.12-dirty (Sep 24 2012 - 17:18:42)
> Texas Instruments OMAP4430 ES2.3
> Bypassing DPLL failed 4a008180
> OMAP SD/MMC: 0
> reading u-boot.img
> reading u-boot.img
>
>
> U-Boot 2011.12-dirty (Sep 24 2012 - 17:18:42)
>
> CPU  : OMAP4430 ES2.3
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
> ** Unable to read "boot.scr" from mmc 0:1 **
> reading uImage
>
> 4176612 bytes read
> Booting from mmc0 ...
> ## Booting kernel from Legacy Image at 82000000 ...
>    Image Name:   Linux-3.1.0
>    Image Type:   ARM Linux Kernel Image (uncompressed)
>    Data Size:    4176548 Bytes = 4 MiB
>    Load Address: 80008000
>    Entry Point:  80008000
>    Verifying Checksum ... OK
>    Loading Kernel Image ... OK
> OK
>
> Starting kernel ...
>
> Uncompressing Linux... done, booting the kernel.
>
>
> Thanks,
> Radu
>
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


--------------080204050803000504010601
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi guys,<br>
    Can anyone tell me if pandaboard is working with master branch of
    poky? I just don't want to waste my time figuring out what I've done
    wrong, if the build is not working anyway.<br>
    <br>
    Thanks,<br>
    Radu<br>
    &nbsp;<br>
    <div class="moz-cite-prefix">On 09/25/2012 04:43 PM, Radu Moisan
      wrote:<br>
    </div>
    <blockquote cite="mid:5061B4F0.3080505@intel.com" type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      Hi guys,<br>
      I tried to start pandaboard with latest from master but it got
      stuck booting the kernel.<br>
      This is all I got, do you have any idea what am I missing?<br>
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

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
          Uncompressing Linux... done, booting the kernel.</small></font><br>
      <br>
      <br>
      Thanks,<br>
      Radu<br>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
meta-ti mailing list
<a class="moz-txt-link-abbreviated" href="mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a>
<a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.yoctoproject.org/listinfo/meta-ti</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------080204050803000504010601--
