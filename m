Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 93709E004D2; Wed,  8 Mar 2017 09:03:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,LONGWORDS,RCVD_IN_DNSWL_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (raj.khem[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.83.43 listed in list.dnswl.org]
	*  2.0 LONGWORDS Long string of long words
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 552FBE0030B
	for <meta-ti@yoctoproject.org>; Wed,  8 Mar 2017 09:03:34 -0800 (PST)
Received: by mail-pg0-f43.google.com with SMTP id 187so15227061pgb.3
	for <meta-ti@yoctoproject.org>; Wed, 08 Mar 2017 09:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=bUgRQfZoSBJiCWjq59rwI39hDdYkGS/POJptaZz8AkU=;
	b=XlIauewPAOglbi8ugvB8MV+qiu3vSfPbMvpoxB3irRSwDzZixwuR/zS9LrUFdf3W40
	xQtsgLAM2Y1tv+5R5E1zCFWc9AJjgCypZnxIDA3pJXybLPvKnwaF71SrkPtXACFxj9l+
	rZ8eehJNvPzBD6UB+cvWl0sVbxgVRheU4D8yfKdwD27nT51UZY11vrBzBTOhHxIfWVNr
	rjsuNOBXxoEZ3GW4V7X1U8y1fBai8FSAwkcef/LzCDr0eiYUOV/rXMBdPQonXnar0RgZ
	YxpHTVtu4XnlNyoUMYL1jxZZzJyJxjtrP4QAxc0k3fkO/IzDrOsAGcPDLL+HJAJeCzUM
	bbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=bUgRQfZoSBJiCWjq59rwI39hDdYkGS/POJptaZz8AkU=;
	b=qUi99rzu0fY0bZSZNSkOi3TTogALXy1CSUVBxJzKoJkDtH6lQCL9uziRnD1EmMMkd0
	GfUO2ousDmUKGCkq6Ny7bXQ/IS/um+CGrPvdtelRxpv3YGgTNhPPVe3xmuDGkn0defLF
	lemCyKJx6cCoL2bewq9BnjFg3ZpEdrkpyo/JVsg69lbG1fJ9Z0xi53zSjUznJaAMXWGf
	yAJv2N2OJ5KGD8XGFtHXoT8y4QMfeYht6oLJjcmm96cn0XRDcg+mAYhvGDbkB6mxMiTG
	sgLWN0BI12yvTkRNf1nsACUWuJuKoK77Lb8YiBIPEhbLZhyOuJJt/pQlRDJZnl9lyMWJ
	vDeg==
X-Gm-Message-State: AMke39m8HptM3AAG4RsQKalwsCizmWMxyhBmzPgs1aY7oQicMOuEii0JhKaQCFWOuo8HUg==
X-Received: by 10.99.157.2 with SMTP id i2mr8108932pgd.139.1488992614406;
	Wed, 08 Mar 2017 09:03:34 -0800 (PST)
Received: from haswell (c-76-102-32-192.hsd1.ca.comcast.net. [76.102.32.192])
	by smtp.gmail.com with ESMTPSA id
	78sm7281954pfm.122.2017.03.08.09.03.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Mar 2017 09:03:33 -0800 (PST)
Date: Wed, 8 Mar 2017 09:03:28 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20170308170328.GA2586@haswell>
References: <c8ccbb2d-d31b-7f5c-e002-afe69980dd86@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <c8ccbb2d-d31b-7f5c-e002-afe69980dd86@mlbassoc.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: meta-ti@yoctoproject.org
Subject: Re: Getting TI tools into [host] SDK
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
X-List-Received-Date: Wed, 08 Mar 2017 17:03:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 17-03-08 09:10:18, Gary Thomas wrote:
> I'm trying to build a [host] SDK for my target which uses some
> TI tools, via -c populate_sdk_ext
> 
> In particular, I'm using recipes-ti/devtools/ti-cgt-pru_2.1.4.bb
> I include ti-cgt-pru-native to use the tools in my bitbake recipes - that works fine.
> I include ti-cgt-pru in my target image to get the tools on my board - that also works.
> 
> The problem is that in my SDK, none of the binaries are included, including clpru:
> 
> $ ls -l /home/gthomas/my_ti_sdk/tmp/sysroots/rainier-p8701/usr/share/ti/cgt-pru
> total 16
> drwxrwxr-x 2 gthomas gthomas 12288 Mar  8 08:22 include
> drwxrwxr-x 3 gthomas gthomas  4096 Mar  8 08:22 lib
> 
> I added this to try and include the files:
>   TOOLCHAIN_HOST_TASK += "'nativesdk-ti-cgt-pru"
> and I can see that there was a nativesdk-ti-cgt-pru built which does have all the
> executables included, they just aren't being packaged.
> 
> $ ls tmp/work/x86_64-nativesdk-mysdk-linux/nativesdk-ti-cgt-pru/2.1.4-r0/image/opt/mydistro/2.2+snapshot/sysroots/x86_64-amltdsdk-linux/usr/share/ti/cgt-pru/bin

perhaps you need to correct the install location for nativesdk may be
via overriding do_install

> abspru    arpru   cgpru     clpru   dispru    hexpru  libinfopru  nmpru   optpru    xrefpru
> acpiapru  asmpru  clistpru  dempru  embedpru  ilkpru  lnkpru      ofdpru  strippru
> 
> Any ideas on what I need to do to get the binary executables into my SDK?
> 
> Note: I copied just those (bin) files into my SDK target sysroot usr/bin and the compiler
> runs just fine.  I just need to figure out the recipe magic to make this happen.
> 
> Thanks
> 
> -- 
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

