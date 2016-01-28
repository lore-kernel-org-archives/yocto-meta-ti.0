Return-Path: <anders@chargestorm.se>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 629ACE00BE6; Wed, 27 Jan 2016 23:39:14 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.215.52 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1A046E00838
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 23:38:58 -0800 (PST)
Received: by mail-lf0-f52.google.com with SMTP id s81so21419408lfd.0
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 23:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:organization:user-agent;
	bh=QNe8nFoaWeQmm/1vBoyAlOyzIYKhSqiJ4AAKL0uaxks=;
	b=A7+tWEe6BJ/Xx6FiFQywp5rWSZ5n7Vng3nPwbOXLQXA6VEWjoFBP1HG9yna/2OLSBn
	gofFca0V0ENSCul5l9rNskT7xRogcqCTPH1RQLlA5Fi+7FtL161au3CkcqztjT8d+vxb
	1rpSidUxtq4cP/nfIERHk+8hTJJiAcuygobUItDCCbGKhhi+MRGEgPi5pCReMwM9Dk2b
	4yL4g+3PfEBoyqOyI0gbOV0b7CdFdTIcarP3U4cXsL1zoIjgH+ZV7+BeUqlnVeeC99VO
	pd2OhR04XWnQBQx7hlVy+xdpig2HgklpeEx9xma+ePOrPLgA85Gcb3mpHj7O8BX15G9q
	3Lxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=QNe8nFoaWeQmm/1vBoyAlOyzIYKhSqiJ4AAKL0uaxks=;
	b=bNQhxb2A2KWzie0UEqnhv/dENQogtkAONZwh+JfoiBccjodyttC5KT0xpfuu62yBam
	zgyLnhIFdWpDzlQUbdxHfFJKfJHa7MYch8Dlm6LXMbJnBT76QflxUjNq8CESkqPb8Glr
	4VoFXkIV+CeHTSH7Vkw+CovDNLUSMNaSocb1DeyGkC/67ALkpGIJlKa3lBRcj49GwOfp
	Ul/ouEQPfRXRP6AfmrZhk9OcSy74BZJmyA124LW8k2gzUTKHp5sumhqmLd1c8IlesY47
	6YmhYBEqM6tSRw3I88Sg9G3pnIfZxVk4+7p9eytvBFO4KcMAMVzMs85LKeXs5/7+Zq/X
	mDww==
X-Gm-Message-State: AG10YOTo9edWl3V8aasQ8UZIcUpD/sBQaKp4jO8HGki8h6L0xlO2dOrjaE8WbVdeRlWeug==
X-Received: by 10.25.18.25 with SMTP id h25mr435217lfi.165.1453966736912;
	Wed, 27 Jan 2016 23:38:56 -0800 (PST)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by smtp.gmail.com with ESMTPSA id tv1sm1271258lbb.4.2016.01.27.23.38.56
	for <meta-ti@yoctoproject.org> (version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jan 2016 23:38:56 -0800 (PST)
Date: Thu, 28 Jan 2016 08:38:54 +0100
From: Anders Darander <anders@chargestorm.se>
To: meta-ti@yoctoproject.org
Message-ID: <20160128073854.GC7112@ad.chargestorm.se>
Mail-Followup-To: meta-ti@yoctoproject.org
References: <7A144FD2E22B42C29D1455BA473BACE1@RD3>
	<CAMKF1spT+uLPxQJvRFjjTxtXN4crg34a4cQw=Q8TJ9iYLLZHCg@mail.gmail.com>
	<28AA3DBF5F3343948A98AC47A80A2AA7@RD3>
MIME-Version: 1.0
In-Reply-To: <28AA3DBF5F3343948A98AC47A80A2AA7@RD3>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Thu, 28 Jan 2016 07:39:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* winiston@futuraautomation.com <winiston@futuraautomation.com> [160128 07:17]:
> BB_VERSION        = "1.28.0"
> BUILD_SYS         = "i686-linux"
> NATIVELSBSTRING   = "Ubuntu-14.04"
> TARGET_SYS        = "arm-poky-linux-gnueabi"
> MACHINE           = "am437x-evm"
> DISTRO            = "poky"
> DISTRO_VERSION    = "2.0.1"
> TUNE_FEATURES     = "arm armv7a vfp thumb neon callconvention-hard cortexa9"
> TARGET_FPU        = "vfp-neon"
> meta              
> meta-yocto        = "jethro:b9ad87b18fd7a664b8d5e385ffb09496c679036c"
> meta-ti           = "master:963c35fc490a733a533c0c30471f9974eed451d6"

Good that this info is provided.


> NOTE: Preparing RunQueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: oe_runmake failed
> ERROR: Function failed: do_compile (log file is located at /home/winiston/poky/build/tmp/work/am437x_evm-poky-linux-gnueabi/u-boot-ti-staging/2015.07+gitAUTOINC+2b4b6fb691-r16/temp/log.do_compile.18321)
> ERROR: Logfile of failure stored in: /home/winiston/poky/build/tmp/work/am437x_evm-poky-linux-gnueabi/u-boot-ti-staging/2015.07+gitAUTOINC+2b4b6fb691-r16/temp/log.do_compile.18321
> Log data follows:
> Huge log data resides here.... at the end of log data, it is showing the error as follows,
> 
> | make[1]: *** [drivers/usb/host/xhci-omap.o] Error 1

You just cut the log prior after the actual error. The line above just
confirms that make has seen that something went wrong.

Could you provide the error? 

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

