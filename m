Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E089CE008A5; Mon, 18 Jan 2016 21:43:04 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_00,DEAR_SOMETHING,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (raj.khem[at]gmail.com)
	*  2.0 DEAR_SOMETHING BODY: Contains 'Dear (something)'
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.177 listed in list.dnswl.org]
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C9E45E0045F
	for <meta-ti@yoctoproject.org>; Mon, 18 Jan 2016 21:43:01 -0800 (PST)
Received: by mail-ig0-f177.google.com with SMTP id t15so70181614igr.0
	for <meta-ti@yoctoproject.org>; Mon, 18 Jan 2016 21:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ElP979UvvhgUFdsolifczo+7r3B/syRM5uIlZ5/3BGU=;
	b=Msyqkoop0mLfhuq0CI1WoovvrUIyaV2ygxTrzv1Hn7D/sRGVnLU3dej9Llsz69Wvt2
	sGuSa5RyIc/b0VCVm6XaeTkj/9MbfAkwzt9jgolWEFldxwoUq05dJTCZNOghq9AsFXwW
	llSzLzM8vsh1wvP6ReKttt2eM69tHJ98bTkS0fvbQ7rixUcCRtq4AtOjVs/heXASInYJ
	TYeUNOwTef6vdHKHxcw0uDq++O3/7CCvJ/30mTODVxwD1B2WnyO1+zBWBZHj1KICyERT
	VOa5xYs3O9629CWtiPich7mcd1n+h+EwbLXIzgvmEOlafSUDyBNtg4iGVQcxSG0dXiiL
	egpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ElP979UvvhgUFdsolifczo+7r3B/syRM5uIlZ5/3BGU=;
	b=bVK/AcqO8pOKWbMCld/FkSpqGxJfJyI/9y5yjyvY6w5+XMw1ySxICxA1ZlMmTRHPV2
	g8B7LHyegvHXZtzZ24YM65L9U6RooNBBKbWOlqzF8HPm+2ANuWPNgjuVFt+W6qhE9TBh
	goj3Eupb1ZS7blqJHAbfaf7Fm4B25zNmCRmuUcAKSo/JOW2z1fq5Chgquuh2+JkODa7y
	oEstlpRSSr9rSQRYVqtVqWYK380exDP06MVJNcxy8p9CwKD/T6syjSx03pOLZKek0ym/
	/+DUR3mCoFYvO1uSa891H+QanUrCyikBJTszbrHuM/PsUVDpaJQr1oiswu3Mca1NdcAQ
	waFw==
X-Gm-Message-State: AG10YOSG988PexHsEEMoQ8xduLrRuaGNdzFOIOZRUENo2Ziep667wBnnpXXjAiCbahD6FFR0KdwitaMeYmp4BA==
X-Received: by 10.50.171.200 with SMTP id aw8mr14925423igc.77.1453182180853;
	Mon, 18 Jan 2016 21:43:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Mon, 18 Jan 2016 21:42:31 -0800 (PST)
In-Reply-To: <010D464DD7F94DAB8203AA5BF850771E@RD3>
References: <010D464DD7F94DAB8203AA5BF850771E@RD3>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Jan 2016 21:42:31 -0800
Message-ID: <CAMKF1sqNBo_a-TCoNE7qULy_JdGaDp7Kx8QqotYa0M_UpUV6zQ@mail.gmail.com>
To: winiston@futuraautomation.com
Cc: yocto texas <meta-ti@yoctoproject.org>
Subject: Re: Regarding Texas AM437x with yocto project
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
X-List-Received-Date: Tue, 19 Jan 2016 05:43:04 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 18, 2016 at 8:38 PM,  <winiston@futuraautomation.com> wrote:
> Dear Sir/Madam,
>
> I plan to use Yocto project in our new project. Our development system is
> Texas based AM437X.  I am new to yocto project. How do I start the project?
> Note : We are keen to develop embedded linux with navit (Navigation software
> ).
>

There are good documentation and tutorials

e.g.

https://www.yoctoproject.org/documentation
https://www.yoctoproject.org/tools-resources/videos
https://www.yoctoproject.org/tools-resources/training
https://www.yoctoproject.org/tools-resources/presentations

> Regards,
> Winiston.P
> Futura Automation Pvt Ltd.
>
> Ph :91-80-28375290 / 28375295
> Fax :91-80-28375291
>
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>

