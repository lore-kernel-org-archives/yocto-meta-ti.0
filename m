Return-Path: <winiston@futuraautomation.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 29E94E00B9E; Fri, 29 Jan 2016 01:31:40 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_LOW,
	STOX_REPLY_TYPE autolearn=ham version=3.3.1
X-Spam-HAM-Report: *  0.4 STOX_REPLY_TYPE STOX_REPLY_TYPE
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.44 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 89334E00A92
	for <meta-ti@yoctoproject.org>; Fri, 29 Jan 2016 01:31:36 -0800 (PST)
Received: by mail-pa0-f44.google.com with SMTP id uo6so39427376pac.1
	for <meta-ti@yoctoproject.org>; Fri, 29 Jan 2016 01:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:cc:references:in-reply-to:subject:date
	:mime-version:content-type:content-transfer-encoding:importance
	:disposition-notification-to;
	bh=ztDYGwGvpmo3+GWuVUR8ZcMcXY/xXUBTw/p/+C0DIgk=;
	b=VHlcaPOjsFFfdlCpGJkplRXb+mhrKsnLtr+qNgcYWzkNY2EpS1k/9QB9ldtueeXat+
	fRlBkLJ70w01m5rM0Vj2Nu/FfKPFmCWa4h2qtyMEH1BslGlEWyhZHizuZkSH+SnBXtXi
	LOjdYBXFegwM6HcAft+ybg+1buFdXLFzaaxWRqqxRe6CcE1BdkYwy3KOPP31NSsS6eHl
	i5K5rTpjb5RXTwY2sLa8+bClO6mrihOS8ED01Kw9bwRp5iTuPtktTICA8PX0pnFraonS
	9ju1zlnOydEcqTXMbNTe5hw2TYVxQGJ15DW2zzhtdBiTDLnc+M2NW9lKzeafb0oK816W
	/H0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:cc:references:in-reply-to
	:subject:date:mime-version:content-type:content-transfer-encoding
	:importance:disposition-notification-to;
	bh=ztDYGwGvpmo3+GWuVUR8ZcMcXY/xXUBTw/p/+C0DIgk=;
	b=kzbC9N2LwXAX0Wb3Qktzo8PfohzmNWO/WzntQ3MLGAQfUqTPjwFqBMVcyxxLoZ5+vQ
	zLwPGiPo51OgwtDgfl5auXJmEHvgR5GwIGwP76hQn/APENHc29GtmS6qNcgMdY0KazUc
	96nwcgWeqUySeOKxC8m9ALNkR1UmW54bqGqV24Bk3Jv73vGtzw2OsUqiYZKwXxUbWc0O
	P/8QganPYUmL999CRwOsmov6DFgxaBYXzUcJSqLLeQ+mFPszq3osLPTPAowMTi9HYnP/
	arAjYVzQm3uqpKmvvg5p3PpUJ9xCrmsdR+XtXGfbUhjYTEJTL3l8GHzTFQ9O+1FpbJYp
	XGCg==
X-Gm-Message-State: AG10YOQDvEtgUM/VxRyX5l8WDKVcPh+vLz2nuBfogezp/czCLl3QMyFvVd66+WLAWkOIXQ==
X-Received: by 10.66.90.166 with SMTP id bx6mr11994703pab.75.1454059896519;
	Fri, 29 Jan 2016 01:31:36 -0800 (PST)
Received: from RD3 ([59.99.236.185])
	by smtp.gmail.com with ESMTPSA id 89sm22176187pfi.2.2016.01.29.01.31.33
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 01:31:34 -0800 (PST)
Message-ID: <2AFC5582316B4C93B712EE539488A3B5@RD3>
From: <winiston@futuraautomation.com>
To: "Anders Darander" <anders@chargestorm.se>
References: <7A144FD2E22B42C29D1455BA473BACE1@RD3>
	<CAMKF1spT+uLPxQJvRFjjTxtXN4crg34a4cQw=Q8TJ9iYLLZHCg@mail.gmail.com>
	<28AA3DBF5F3343948A98AC47A80A2AA7@RD3>
	<20160128073854.GC7112@ad.chargestorm.se>
	<A6BAB694CCB64D07B1F044525E64943D@RD3>
	<20160128105332.GF7112@ad.chargestorm.se>
