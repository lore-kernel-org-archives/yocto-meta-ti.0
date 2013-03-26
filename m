Return-Path: <grunzasr@comcast.net>
Received: from qmta05.westchester.pa.mail.comcast.net
	(qmta05.westchester.pa.mail.comcast.net [76.96.62.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3E4E1E0131E
	for <meta-ti@yoctoproject.org>; Tue, 26 Mar 2013 12:12:04 -0700 (PDT)
Received: from omta04.westchester.pa.mail.comcast.net ([76.96.62.35])
	by qmta05.westchester.pa.mail.comcast.net with comcast
	id GBM91l00J0ldTLk55KC3dm; Tue, 26 Mar 2013 19:12:03 +0000
Received: from [127.0.0.1] ([71.225.124.244])
	by omta04.westchester.pa.mail.comcast.net with comcast
	id GKC21l00d5GVvnK3QKC2eK; Tue, 26 Mar 2013 19:12:03 +0000
Message-ID: <5151F315.3040900@comcast.net>
Date: Tue, 26 Mar 2013 15:12:21 -0400
From: Steven Grunza <grunzasr@comcast.net>
User-Agent: Mozilla/5.0 (Windows NT 5.1;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <20130319172138.GQ32759@edge> <5148A9B4.5060702@comcast.net>
	<20130319182747.GH14761@denix.org> <5149C666.7040306@comcast.net>
	<20130320151759.GP14761@denix.org>
	<5149F665.9090204@comcast.net> <20130320175415.GW32759@edge>
	<5149FD74.3030906@comcast.net> <20130320182722.GX32759@edge>
	<alpine.DEB.2.02.1303201441410.28378@oneiric>
	<20130320185747.GY32759@edge>
	<alpine.DEB.2.02.1303201558250.18081@oneiric>
In-Reply-To: <alpine.DEB.2.02.1303201558250.18081@oneiric>
X-Antivirus: avast! (VPS 130326-0, 03/26/2013), Outbound message
X-Antivirus-Status: Clean
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20121106; t=1364325123;
	bh=DmdjF1mLQ2+hLMxngIWoFvP0RQxIyHTMSvqUmaRpy7M=;
	h=Received:Received:Message-ID:Date:From:Reply-To:MIME-Version:To:
	Subject:Content-Type;
	b=BTM10cKKWnj5jga9pNH4AnOwTBhPVJhWIZSBnBhC/aA3nR4Ii4ece6PQq7PFmafZj
	6M+zju6WMVcgZhRMP1zDGQJlGqGj4gNHOkNet2XTwISAgBe4Jllu/jCf/ywIfr9gfO
	2sqBgcbg9LIeYZPJiVQMVrs+Hl/LkbwZmz9V+bWgTYCWrFqr3P16m8CqljGY7Eppz1
	IhuMapU6uChBWbYlUPc9ydad6fDH3OPE7wWC3gwTANmG/7VdJLD9mBvbmut4QtK0VB
	RUpkYHP8L0S2lIh7lvuHg0qKy+oYfnh3kZVvBD9O56usS1ckmcqC707RknX/aq98uf
	YqBC9qDEWiXTg==
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Is this the correct list for AM3517 EVM questions?
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: grunzasr@comcast.net
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 19:12:04 -0000
Content-Type: multipart/alternative;
	boundary="------------040906090101010308000508"

--------------040906090101010308000508
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 3/20/2013 3:58 PM, Robert P. J. Day wrote:
> On Wed, 20 Mar 2013, Denys Dmytriyenko wrote:
>
>> On Wed, Mar 20, 2013 at 02:45:17PM -0400, Robert P. J. Day wrote:
>>> On Wed, 20 Mar 2013, Denys Dmytriyenko wrote:
>>>
>>> ... snip ...
>>>
>>>> If you are using poky-danny as a base, you need to use "danny"
>>>> branch of meta-ti to match the versions.
>>>    i ordered that very AM3517 exp kit this morning and, while it's
>>> in transit, i'm building a core-image-minimal for it. should i expect
>>> success if i use the absolute latest "git pull"s of everything?
>>>
>>>    i'm aware of the recipe masking issue and the mesa-dri version thing
>>> so i won't trip over that. so far, the "fetchall" worked and i'm
>>> currently on "running tasks (191 of 1591)" of the build itself.
>>>
>>>    is there any reason to think this shouldn't finish? thanks.
>> http://article.gmane.org/gmane.linux.embedded.yocto.meta-ti/1661
>
So the build finished and I loaded the files onto my SD card.  MLO, 
u-boot.img, and uImage onto the first partition.  I untarred the root 
file system onto the second partition.  This is the result on the serial 
console:

40X?H?????SPL 2011.12-dirty (Mar 21 2013 - 19:36:59)
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
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Die ID #1b7e0000000000000155daa60200c00f
Hit any key to stop autoboot:  0
reading boot.scr

** Unable to read "boot.scr" from mmc 0:1 **
reading uImage

3160284 bytes read
Booting from mmc ...
## Booting kernel from Legacy Image at 82000000 ...
    Image Name:   Linux-2.6.37
    Image Type:   ARM Linux Kernel Image (uncompressed)
    Data Size:    3160220 Bytes = 3 MiB
    Load Address: 80008000
    Entry Point:  80008000
    Verifying Checksum ... OK
    Loading Kernel Image ... OK
OK

Starting kernel ...


Did I miss a step?

--------------040906090101010308000508
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 3/20/2013 3:58 PM, Robert P. J. Day
      wrote:<br>
    </div>
    <blockquote cite="mid:alpine.DEB.2.02.1303201558250.18081@oneiric"
      type="cite">
      <pre wrap="">On Wed, 20 Mar 2013, Denys Dmytriyenko wrote:

</pre>
      <blockquote type="cite">
        <pre wrap="">On Wed, Mar 20, 2013 at 02:45:17PM -0400, Robert P. J. Day wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">On Wed, 20 Mar 2013, Denys Dmytriyenko wrote:

... snip ...

</pre>
          <blockquote type="cite">
            <pre wrap="">If you are using poky-danny as a base, you need to use "danny"
branch of meta-ti to match the versions.
</pre>
          </blockquote>
          <pre wrap="">
  i ordered that very AM3517 exp kit this morning and, while it's
in transit, i'm building a core-image-minimal for it. should i expect
success if i use the absolute latest "git pull"s of everything?

  i'm aware of the recipe masking issue and the mesa-dri version thing
so i won't trip over that. so far, the "fetchall" worked and i'm
currently on "running tasks (191 of 1591)" of the build itself.

  is there any reason to think this shouldn't finish? thanks.
</pre>
        </blockquote>
        <pre wrap="">
<a class="moz-txt-link-freetext" href="http://article.gmane.org/gmane.linux.embedded.yocto.meta-ti/1661">http://article.gmane.org/gmane.linux.embedded.yocto.meta-ti/1661</a>
</pre>
      </blockquote>
      <br>
    </blockquote>
    So the build finished and I loaded the files onto my SD card.&nbsp; MLO,
    u-boot.img, and uImage onto the first partition.&nbsp; I untarred the
    root file system onto the second partition.&nbsp; This is the result on
    the serial console:<br>
    <br>
    <font face="Courier New, Courier, monospace">40X&#65533;H&#65533;&#65533;&#65533;&#65533;&#1089;SPL
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
      I2C:&nbsp;&nbsp; ready<br>
      DRAM:&nbsp; 256 MiB<br>
      NAND:&nbsp; 512 MiB<br>
      MMC:&nbsp;&nbsp; OMAP SD/MMC: 0<br>
      *** Warning - bad CRC, using default environment<br>
      <br>
      In:&nbsp;&nbsp;&nbsp; serial<br>
      Out:&nbsp;&nbsp; serial<br>
      Err:&nbsp;&nbsp; serial<br>
      Die ID #1b7e0000000000000155daa60200c00f<br>
      Hit any key to stop autoboot:&nbsp; 0 <br>
      reading boot.scr<br>
      <br>
      ** Unable to read "boot.scr" from mmc 0:1 **<br>
      reading uImage<br>
      <br>
      3160284 bytes read<br>
      Booting from mmc ...<br>
      ## Booting kernel from Legacy Image at 82000000 ...<br>
      &nbsp;&nbsp; Image Name:&nbsp;&nbsp; Linux-2.6.37<br>
      &nbsp;&nbsp; Image Type:&nbsp;&nbsp; ARM Linux Kernel Image (uncompressed)<br>
      &nbsp;&nbsp; Data Size:&nbsp;&nbsp;&nbsp; 3160220 Bytes = 3 MiB<br>
      &nbsp;&nbsp; Load Address: 80008000<br>
      &nbsp;&nbsp; Entry Point:&nbsp; 80008000<br>
      &nbsp;&nbsp; Verifying Checksum ... OK<br>
      &nbsp;&nbsp; Loading Kernel Image ... OK<br>
      OK<br>
      <br>
      Starting kernel ...<br>
      <br>
      <br>
    </font>Did I miss a step?<br>
  </body>
</html>

--------------040906090101010308000508--
