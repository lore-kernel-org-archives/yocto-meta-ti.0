Return-Path: <fabio@bertux.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B7D12E00803; Sun, 31 Aug 2014 13:08:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.171 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B9D9E00572
	for <meta-ti@yoctoproject.org>; Sun, 31 Aug 2014 13:08:02 -0700 (PDT)
Received: by mail-vc0-f171.google.com with SMTP id id10so4654312vcb.16
	for <meta-ti@yoctoproject.org>; Sun, 31 Aug 2014 13:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=/xJelor4oHDT5e5Y1zDdg195dFUga71jKPcImVf6wcM=;
	b=nL+BnCeF0kdlwTJqjACsax9fkhyA9/6WrVTcd0W0gZ/1iTUVPRMpRHH5gKLVQ111nX
	ugm9LW0f/V3VtelSZZ8JkLAc77Z4bONaSBqXg4il7hcyc75Dik3n22HUgK7OWxUL8eHy
	5HlxNYLRyDkal7ATAQS+of+J5tXgXotYRj5z/ZHDRVtkg7rCy9Q1M80CIndepOq2ca/h
	iax5CqsH9NJV7YczVdO8H3qM1JEilWEnNySvTEWesh+dtVuHC8elp8B3S0g4QMT9j7UD
	wyathMlQ1TvYqHE54NvfQrxMGf/qO0G6xg7V76QyCnPZ+RRskA7Eqj7jQnrdSMcmNe5S
	Ddog==
X-Gm-Message-State: ALoCoQnf8qAeZmrhtFH9MhR6tbRZX8a7oPhNOsWXMah7+QJpTEL2Ll1oJqyyHeSayrH0wn2QVQ5B
X-Received: by 10.52.245.66 with SMTP id xm2mr17105002vdc.36.1409515681305;
	Sun, 31 Aug 2014 13:08:01 -0700 (PDT)
Received: from [192.168.1.4] ([177.4.198.151]) by mx.google.com with ESMTPSA id
	o10sm18372907vdb.24.2014.08.31.13.08.00
	for <meta-ti@yoctoproject.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Aug 2014 13:08:00 -0700 (PDT)
Message-ID: <5403809E.3000703@bertux.com>
Date: Sun, 31 Aug 2014 17:07:58 -0300
From: Fabio Berton <fabio@bertux.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <mailman.3.1409511601.29045.meta-ti@yoctoproject.org>
In-Reply-To: <mailman.3.1409511601.29045.meta-ti@yoctoproject.org>
Subject: Re: BeagleBoard C4 with USB
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
X-List-Received-Date: Sun, 31 Aug 2014 20:08:07 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Try to install the packages bellow:

kernel-modules
usbutils


On 08/31/2014 04:00 PM, meta-ti-request@yoctoproject.org wrote:
> Send meta-ti mailing list submissions to
> 	meta-ti@yoctoproject.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
> 	https://lists.yoctoproject.org/listinfo/meta-ti
> or, via email, send a message with subject or body 'help' to
> 	meta-ti-request@yoctoproject.org
>
> You can reach the person managing the list at
> 	meta-ti-owner@yoctoproject.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of meta-ti digest..."
>
>
> Today's Topics:
>
>     1. [nightly] Distroless meta-ti/master minimal build
>        2014-08-30_21-00-30 (Denys Dmytriyenko)
>     2. BeagleBoard C4 with USB (Rudolf Streif)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Sat, 30 Aug 2014 21:58:30 -0400
> From: Denys Dmytriyenko <denys@ti.com>
> To: <meta-ti@yoctoproject.org>
> Subject: [meta-ti] [nightly] Distroless meta-ti/master minimal build
> 	2014-08-30_21-00-30
> Message-ID: <1330147917.535.1409450310755.JavaMail.jenkins@puget>
> Content-Type: text/plain; charset="us-ascii"
>
> An HTML attachment was scrubbed...
> URL: <http://lists.yoctoproject.org/pipermail/meta-ti/attachments/20140830/406dab3a/attachment-0001.html>
>
> ------------------------------
>
> Message: 2
> Date: Sun, 31 Aug 2014 07:48:09 -0700
> From: Rudolf Streif <rstreif@linuxfoundation.org>
> To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
> Subject: [meta-ti] BeagleBoard C4 with USB
> Message-ID:
> 	<CA+gsK-okuyjWuEp+3bm6++ojWrDfaCPwXtXEOswu7Xikxg8jfA@mail.gmail.com>
> Content-Type: text/plain; charset="utf-8"
>
> I have a BeagleBoard C4 laying around that I want to use for a project that
> has USB devices connected to it. I built a core-image-base with YP from
> master and meta-ti from master with this configuration:
>
> Build Configuration:
> BB_VERSION        = "1.23.1"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Fedora-18"
> TARGET_SYS        = "arm-poky-linux-gnueabi"
> MACHINE           = "beagleboard"
> DISTRO            = "poky"
> DISTRO_VERSION    = "1.6+snapshot-20140831"
> TUNE_FEATURES     = "arm armv7a vfp thumb neon callconvention-hard cortexa8"
> TARGET_FPU        = "vfp-neon"
> meta
> meta-yocto
> meta-yocto-bsp    = "master:c16795477ea7e2159b5d3808268912b572887e2d"
> meta-ti           = "master:d2c40099cd219493e4a6d9a6218f88f1b9f3f8fb"
> meta-oe           = "master:1513d0e31f609ffcde9a116a50bfb0360b9e7ecf"
>
> It builds fine. I am installing u-boot, kernel and the device tree on the
> SSD card.
>
> I use this u-boot script to boot the board:
>
> setenv bootcmd 'mmc init; fatload mmc 0:1 0x80300000 uImage; fatload mmc
> 0:1 0x815f0000 beagle.dtb; bootm 0x80300000 - 0x815f0000'
> setenv bootargs 'console=tty0 console=ttyO2,115200n8 root=/dev/mmcblk0p2
> rootwait rootfstype=ext3 ro'
> boot
>
> In the above beagle.dtb =  uImage--3.14.8-r0-omap3-beagle-<date>.dtb which
> I assumed to be the correct one for the C4 because the other dtb created
> has xM explicitly in its name.
>
> The system boots fine but USB is not working. None of the typical USB host
> controller initialization is in the dmesg output and lsusb responds with
> 'unable to initialize libsub: -99'.
>
> I am not sure if I am doing anything wrong or if there is an actual issue.
> Help appreciated.
>
> Cheers,
> Rudi
> -------------- next part --------------
> An HTML attachment was scrubbed...
> URL: <http://lists.yoctoproject.org/pipermail/meta-ti/attachments/20140831/fc724dcd/attachment-0001.html>
>
> ------------------------------
>