In-Reply-To: <20160128105332.GF7112@ad.chargestorm.se>
Date: Fri, 29 Jan 2016 15:05:47 +0530
MIME-Version: 1.0
X-Priority: 1
X-MSMail-Priority: High
Importance: High
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Cc: meta-ti@yoctoproject.org
Subject: Re: Image write Error for AM437x-evm
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
X-List-Received-Date: Fri, 29 Jan 2016 09:31:40 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit

Dear,

I tried to write the image on the sd card, It spit out the error.   I am 
using sd card reader. In the device tree, card reader detected as /dev/sdb 
& /dev/sde and  sd card detected as /dev/sde1 , /dev/sde2 & /dev/sde3     . 
Please see the below output.

winiston@winiston-VirtualBox:~/poky/build$ sudo 
$HOME/poky/scripts/contrib/mkefidisk.sh /dev/sde 
\tmp/deploy/images/am437x-evm/core-image-minimal-am437x-evm.tar.bz2 /dev/sda
Image details
    image: 
'tmp/deploy/images/am437x-evm/core-image-minimal-am437x-evm.tar.bz2' -> 
'core-image-minimal-am437x-evm-20160129065004.rootfs.tar.bz2'
     size: 2180726 bytes
modified: 2016-01-29 12:21:04.000000000 +0530
     type: bzip2 compressed data, block size = 900k

Device details
  device: /dev/sde
  vendor: Multiple
   model: Flash Reader
    size: 16088301568 bytes

Prepare EFI image on /dev/sde [y/N]? y

Boot partition size:   20 MB (/dev/sde1)
ROOTFS partition size: 15264 MB (/dev/sde2)
Swap partition size:   804 MB (/dev/sde3)

Partitioning installation media (/dev/sde)
Formatting partitions
Failed to mount 
tmp/deploy/images/am437x-evm/core-image-minimal-am437x-evm.tar.bz2
Failed to mount rootfs.img
Preparing boot partition
Failed to copy vmlinuz
Failed to copy EFI dir
No EFI bootloader configuration found
winiston@winiston-VirtualBox:~/poky/build$

What could be the problem? How do I solve this issue?

Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291
-----Original Message----- 
From: Anders Darander
Sent: Thursday, January 28, 2016 4:23 PM
To: winiston@futuraautomation.com
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] Build Error for AM437x-evm

* winiston@futuraautomation.com <winiston@futuraautomation.com> [160128 
10:00]:
> -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding  -Os
> -fno-stack-protector -fno-delete-null-pointer-checks -g -fstack-usage
> -Wno-format-nonliteral -Werror=date-time -D__ARM__ -Wa,-mimplicit-it=always
> -mthumb -mthumb-interwork -mabi=aapcs-linux -mword-relocations
> -mno-unaligned-access -ffunction-sections -fdata-sections -fno-common
> -ffixed-r9 -msoft-float -pipe -march=armv7-a    -D"KBUILD_STR(s)=#s"
> -D"KBUILD_BASENAME=KBUILD_STR(xhci_omap)"
> -D"KBUILD_MODNAME=KBUILD_STR(xhci_omap)" -c -o 
> drivers/usb/host/xhci-omap.o
> drivers/usb/host/xhci-omap.c
> | drivers/usb/host/xhci-omap.c:34:5: error: 'board_usb_init' aliased to
> external symbol '__board_usb_init'
> |  int board_usb_init(int index, enum usb_init_type init)
> |      ^

This is the interesting part! (You could likely have search for error to
narrow it done).

The issue is a typical when when compiling older code with GCC 5.

Though, I would've thought that building u-boot-2015.07 with jethro was
working...

Here's a patch for your issue:
http://lists.denx.de/pipermail/u-boot/2015-October/229099.html

Cheers,
Anders

> | make[1]: *** [drivers/usb/host/xhci-omap.o] Error 1
> | make: *** [drivers/usb/host] Error 2
> | WARNING: exit code 1 from a shell command.
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile (log file is located at 
> /home/winiston/poky/build/tmp/work/am437x_evm-poky-linux-gnueabi/u-boot-ti-staging/2015.07+gitAUTOINC+2b4b6fb691-r16/temp/log.do_compile.23933)
> ERROR: Task 73
> (/home/winiston/meta-ti/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb,
> do_compile) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 1910 tasks of which 1909 didn't need to be
> rerun and 1 failed.
> No currently running tasks (1909 of 2055)

> Summary: 1 task failed:
>  /home/winiston/meta-ti/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb,
> do_compile
> Summary: There were 2 ERROR messages shown, returning a non-zero exit 
> code.
> winiston@winiston-VirtualBox:~/poky/build$


-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB 


