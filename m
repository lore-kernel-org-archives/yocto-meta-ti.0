Return-Path: <anders@chargestorm.se>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B9F7EE009C5; Thu, 28 Jan 2016 02:53:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.217.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 16591E00928
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 02:53:36 -0800 (PST)
Received: by mail-lb0-f169.google.com with SMTP id cl12so21160725lbc.1
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 02:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:organization:user-agent;
	bh=IrJN0L3MzPvl9voeTsxNoSrndFmyE++sYkLSlR8QFDM=;
	b=Lgm/eWzqmV2SsyNPPeX7qdcbKf74xssMoolfoLMY1PG7yZnNUgQ6UmX7WhHMUIdk2c
	ekDwrygV4+cyfOn65s4Mujzie5rlX6hhLHcq+x+nX2avtJdbuCD8Z6L60a3AMPSSh0Rx
	sgekEu1QevptnOFkXpVWSgNlM7yP4ig0sn0QkVuW5o+lWzlzht/nJTJctQGZvrMn0X9V
	ZVmWwe2kBWeDWQaR6X0wCL8xHMOmaiJ9BKxFsUPAf1lydb3qcWx4pDdFJQ1HcApXvbW1
	7wc3spNMN5czySCTfcNBFDB0ZMZ+U3SLkIFh485JrBvp73JjGud/9+HzPtnWPUcvtCIF
	6aQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:organization:user-agent;
	bh=IrJN0L3MzPvl9voeTsxNoSrndFmyE++sYkLSlR8QFDM=;
	b=Vz7QJ620yIFJqG8XfGercpRzR70LTctWWzhV63d1xu0/zrw1hqSkTUeFC32yqOfKHc
	qk6GTDGzPwhHubotAlOd3m/1emvZjmh+2r2fEI49yFn98UXEkZovr0Nl2XfTCzLQ8dss
	AoOO9++WvfYdoYoaYMoE3SRH84pf5rwBnoC6An5E9Ii0tFPqJbQ1vPcLO6Lj9wqGbPNZ
	FMn61VDQ4rfvVmc7SgFt+j9lYeu0MMqsKFAf4jN23iUymW6P0dCvk6gOHIXq5S0BhU0c
	n9KgTqpKU9xrF5lJZnOH+8VwZczFSkIu75KCQcRXmhIK87T+T8kW4Q76iYxyr+Jfj65c
	TReA==
X-Gm-Message-State: AG10YOQHZQlTnBu/uYM7K1sPcbesfUOz9QS7m0g4U2+mJIU++h8hg/CPG5z7/fNB2BDpTg==
X-Received: by 10.112.72.168 with SMTP id e8mr894035lbv.114.1453978414792;
	Thu, 28 Jan 2016 02:53:34 -0800 (PST)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by smtp.gmail.com with ESMTPSA id a67sm1386965lfe.6.2016.01.28.02.53.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jan 2016 02:53:33 -0800 (PST)
Date: Thu, 28 Jan 2016 11:53:32 +0100
From: Anders Darander <anders@chargestorm.se>
To: winiston@futuraautomation.com
Message-ID: <20160128105332.GF7112@ad.chargestorm.se>
Mail-Followup-To: winiston@futuraautomation.com, meta-ti@yoctoproject.org
References: <7A144FD2E22B42C29D1455BA473BACE1@RD3>
	<CAMKF1spT+uLPxQJvRFjjTxtXN4crg34a4cQw=Q8TJ9iYLLZHCg@mail.gmail.com>
	<28AA3DBF5F3343948A98AC47A80A2AA7@RD3>
	<20160128073854.GC7112@ad.chargestorm.se>
	<A6BAB694CCB64D07B1F044525E64943D@RD3>
MIME-Version: 1.0
In-Reply-To: <A6BAB694CCB64D07B1F044525E64943D@RD3>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Thu, 28 Jan 2016 10:53:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* winiston@futuraautomation.com <winiston@futuraautomation.com> [160128 10:00]:
> -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding  -Os
> -fno-stack-protector -fno-delete-null-pointer-checks -g -fstack-usage
> -Wno-format-nonliteral -Werror=date-time -D__ARM__ -Wa,-mimplicit-it=always
> -mthumb -mthumb-interwork -mabi=aapcs-linux -mword-relocations
> -mno-unaligned-access -ffunction-sections -fdata-sections -fno-common
> -ffixed-r9 -msoft-float -pipe -march=armv7-a    -D"KBUILD_STR(s)=#s"
> -D"KBUILD_BASENAME=KBUILD_STR(xhci_omap)"
> -D"KBUILD_MODNAME=KBUILD_STR(xhci_omap)" -c -o drivers/usb/host/xhci-omap.o
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
> | ERROR: Function failed: do_compile (log file is located at /home/winiston/poky/build/tmp/work/am437x_evm-poky-linux-gnueabi/u-boot-ti-staging/2015.07+gitAUTOINC+2b4b6fb691-r16/temp/log.do_compile.23933)
> ERROR: Task 73
> (/home/winiston/meta-ti/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb,
> do_compile) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 1910 tasks of which 1909 didn't need to be
> rerun and 1 failed.
> No currently running tasks (1909 of 2055)

> Summary: 1 task failed:
>  /home/winiston/meta-ti/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb,
> do_compile
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
> winiston@winiston-VirtualBox:~/poky/build$


-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

