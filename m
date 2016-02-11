Return-Path: <winiston@futuraautomation.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ACC2DE00B9C; Thu, 11 Feb 2016 01:42:15 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_LOW,
	STOX_REPLY_TYPE autolearn=ham version=3.3.1
X-Spam-HAM-Report: *  0.4 STOX_REPLY_TYPE STOX_REPLY_TYPE
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.174 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7624BE00ADD
	for <meta-ti@yoctoproject.org>; Thu, 11 Feb 2016 01:42:12 -0800 (PST)
Received: by mail-pf0-f174.google.com with SMTP id x65so26900111pfb.1
	for <meta-ti@yoctoproject.org>; Thu, 11 Feb 2016 01:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:cc:references:in-reply-to:subject:date
	:mime-version:content-type:content-transfer-encoding:importance
	:disposition-notification-to;
	bh=wrrvUtdSBp3vlgmRKmQaj8zMQ9RZ49T4kn2OcryVEwc=;
	b=MN6kKtf4FZYFHU9/Ty1FJ5ilCy/g1tfc21jKzKMPv0tJiSoLCO60xSnOvxBMbve/aI
	CRZ9QPdqJjWoqwp1YSCNZBeHOxT7hyk37ks1z4y7zfKpAc18css4sbBU9v04CTijDJJD
	QFmNyxV/1Ug0/zmR8W6g3Hj70wGzsHIAKNZXiFjSm0RVM6FoZjyv1bLnxVAOf7mYc4E0
	9YTV8zKs2W9jWy92aBXVcl1cqk9gwJXFRjjZXwMPqUF13fDnzuEtbOgE1zqBwOHUzHto
	dtGyQ6waQAkvkmwO8FqgNHB/NFGHOvbn2ijNY4eX/f3HvX1BR0rzXNdvFKL+Zip/8M2W
	K1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:cc:references:in-reply-to
	:subject:date:mime-version:content-type:content-transfer-encoding
	:importance:disposition-notification-to;
	bh=wrrvUtdSBp3vlgmRKmQaj8zMQ9RZ49T4kn2OcryVEwc=;
	b=WUJ8MGilbdTECUSAoWGGJ+8fhdoEcA7U9BGPf7xdf2YqX74TMd9b28su1NJf3PbMf7
	iJqpOQ0nOQN8PQAPmUugrxL8qzHsjW2/CK8rE2BsquDXN9Qmls8sY3N+d/aD7OIldo2u
	lVJmtEqHx3pkgRmjrpYJs4v3K0+P68r1HFFMDU28TSQzCk4Ot2PcMa1UrHB6T6T+nu39
	l3uppAlytWSvYogghKBg68qAphGFhF4uTqUDQh0HmyYZsWj1MQX3Hlsw6Eo/dwrhjY1P
	RdBaitucIhjO7DpFYevETB71s8FCsiFWQ7RlHbpd+J1QzT0L1gJT75eeWVQFAC9EbpOO
	8n6g==
X-Gm-Message-State: AG10YOSvpgrOdUwObs0LCUMbHF2PZkvBS41VaKiIwR4HjHW3fOanFUbE4HDKJXMi/Aaxjg==
X-Received: by 10.98.18.215 with SMTP id 84mr65555372pfs.131.1455183731899;
	Thu, 11 Feb 2016 01:42:11 -0800 (PST)
Received: from RD3 ([59.99.236.185]) by smtp.gmail.com with ESMTPSA id
	r26sm10907453pfb.21.2016.02.11.01.42.08
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Feb 2016 01:42:10 -0800 (PST)
Message-ID: <E3FD66DB97154B088C817E7FA321C392@RD3>
From: <winiston@futuraautomation.com>
To: "Anders Darander" <anders@chargestorm.se>
References: <7A144FD2E22B42C29D1455BA473BACE1@RD3>
	<CAMKF1spT+uLPxQJvRFjjTxtXN4crg34a4cQw=Q8TJ9iYLLZHCg@mail.gmail.com>
	<28AA3DBF5F3343948A98AC47A80A2AA7@RD3>
	<20160128073854.GC7112@ad.chargestorm.se>
	<A6BAB694CCB64D07B1F044525E64943D@RD3>
	<20160128105332.GF7112@ad.chargestorm.se>
In-Reply-To: <20160128105332.GF7112@ad.chargestorm.se>
Date: Thu, 11 Feb 2016 15:16:11 +0530
MIME-Version: 1.0
X-Priority: 1
X-MSMail-Priority: High
Importance: High
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Cc: meta-ti@yoctoproject.org
Subject: Re: Build Error for AM437x-evm
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
X-List-Received-Date: Thu, 11 Feb 2016 09:42:15 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit

Dear,

Thank you very much .Now I am able to build core-image-minimal and 
qt4e-demo-image. Now the problem is, USB mouse is not working in 
qt4e-demo-image.

What could be issue? How do I make usb mouse  to work?



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


