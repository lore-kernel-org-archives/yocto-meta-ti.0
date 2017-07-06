Return-Path: <antonius.riko@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02BB9E00B28; Wed,  5 Jul 2017 22:26:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (antonius.riko[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.83.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.83.68 listed in dnsbl.sorbs.net]
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C8E02E00ACF
	for <meta-ti@yoctoproject.org>; Wed,  5 Jul 2017 22:26:03 -0700 (PDT)
Received: by mail-pg0-f68.google.com with SMTP id d193so1397511pgc.2
	for <meta-ti@yoctoproject.org>; Wed, 05 Jul 2017 22:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=ZDP91/4Fu18QkiU0bdq/WukDOItWkknFfzG+fMa17p8=;
	b=a0AI40LjyzLV9vAhrXNFpvpWZ2+IdpqkbvJLp4l8agY/XzvY495P1/JnGF3vlK6gvh
	ngdeW7YMm4tZ+kJyA5ZZMgog6fHLvvQZpSXSRmWBU4U/MQ8U/Z3UIwoieOOQs4oAEpx9
	N+cNCcQkqM+biaStVFFu7xp3w1SJVCrKcE3mfhrxkRLRp6rDY5ks7nnWGDhxVF8v5bof
	fYuJgVe1ovsvxiQDYf8+eXd8dfarizJHIH3MZDv7lBAuqSnJxU5bz3OvizT0fzNEgkTx
	Biawm6CnuOApgXuv8vhxQU5lR3jn/niCckyIw2I1wP1/mbJUHu/34A+NDIvJFfA7R+vE
	/7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=ZDP91/4Fu18QkiU0bdq/WukDOItWkknFfzG+fMa17p8=;
	b=E+3oQORQzkOJFtURsYj91w7I1meVIfR2sowndj2zXsp/WMYBKdSP/pOfvj2jlo37qk
	qASpx7ii++ZLlTmhWqU48Pq4ZQotLcBHdH32ubDqlXL879RjtrSvBZnIEeMlU4iBycSg
	ZQVrapRrS1+hkngilrHaH1/gIi1qR5Zc4+Ed3oFihWxREfWXRQJy1DPvBf1X3kMNyNYy
	YpDQ9FJWXYUoG95hQTS4SDTC3fowjlp2G4I3l6QSOcXF0SZzsK247SfnF6qIdLhqlkzz
	TVJdMf0jsy1ty+vUruy2sy9CQ4/aHHKHvVziEdHytnRKrVax5UcTK4rYk8ngmKOAWc4o
	2NVQ==
X-Gm-Message-State: AIVw110m1a1CG4JXGbtgQkInxIZ2pduuy9SIhWShIxxzKxh00g4VATHg
	FtXWnx3wrsMgSA==
X-Received: by 10.99.132.198 with SMTP id k189mr24930399pgd.233.1499318763054; 
	Wed, 05 Jul 2017 22:26:03 -0700 (PDT)
Received: from ?IPv6:2001:8003:804a:b500:4cfe:6c48:891b:52e0?
	([2001:8003:804a:b500:4cfe:6c48:891b:52e0])
	by smtp.gmail.com with ESMTPSA id
	124sm1292068pgi.62.2017.07.05.22.26.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jul 2017 22:26:02 -0700 (PDT)
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
References: <bc6ae1fe-32e2-5afe-8d26-0e9b3676cc2b@gmail.com>
	<CAOCHtYhAihOvX3TRijFyc6ArMtBW23boDrEezVLOW6ECcCqaXg@mail.gmail.com>
	<CAByQQ_r5oVJio+Ze8xE2w8QhLGH0g8QupKaWMRh7FseVgaB7tg@mail.gmail.com>
	<CAOCHtYi1Ce-5=_fTuL2s+pC16VSbnYX6TR6QJD5gq_bpFn7kPQ@mail.gmail.com>
From: Riko Ho <antonius.riko@gmail.com>
Message-ID: <c4c9ebc8-9737-c5d2-c46b-da3b47f3270b@gmail.com>
Date: Thu, 6 Jul 2017 13:25:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAOCHtYi1Ce-5=_fTuL2s+pC16VSbnYX6TR6QJD5gq_bpFn7kPQ@mail.gmail.com>
Subject: Re: boot/dtbs/4.4.54-ti-r93/am335x-boneblack.dtb
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
X-List-Received-Date: Thu, 06 Jul 2017 05:26:08 -0000
Content-Type: multipart/alternative;
	boundary="------------0EB087ACA1AA670D1E941CE4"
Content-Language: en-US

--------------0EB087ACA1AA670D1E941CE4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Meta TI Yocto Team Member/ Robert,

Ok, thanks for the fixes.
For that fix, only add into spidev.c, and use linux-yocto kernel, 
without using ti kernel ?

Here's what I got :

====

SPI0 Bug :
spidev spi1.0: buggy DT: spidev listed directly in DT
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at 
/home/bianchi77/poky/build/tmp/work-shared/beaglebone/kernel-source/drivers/spi/spidev.c:758 
spidev_probe+0x74/0x1c8
Modules linked in:
CPU: 0 PID: 1 Comm: swapper Not tainted 4.10.9-yocto-standard #4
Hardware name: Generic AM33XX (Flattened Device Tree)
[<c010f250>] (unwind_backtrace) from [<c010c0cc>] (show_stack+0x20/0x24)
[<c010c0cc>] (show_stack) from [<c04a450c>] (dump_stack+0x20/0x28)
[<c04a450c>] (dump_stack) from [<c012d734>] (__warn+0xec/0x108)
[<c012d734>] (__warn) from [<c012d820>] (warn_slowpath_null+0x30/0x38)
[<c012d820>] (warn_slowpath_null) from [<c0620e94>] 
(spidev_probe+0x74/0x1c8)
[<c0620e94>] (spidev_probe) from [<c061d1e0>] (spi_drv_probe+0x98/0xb0)
[<c061d1e0>] (spi_drv_probe) from [<c05ab304>] 
(driver_probe_device+0x1fc/0x2c4)
[<c05ab304>] (driver_probe_device) from [<c05ab574>] 
(__device_attach_driver+0xa4/0xbc)
[<c05ab574>] (__device_attach_driver) from [<c05a9688>] 
(bus_for_each_drv+0x98/0xa0)
[<c05a9688>] (bus_for_each_drv) from [<c05ab050>] 
(__device_attach+0xac/0x114)
[<c05ab050>] (__device_attach) from [<c05ab5a8>] 
(device_initial_probe+0x1c/0x20)
[<c05ab5a8>] (device_initial_probe) from [<c05aa5dc>] 
(bus_probe_device+0x38/0x90)
[<c05aa5dc>] (bus_probe_device) from [<c05a8814>] (device_add+0x42c/0x510)
[<c05a8814>] (device_add) from [<c061e3d0>] (spi_add_device+0xf4/0x158)
[<c061e3d0>] (spi_add_device) from [<c061e85c>] 
(of_register_spi_device+0x2a0/0x304)
[<c061e85c>] (of_register_spi_device) from [<c061eea4>] 
(spi_register_master+0x3fc/0x4ac)
[<c061eea4>] (spi_register_master) from [<c061ef98>] 
(devm_spi_register_master+0x44/0x78)
[<c061ef98>] (devm_spi_register_master) from [<c0628068>] 
(omap2_mcspi_probe+0x26c/0x368)
[<c0628068>] (omap2_mcspi_probe) from [<c05ad1e4>] 
(platform_drv_probe+0x60/0xac)
[<c05ad1e4>] (platform_drv_probe) from [<c05ab304>] 
(driver_probe_device+0x1fc/0x2c4)
[<c05ab304>] (driver_probe_device) from [<c05ab458>] 
(__driver_attach+0x8c/0xb8)
[<c05ab458>] (__driver_attach) from [<c05a95b4>] 
(bus_for_each_dev+0x90/0xa0)
[<c05a95b4>] (bus_for_each_dev) from [<c05aacd8>] (driver_attach+0x28/0x30)
[<c05aacd8>] (driver_attach) from [<c05aa8b0>] (bus_add_driver+0x184/0x1f4)
[<c05aa8b0>] (bus_add_driver) from [<c05ac0a8>] (driver_register+0xb0/0xf0)
[<c05ac0a8>] (driver_register) from [<c05ad124>] 
(__platform_driver_register+0x40/0x54)
[<c05ad124>] (__platform_driver_register) from [<c0d3e89c>] 
(omap2_mcspi_driver_init+0x18/0x20)
[<c0d3e89c>] (omap2_mcspi_driver_init) from [<c0101b78>] 
(do_one_initcall+0x134/0x15c)
[<c0101b78>] (do_one_initcall) from [<c0d00ef8>] 
(kernel_init_freeable+0x1c4/0x280)
[<c0d00ef8>] (kernel_init_freeable) from [<c08c3480>] 
(kernel_init+0x18/0x11c)
[<c08c3480>] (kernel_init) from [<c0107798>] (ret_from_fork+0x14/0x3c)
---[ end trace 2ff68809195d7a1f ]---

=====

file = 
work-shared/beaglebone/kernel-source/arch/arm/boot/dts/am335x-boneblack.dts

I added inside &am33xx_pinmux  :

  /*Added by Riko Ho 5 July 2017 for SPI0 Enable BEGIN */
        spi0_pins: spi0_pins {
             pinctrl-single,pins = <
                        0x150 (PIN_OUTPUT_PULLUP | MUX_MODE0)
                        0x154 (PIN_INPUT_PULLUP | MUX_MODE0)
                        0x158 (PIN_INPUT_PULLUP | MUX_MODE0)
                        0x15C (PIN_OUTPUT_PULLUP | MUX_MODE0)
              >;
        };
    /*Added by Riko Ho 5 July 2017 for SPI0 Enable END */

and

// Added SPI0 node
&spi0 {
          status = "okay";
          pinctrl-names = "default";
          pinctrl-0 = <&spi0_pins>;
         spidev@0 {
                   spi-max-frequency = <24000000>;
                   reg = <0>;
                   compatible = "linux,spidev";
         };
};


at the end.

===========


On 06/07/17 11:30, Robert Nelson wrote:
> On Wed, Jul 5, 2017 at 7:03 PM, Riko Ho <antonius.riko@gmail.com> wrote:
>> Dear Meta TI Team Member,
>>
>> I want to use SPI0 and used kernel from yoc to. I have added SPI0 node patch
>> on bone*.Black.dts. I ll send later on for verifying. I m not on my dev
>> computer now.
>>
>> I can get dev/spidev1.0. did a loopback. It s running. But all 0000. There s
>> a bug when it was started booting. I ll show you later.
>> I ve checked the cable. Tested with Debian image, was working.
> This fixes that bug: (aka the spi maintainer believes what we are
> doing with the spidev node is wrong..)
>
> https://github.com/RobertCNelson/ti-linux-kernel-dev/blob/ti-linux-4.4.y/patches/reverts/0001-Revert-spi-spidev-Warn-loudly-if-instantiated-from-D.patch
>
> Regards,
>

-- 
*

/*******/
Sent by Ubuntu LTS 16.04,
Kind regards,
Riko Ho
/*******/

*

--------------0EB087ACA1AA670D1E941CE4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Dear Meta TI Yocto Team Member/ Robert,<br>
    </p>
    Ok, thanks for the fixes. <br>
    For that fix, only add into spidev.c, and use linux-yocto kernel,
    without using ti kernel ?<br>
    <p>Here's what I got :</p>
    <p>====</p>
    <p>SPI0 Bug :<br>
      spidev spi1.0: buggy DT: spidev listed directly in DT<br>
      ------------[ cut here ]------------<br>
      WARNING: CPU: 0 PID: 1 at
/home/bianchi77/poky/build/tmp/work-shared/beaglebone/kernel-source/drivers/spi/spidev.c:758
      spidev_probe+0x74/0x1c8<br>
      Modules linked in:<br>
      CPU: 0 PID: 1 Comm: swapper Not tainted 4.10.9-yocto-standard #4<br>
      Hardware name: Generic AM33XX (Flattened Device Tree)<br>
      [&lt;c010f250&gt;] (unwind_backtrace) from [&lt;c010c0cc&gt;]
      (show_stack+0x20/0x24)<br>
      [&lt;c010c0cc&gt;] (show_stack) from [&lt;c04a450c&gt;]
      (dump_stack+0x20/0x28)<br>
      [&lt;c04a450c&gt;] (dump_stack) from [&lt;c012d734&gt;]
      (__warn+0xec/0x108)<br>
      [&lt;c012d734&gt;] (__warn) from [&lt;c012d820&gt;]
      (warn_slowpath_null+0x30/0x38)<br>
      [&lt;c012d820&gt;] (warn_slowpath_null) from [&lt;c0620e94&gt;]
      (spidev_probe+0x74/0x1c8)<br>
      [&lt;c0620e94&gt;] (spidev_probe) from [&lt;c061d1e0&gt;]
      (spi_drv_probe+0x98/0xb0)<br>
      [&lt;c061d1e0&gt;] (spi_drv_probe) from [&lt;c05ab304&gt;]
      (driver_probe_device+0x1fc/0x2c4)<br>
      [&lt;c05ab304&gt;] (driver_probe_device) from [&lt;c05ab574&gt;]
      (__device_attach_driver+0xa4/0xbc)<br>
      [&lt;c05ab574&gt;] (__device_attach_driver) from
      [&lt;c05a9688&gt;] (bus_for_each_drv+0x98/0xa0)<br>
      [&lt;c05a9688&gt;] (bus_for_each_drv) from [&lt;c05ab050&gt;]
      (__device_attach+0xac/0x114)<br>
      [&lt;c05ab050&gt;] (__device_attach) from [&lt;c05ab5a8&gt;]
      (device_initial_probe+0x1c/0x20)<br>
      [&lt;c05ab5a8&gt;] (device_initial_probe) from [&lt;c05aa5dc&gt;]
      (bus_probe_device+0x38/0x90)<br>
      [&lt;c05aa5dc&gt;] (bus_probe_device) from [&lt;c05a8814&gt;]
      (device_add+0x42c/0x510)<br>
      [&lt;c05a8814&gt;] (device_add) from [&lt;c061e3d0&gt;]
      (spi_add_device+0xf4/0x158)<br>
      [&lt;c061e3d0&gt;] (spi_add_device) from [&lt;c061e85c&gt;]
      (of_register_spi_device+0x2a0/0x304)<br>
      [&lt;c061e85c&gt;] (of_register_spi_device) from
      [&lt;c061eea4&gt;] (spi_register_master+0x3fc/0x4ac)<br>
      [&lt;c061eea4&gt;] (spi_register_master) from [&lt;c061ef98&gt;]
      (devm_spi_register_master+0x44/0x78)<br>
      [&lt;c061ef98&gt;] (devm_spi_register_master) from
      [&lt;c0628068&gt;] (omap2_mcspi_probe+0x26c/0x368)<br>
      [&lt;c0628068&gt;] (omap2_mcspi_probe) from [&lt;c05ad1e4&gt;]
      (platform_drv_probe+0x60/0xac)<br>
      [&lt;c05ad1e4&gt;] (platform_drv_probe) from [&lt;c05ab304&gt;]
      (driver_probe_device+0x1fc/0x2c4)<br>
      [&lt;c05ab304&gt;] (driver_probe_device) from [&lt;c05ab458&gt;]
      (__driver_attach+0x8c/0xb8)<br>
      [&lt;c05ab458&gt;] (__driver_attach) from [&lt;c05a95b4&gt;]
      (bus_for_each_dev+0x90/0xa0)<br>
      [&lt;c05a95b4&gt;] (bus_for_each_dev) from [&lt;c05aacd8&gt;]
      (driver_attach+0x28/0x30)<br>
      [&lt;c05aacd8&gt;] (driver_attach) from [&lt;c05aa8b0&gt;]
      (bus_add_driver+0x184/0x1f4)<br>
      [&lt;c05aa8b0&gt;] (bus_add_driver) from [&lt;c05ac0a8&gt;]
      (driver_register+0xb0/0xf0)<br>
      [&lt;c05ac0a8&gt;] (driver_register) from [&lt;c05ad124&gt;]
      (__platform_driver_register+0x40/0x54)<br>
      [&lt;c05ad124&gt;] (__platform_driver_register) from
      [&lt;c0d3e89c&gt;] (omap2_mcspi_driver_init+0x18/0x20)<br>
      [&lt;c0d3e89c&gt;] (omap2_mcspi_driver_init) from
      [&lt;c0101b78&gt;] (do_one_initcall+0x134/0x15c)<br>
      [&lt;c0101b78&gt;] (do_one_initcall) from [&lt;c0d00ef8&gt;]
      (kernel_init_freeable+0x1c4/0x280)<br>
      [&lt;c0d00ef8&gt;] (kernel_init_freeable) from [&lt;c08c3480&gt;]
      (kernel_init+0x18/0x11c)<br>
      [&lt;c08c3480&gt;] (kernel_init) from [&lt;c0107798&gt;]
      (ret_from_fork+0x14/0x3c)<br>
      ---[ end trace 2ff68809195d7a1f ]---</p>
    <p>=====</p>
    <p>file =
work-shared/beaglebone/kernel-source/arch/arm/boot/dts/am335x-boneblack.dts<br>
    </p>
    <p>I added inside &amp;am33xx_pinmux  :</p>
    <p> /*Added by Riko Ho 5 July 2017 for SPI0 Enable BEGIN */<br>
             spi0_pins: spi0_pins {<br>
                  pinctrl-single,pins = &lt;<br>
                             0x150 (PIN_OUTPUT_PULLUP | MUX_MODE0)<br>
                             0x154 (PIN_INPUT_PULLUP | MUX_MODE0)<br>
                             0x158 (PIN_INPUT_PULLUP | MUX_MODE0)<br>
                             0x15C (PIN_OUTPUT_PULLUP | MUX_MODE0)<br>
                   &gt;;<br>
             };<br>
         /*Added by Riko Ho 5 July 2017 for SPI0 Enable END */ <br>
    </p>
    <p>and</p>
    <p>// Added SPI0 node<br>
      &amp;spi0 {<br>
               status = "okay";<br>
               pinctrl-names = "default";<br>
               pinctrl-0 = &lt;&amp;spi0_pins&gt;;<br>
              spidev@0 {<br>
                        spi-max-frequency = &lt;24000000&gt;;<br>
                        reg = &lt;0&gt;;<br>
                        compatible = "linux,spidev";<br>
              };<br>
      };</p>
    <p><br>
    </p>
    <p>at the end.</p>
    <p>===========<br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 06/07/17 11:30, Robert Nelson wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAOCHtYi1Ce-5=_fTuL2s+pC16VSbnYX6TR6QJD5gq_bpFn7kPQ@mail.gmail.com">
      <pre wrap="">On Wed, Jul 5, 2017 at 7:03 PM, Riko Ho <a class="moz-txt-link-rfc2396E" href="mailto:antonius.riko@gmail.com">&lt;antonius.riko@gmail.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Dear Meta TI Team Member,

I want to use SPI0 and used kernel from yoc to. I have added SPI0 node patch
on bone*.Black.dts. I ll send later on for verifying. I m not on my dev
computer now.

I can get dev/spidev1.0. did a loopback. It s running. But all 0000. There s
a bug when it was started booting. I ll show you later.
I ve checked the cable. Tested with Debian image, was working.
</pre>
      </blockquote>
      <pre wrap="">
This fixes that bug: (aka the spi maintainer believes what we are
doing with the spidev node is wrong..)

<a class="moz-txt-link-freetext" href="https://github.com/RobertCNelson/ti-linux-kernel-dev/blob/ti-linux-4.4.y/patches/reverts/0001-Revert-spi-spidev-Warn-loudly-if-instantiated-from-D.patch">https://github.com/RobertCNelson/ti-linux-kernel-dev/blob/ti-linux-4.4.y/patches/reverts/0001-Revert-spi-spidev-Warn-loudly-if-instantiated-from-D.patch</a>

Regards,

</pre>
    </blockquote>
    <br>
    <div class="moz-signature">-- <br>
      <b>
        <p style="color:blue;"> /*******/<br>
          Sent by Ubuntu LTS 16.04,<br>
          Kind regards,<br>
          Riko Ho<br>
          /*******/<br>
        </p>
      </b></div>
  </body>
</html>

--------------0EB087ACA1AA670D1E941CE4--
